
package dao;

import constants.StatusEnumType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.BranchOrder;
import model.Employee;
import model.Order;
import model.OrderDelivery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author MustiU
 */
@Repository
public class DeliveryDAO {
    
    @Autowired
    private SessionFactory sessfactory;
    
    public Map<String,List<BranchOrder>> deliveryList(int brid) {
        Map<String,List<BranchOrder>> deliveries = new HashMap<>();
        deliveries.put("pending", pendingDeliveries(brid));
        deliveries.put("awaiting", awaitingDeliveries(brid));
        deliveries.put("ongoing", ongoingDeliveries(brid));
        return deliveries;
    }
    
    public List<BranchOrder> pendingDeliveries(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.delivery d "+
                "left join fetch d.employee e "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status = 'PENDING' ", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(20)
            .list();
    }
    
    public List<BranchOrder> awaitingDeliveries(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.delivery d "+
                "left join fetch d.employee e "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status = 'AWAITING' ", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(21)
            .list();
    }
    
    public List<BranchOrder> ongoingDeliveries(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.delivery d "+
                "left join fetch d.employee e "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status = 'IN_PROGRESS' ", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(21)
            .list();
    }
    
    public List<BranchOrder> withdrawnDeliveries(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.delivery d "+
                "left join fetch d.employee e "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status = 'CANCELED' ", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(6)
            .list();
    }
    
    public List<BranchOrder> recentCompletedDeliveries(int brid) {
        return sessfactory.getCurrentSession().createQuery(
                "select bo from BranchOrder bo "+
                "join fetch bo.branch b "+
                "join fetch bo.order o "+
                "join fetch o.delivery d "+
                "left join fetch d.employee e "+
                "where b.id = :br "+
                "and bo.orderStatus = 'APPROVED' "+
                "and d.status = 'COMPLETE' ", BranchOrder.class)
            .setParameter("br", brid)
            .setMaxResults(6)
            .list();
    }
    
    public Order getOrderDelivery(int oid) {
        return sessfactory.getCurrentSession().createQuery(
                "select o from Order o "+
                "join fetch o.delivery d "+
                "join fetch d.address "+
                "left join fetch d.employee "+
                "where o.id = :or", Order.class)
            .setParameter("or", oid)
            .uniqueResult();
    }
    
    public void assignCourier(int did, Employee emp) {
        OrderDelivery od = sessfactory.getCurrentSession().load(OrderDelivery.class, did);
        od.setEmployee(emp);
        od.setStatus(StatusEnumType.AWAITING);
    }
    
    public void cancelDelivery(int did) {
        OrderDelivery od = sessfactory.getCurrentSession().load(OrderDelivery.class, did);
        od.setStatus(StatusEnumType.CANCELED);
    }

    
//    public void changeCourier(int did, Employee emp) {
//        OrderDelivery od = sessfactory.getCurrentSession().load(OrderDelivery.class, did);
//        od.setEmployee(emp);
//        od.setStatus(StatusEnumType.AWAITING);
//    }
    
}
