/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Employee;
import model.Manager;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Repository
@Transactional
public class ManagerDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void saveViews(int id, String data) {
        Manager mg = sessionFactory.getCurrentSession().find(Manager.class, id);
        System.out.println("id:"+id+"mg:"+mg);
        mg.setViews(data);
//        sessionFactory.getCurrentSession().update(mg);
    }
    
    public Map<String, Object[]> loadDashdata() {
        Map<String, Object[]> dashboard = new HashMap<>();
        dashboard.put("orders", countOrders());
        dashboard.put("delvs", countDeliveries());
        return dashboard;
    }
    
    public Object[] countOrders() {
        Query q = sessionFactory.getCurrentSession().createNativeQuery(
            "select count(case when order_status = 'PENDING' then 1 end) as pending_count, "+
            "count(case when order_status = 'CANCELED' and cancel_confirm = 0 then 1 end) as cancel_count "+
            "from orders");
        return (Object[])q.uniqueResult();
        
    }
    
    
    public Object[] countDeliveries() {
        Query q = sessionFactory.getCurrentSession().createNativeQuery(
            "select count(case when status = 'PENDING' then 1 end) as pending_count, "+
            "count(case when issue = 1  then 1 end) as issue_count "+
            "from order_delivery");
        return (Object[])q.uniqueResult();
    }
    
    
}
