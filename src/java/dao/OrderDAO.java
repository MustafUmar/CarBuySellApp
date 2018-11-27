
package dao;

import java.util.Date;
import java.util.List;
import model.Order;
import model.OrderStatus;
import model.Payment;
import model.StatusEnumType;
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
    
    public List<Order> getCustomerOrder(int custid) {
        return sessfactory.getCurrentSession().createQuery("select o from Order o "+
                "join fetch o.customerOrders cu "+
                "join fetch cu.cardetail c "+
                "join fetch c.model m "+
                "join fetch m.car "+
                "where o.customer.id = :cid "+
                "and o.orderStatus <> :stat",Order.class)
            .setParameter("cid", custid)
            .setParameter("stat", OrderStatus.COMPLETED)
            .list();
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
