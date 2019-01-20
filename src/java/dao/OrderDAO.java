
package dao;

import java.util.Date;
import java.util.List;
import model.Order;
import constants.OrderStatus;
import model.Payment;
import constants.StatusEnumType;
import java.util.HashMap;
import java.util.Map;
import model.BranchOrder;
import model.CarOrder;
import model.Employee;
import model.Manager;
import model.OrderDelivery;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author MustiU
 */
@Repository
public class OrderDAO {
    
    @Autowired
    private SessionFactory sessfactory;
    
    public Map<String,List<BranchOrder>> orderList(int brid, List odv) {
        Map<String,List<BranchOrder>> orders = new HashMap<>();
        orders.put("pending", pendingOrders(brid));
        orders.put("approved", approvedOrders(brid));
        orders.put("canceled", canceledOrders(brid));
        orders.put("complete",  recentComplete(brid));
        if(odv != null)
            orders.put("viewed", recentViewOrders(brid, odv));
        return orders;
    }
    
    
    public List<BranchOrder> pendingOrders(int brid) {
        Session sess = sessfactory.getCurrentSession();
        List<BranchOrder> brorders = sess.createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "where bo.branch.id = :br "+
                "and bo.orderStatus = 'PENDING' "+
                "and o.orderStatus <> 'CANCELED' "+
                "order by o.orderDate", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(31)
            .list();

        return brorders;
    }
    
    public List<BranchOrder> approvedOrders(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "join fetch o.delivery d "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status <> 'COMPLETE' "+
                "order by bo.approveDenyDate desc", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(15)
            .list();
    }
    
    public List<BranchOrder> canceledOrders(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "join fetch o.delivery d "+
                "where b.id = :br "+
                "and (bo.orderStatus = 'CANCELED' "+
                "or o.orderStatus = 'CANCELED') "+
                "order by o.orderDate", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(15)
            .list();
    }
    
    public List<BranchOrder> recentViewOrders(int brid, List views) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "join fetch o.delivery d "+
                "where o.id in (:vw) "+
                "and b.id = :br", BranchOrder.class)
            .setParameter("vw", views)
            .setParameter("br", brid)
            .setMaxResults(6)
            .list();
    }
    
    public List<BranchOrder> recentComplete(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "join fetch o.delivery d "+
                "where b.id = :br "+
                "and bo.orderStatus = 'COMPLETE' "+
                "and  bo.completeDate >= current_date() - 2"+
                "order by o.orderDate desc", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(5)
            .list();
    }
    
    
    public Order order(int oid) {
        Order or = sessfactory.getCurrentSession().createQuery(
                "select o from Order o "+
                "join fetch o.branches b "+
                "where o.id = :or", Order.class)
            .setParameter("or", oid)
            .uniqueResult();
        
        return or;
    }
    
    
    public BranchOrder orderWithPackage(int oid, int brid) {
        
        BranchOrder brorder = sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.customer cu "+
                "join fetch o.payment p "+
                "join fetch o.delivery d "+
                "join fetch d.employee e "+
                "join fetch bo.carOrders c "+
                "where o.id = :or and "+
                "bo.branch.id = :br ", BranchOrder.class)
            .setParameter("or", oid)
            .setParameter("br", brid)
            .uniqueResult();
        
        Hibernate.initialize(brorder.getOrder().getDelivery().getAddress());
        for (CarOrder carOrder : brorder.getCarOrders()) {
            Hibernate.initialize(carOrder.getCardet().getModel().getCar());
        }

        return brorder;
    }
    
    public BranchOrder getBranchOrder(int brid) {
        return sessfactory.getCurrentSession().load(BranchOrder.class, brid);
    }
    
    
    
    public List<Order> getCustomerOrder(int custid) {
        return sessfactory.getCurrentSession().createQuery("select o from Order o "+
                "join fetch o.customerOrders cu "+
                "join fetch cu.cardetail c "+
                "join fetch c.model m "+
                "join fetch m.car "+
                "where o.customer.id = :cid "+
                "and o.orderStatus <> :stat", Order.class)
            .setParameter("cid", custid)
            .setParameter("stat", OrderStatus.COMPLETE)
            .list();
    }
    
    public BranchOrder approve(int oid, int brid, Manager mg) {
        Order order = order(oid);
        BranchOrder brorder = order.getBranches().stream().filter(bo -> bo.getId() == brid).findFirst().get();
        if(brorder != null) {
            brorder.setOrderStatus(OrderStatus.APPROVED);
            brorder.setOverseer(mg);
            brorder.setApproveDenyDate(new Date());
            if(order.getBranches().stream().allMatch(bo -> bo.getOrderStatus().equals(OrderStatus.APPROVED)))
                order.setOrderStatus(OrderStatus.APPROVED);
            else if(order.getBranches().stream().anyMatch(bo -> bo.getOrderStatus().equals(OrderStatus.APPROVED)))
                order.setOrderStatus(OrderStatus.PROCESSING);
            
            sessfactory.getCurrentSession().update(order);
        }

        System.out.println("BranchStat:"+brorder.getOrderStatus()+"Orderid:"+order.getId());

        return orderWithPackage(order.getId(), mg.getBranch().getId());
    }
    
    
    public List<Order> countPendingOrders() {
        return sessfactory.getCurrentSession().createQuery("select count(c) from Order "+
                "where o.orderstatus = :stat", Order.class)
                .setParameter("stat", OrderStatus.PENDING)
            .list();
    }
    
    public List<Order> countProcessingOrders() {
        return sessfactory.getCurrentSession().createQuery("select count(c) from Order "+
                "where o.orderstatus = :stat", Order.class)
            .setParameter("stat", OrderStatus.APPROVED)
            .list();
    }
    
    public boolean checkAddressDelivery(int addid) {
        return sessfactory.getCurrentSession().createQuery(
                "select o "+
                "from OrderDelivery o"+
                "join Address "+
                "where o.address.id = :address")
            .setParameter("address", addid)
            .setMaxResults(1)
            .uniqueResult() != null;
    }
    
    public Payment loadPaymentOrder(String key) {
        Payment payment = null;
        try {
            payment = sessfactory.getCurrentSession().createQuery(
                "select p from Payment p"+
                "join fetch order o "+
                "where p.chid = :key", Payment.class)
            .setParameter("key", key)
            .getSingleResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            payment = null;
        }
        return payment;
    }
    
    
    public boolean loadPayment(String key) {
        boolean ok = true;
        try {
            Payment payment = sessfactory.getCurrentSession().createQuery(
                "select p from Payment p"+
                "where chid = :chid", Payment.class)
            .setParameter("chid", key)
            .getSingleResult();
            payment.setStatus(StatusEnumType.PAID);
            payment.setPaymentDate(new Date());
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            ok = false;
        }
        
        return ok;
    }
    
    public boolean updatePayment(String key) {
        boolean ok = true;
        try {
//            Payment payment = sessfactory.getCurrentSession().createQuery(
//                "select p from Payment p"+
//                "where chid = :chid", Payment.class)
//            .setParameter("chid", key)
//            .getSingleResult();
            Payment payment = sessfactory.getCurrentSession().byNaturalId(Payment.class)
                    .using("chid", key).load();
            payment.setStatus(StatusEnumType.PAID);
            payment.setPaymentDate(new Date());
            sessfactory.getCurrentSession().update(payment);
            if(payment == null) throw new Exception("Payment not found");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            ok = false;
        }
        
        return ok;
    }
    
}
