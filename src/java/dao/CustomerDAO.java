/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Customer;
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
public class CustomerDAO {
    
    @Autowired
    private SessionFactory sessionfactory;
    
    public void registerCustomer(Customer customer) {
        sessionfactory.getCurrentSession().save(customer);
    }
    
    public Customer getCustomerByUsername(String email) {
        Customer customer = null;
        try {
            customer = sessionfactory.getCurrentSession().createQuery(
                    "select c from Customer c "+
                    "where c.email = :email", Customer.class)
                .setParameter("email", email)
                .getSingleResult();
        } catch (Exception e) {
        }
        
        return customer;
    }
    
}
