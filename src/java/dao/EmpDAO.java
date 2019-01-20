/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Employee;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author MustiU
 */
@Repository
public class EmpDAO {
    
    @Autowired
    private SessionFactory sessfactory;
    
    public List<Employee> employees() {
        return sessfactory.getCurrentSession().createQuery(
            "from Employee e "+
            "join fetch e.branch b ", Employee.class)
        .list();
    }
    
    public List<Employee> empByBranch(int brid) {
        return sessfactory.getCurrentSession().createQuery(
            "from Employee e "+
            "join fetch e.branch b "+
            "where b.id = :br ", Employee.class)
        .setParameter("br", brid)
        .list();
    }
    
    public List<Employee> branchCouriers(int brid) {
        return sessfactory.getCurrentSession().createQuery(
            "from Employee e "+
            "join fetch e.branch b "+
            "where b.id = :br "+
            "and e.designation = 'courier'", Employee.class)
        .setParameter("br", brid)
        .getResultList();
    }
    
    
    public Employee getEmployee(int id) {
        return sessfactory.getCurrentSession().load(Employee.class, id);
    }
    
    
}
