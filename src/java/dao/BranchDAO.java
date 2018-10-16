/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Branch;
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
    
    
}
