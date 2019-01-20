
package service;

import dao.DeliveryDAO;
import dao.EmpDAO;
import java.util.List;
import java.util.Map;
import model.BranchOrder;
import model.Employee;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */

@Service
@Transactional
public class DeliveryService {
    
    @Autowired
    private DeliveryDAO deliveryDAO;
    @Autowired
    private EmpDAO empdao;
    
    public Map<String,List<BranchOrder>> deliveries(int brid) {
        return deliveryDAO.deliveryList(brid);
    }
    
    public Order orderDelivery(int oid) {
        return deliveryDAO.getOrderDelivery(oid);
    }
    
    public void assignCourier(int did, List<Employee> emp, int empno) {
        Employee employee = null;
        if(empno - 1 >= 0 && empno < emp.size())
            employee = emp.get(empno - 1);
        deliveryDAO.assignCourier(did, employee);
    }
    
    public void changeCourier(int did, int eid) {
        Employee emp = empdao.getEmployee(eid);
        if(emp != null)
            deliveryDAO.assignCourier(did, emp);
    }
    
    public void cancelDelivery(int did) {
        deliveryDAO.cancelDelivery(did);
    }
    
    
}
