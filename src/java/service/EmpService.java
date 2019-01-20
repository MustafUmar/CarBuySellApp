
package service;

import dao.EmpDAO;
import java.util.List;
import model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class EmpService {
    
    @Autowired
    private EmpDAO empdao;
    
    public List<Employee> employees() {
        return empdao.employees();
    }
    
    public List<Employee> empByBranch(int brid) {
        return empdao.empByBranch(brid);
    }
    
    public List<Employee> couriers(int brid) {
        List<Employee> emp = empdao.branchCouriers(brid);
        for (Employee employee : emp) {
            employee.setDeliveries(null);
        }
        return emp;
    }
    
    
    public Employee employee(int id) {
        return empdao.getEmployee(id);
    }
    
    
}
