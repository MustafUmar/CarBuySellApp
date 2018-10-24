/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Admin;
import model.Manager;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Repository
@Transactional
public class AdminDAO {
    
    @Autowired
    private SessionFactory sessionfactory;
    
    public User getUser(String email) {
        User user = null;
        try {
            user = sessionfactory.getCurrentSession().createQuery(
                "select u from User u "+
                "where u.username = :username", User.class)
            .setParameter("username", email)
            .getSingleResult();
        } catch (Exception e) {
        }
        return user;
    }
    
    public Admin getAdmin(int id) {
        return sessionfactory.getCurrentSession().find(Admin.class, id);
    }
    
    
    public List<Manager> getManagers() {
        List<Manager> managers = sessionfactory.getCurrentSession().createQuery(
                "select m "+
                "from Manager m "+
                "join fetch m.branch b", Manager.class)
                .getResultList();
        return managers;
    }
    
    public Manager getManager(int id) {
        return sessionfactory.getCurrentSession().find(Manager.class, id);
    }
    
    public void createAdmin(Object cl, User user) {
        
        Session session = sessionfactory.getCurrentSession();
        boolean next = false;
        try {
            if(cl.getClass() == Admin.class) {
                Admin ad = (Admin) cl;
                session.save(ad);
                user.setUserid(ad.getId());
                user.setUsername(ad.getEmail());
                user.setRole("ROLE_ADMIN");
                next = true;
            }else if(cl.getClass() == Manager.class) {
                Manager mg = (Manager) cl;
                session.save(mg);
                user.setUserid(mg.getId());
                user.setUsername(mg.getEmail());
                user.setRole("ROLE_MANAGER");
                next = true;
            }

            if(user.getPassword() != null && next) {
                BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
                user.setPassword(bcrypt.encode(user.getPassword()));
                session.save(user);
            }
            
        } catch (Exception e) {
            System.out.println("No create");
//            session.getTransaction().rollback();
        } finally {
//            session.close();
        }
    }
}
