/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Branch;
import model.Employee;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Repository
@Transactional
public class BranchDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public List<Branch> getBranches() {
        return sessionFactory.getCurrentSession().createQuery(
                    "from Branch", Branch.class)
                .getResultList();
    }
    
    public void create(Branch branch) {
        sessionFactory.getCurrentSession().save(branch);
    }
    
    public Branch getBranch(int id) {
        return sessionFactory.getCurrentSession().find(Branch.class, id);
    }
    
    public void update(Branch branch) {
        sessionFactory.getCurrentSession().update(branch);
    }
    
    public List<Employee> getEmployees() {
        List<Employee> employees = sessionFactory.getCurrentSession().createQuery(
                "select e "+
                "from Employee e "+
                "join fetch e.branch", Employee.class)
            .getResultList();
        return employees;
    }
    
    public List<Employee> employeesByBranch(int brid) {
        List<Employee> employees = sessionFactory.getCurrentSession().createQuery(
                "select e "+
                "from Employee e "+
                "join fetch e.branch b "+
                "where b.id = :br", Employee.class)
            .setParameter("br", brid)
            .getResultList();
        return employees;
    }
    
    public List<Employee> couriersByBranch(int brid) {
        List<Employee> employees = sessionFactory.getCurrentSession().createQuery(
                "select e "+
                "from Employee e "+
                "join fetch e.branch b "+
                "where b.id = :br and e.designation = 'courier'", Employee.class)
            .setParameter("br", brid)
            .getResultList();
        return employees;
    }
}
