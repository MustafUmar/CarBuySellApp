
package service;

import model.Order;
import dao.OrderDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class OrderService {
    
    @Autowired
    private OrderDAO orderdao;
    
    public List<Order> customerPendingOrders(int custid) {
        return orderdao.getCustomerOrder(custid);
    }
    
    public boolean updateOrder(String key) {
        boolean ok = orderdao.updatePayment(key);
        return ok;
    }
    
    
}
