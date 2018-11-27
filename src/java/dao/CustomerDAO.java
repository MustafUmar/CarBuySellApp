/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Address;
import model.CarOrder;
import model.Customer;
import model.Order;
import model.Payment;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author MustiU
 */
@Repository
public class CustomerDAO {
    
    @Autowired
    private SessionFactory sessionfactory;
    
    public void registerCustomer(Customer customer) {
        sessionfactory.getCurrentSession().save(customer);
    }
    
    public Customer getById(int id) {
        return sessionfactory.getCurrentSession().load(Customer.class, id);
    }
    
    
    public Customer getCustomerByUsername(String email) {
        Customer customer = null;
//        try {
            customer = sessionfactory.getCurrentSession().createQuery(
                    "select c from Customer c "+
                    "where c.email = :email", Customer.class)
                .setParameter("email", email)
                .uniqueResult();
//        } catch (Exception e) {
//        }
        
        return customer;
    }
    
    
    public void saveProfile(Customer cust) {
        Session sess = sessionfactory.getCurrentSession();
        Customer customer = getById(cust.getId());
        customer.setFirstname(cust.getFirstname());
        customer.setLastname(cust.getLastname());
        customer.setEmail(cust.getEmail());
        customer.setPhonenum(cust.getPhonenum());
        for (Address address : cust.getAddresses()) {
            customer.addAddress(address);
        }
//        customer.setAddresses(cust.getAddresses());
//        cust.setOrder(null);
        sess.clear();
        sess.saveOrUpdate(customer);
//        sessionfactory.getCurrentSession().merge(cust);
    }
    
    public Address getAddress(int id) {
        return sessionfactory.getCurrentSession().load(Address.class, id);
    }
    
    
    
    public Customer loadAddress(Customer cust) {
        Session sess = sessionfactory.getCurrentSession();
        List<Address> addresses = sess.createQuery(
                "select a from Address a "+
                "left join fetch a.customer c "+
                "where c.id = :custid", Address.class)
            .setParameter("custid", cust.getId())
            .list();
        cust.setAddresses(addresses);
        sess.clear();
        cust.setOrder(null);
        cust.setPassword(null);
        
        return cust;
    }
    
    public void deleteAddress(Address address) {
        sessionfactory.getCurrentSession().delete(address);
    }
    
    public void detachAddress(int addid, int custid) {
        sessionfactory.getCurrentSession().createNativeQuery(
                "UPDATE addresses "+
                "SET cust_id = :null, " +
                "prev_owner =  :custid")
            .setParameter("null", null)
            .setParameter("custid", custid)
            .executeUpdate();
    }
    
    public Payment persistPayment(Payment payment) {
        sessionfactory.getCurrentSession().persist(payment);
        return payment;
    }
    

    public int persistOrder(Order order) {
        sessionfactory.getCurrentSession().persist(order);
        return order.getId();
    }
    
    public Customer fetchOrders(Customer customer) {
        Session session = sessionfactory.getCurrentSession();
        Customer cust = session.load(Customer.class, customer.getId());
        Hibernate.initialize(cust.getOrder());
        for (Order order : cust.getOrder()) {
            Hibernate.initialize(order.getCarOrders());
            Hibernate.initialize(order.getPayment());
            for (CarOrder carOrder : order.getCarOrders()) {
                Hibernate.initialize(carOrder.getCardet().getModel().getCar());
            }
        }
        
        return cust;
//        return sessionfactory.getCurrentSession().createQuery(
//                "select o from Order o "+
//                "join o.customer c "+
//                "join fetch o.carOrders co "+
//                "join fetch co.cardet cd "+
//                "where c.id = :cid", Order.class)
//            .setParameter("cid", customer.getId())
//            .list();
    }
    
    public Order getOrder(int id) {
        return sessionfactory.getCurrentSession().load(Order.class, id);
    }
    
    public void updateOrder(Order order) {
        sessionfactory.getCurrentSession().update(order);
    }
    
    
}
