/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import model.Admin;
import model.Employee;
import model.Manager;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;
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
    
    
    public Employee getEmployee(int id) {
        return sessionfactory.getCurrentSession().find(Employee.class, id);
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
            }else if(cl.getClass() == Employee.class) {
                Employee em = (Employee) cl;
                session.save(em);
                user.setUserid(em.getId());
                user.setUsername(em.getEmail());
                user.setRole("ROLE_EMPLOYEE");
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
    
    public boolean localSaveFile(String loc) {
        boolean success = false;
        List<Object[]> cars = sessionfactory.getCurrentSession().createNativeQuery(
            "select id, make from cars").list();
        List<Object[]> models = sessionfactory.getCurrentSession().createNativeQuery(
            "select id, carid, name from models").list();
        List<Object[]> branches = sessionfactory.getCurrentSession().createNativeQuery(
            "select id, name, address from branches").list();
        
        JSONArray jsoncars = new JSONArray(cars);
        JSONArray jsonmodels = new JSONArray(models);
        JSONArray jsonbranches = new JSONArray(branches);
        Path path1 = Paths.get(loc+"/carmakes.js");
        try(BufferedWriter f = Files.newBufferedWriter(path1, Charset.forName("UTF-8"))) {
            f.write("const carmakes = ");
            f.newLine();
            f.write(jsoncars.toString());
            f.newLine();
            f.write("define(function() { return carmakes })");
            success = true;
        } catch (Exception e) {
            System.out.println("Unable to write to carmakes");
            success = false;
            return success;
        }
        
        Path path2 = Paths.get(loc+"/carmodels.js");
        try(BufferedWriter f = Files.newBufferedWriter(path2, Charset.forName("UTF-8"))) {
            f.write("const carmodels = ");
            f.write(jsonmodels.toString());
            f.newLine();
            f.write("define(function() { return carmodels })");
            success = true;
        } catch (Exception e) {
            System.out.println("Unable to write to carmodels");
            success = false;
        }
        
        Path path3 = Paths.get(loc+"/branches.js");
        try(BufferedWriter f = Files.newBufferedWriter(path3, Charset.forName("UTF-8"))) {
//            f.write("\"");
            f.write(jsonbranches.toString());
//            f.write("\"");
            success = true;
        } catch (Exception e) {
            System.out.println("Unable to write to branches");
            success = false;
        }
        
        return success;
    }
    
}
