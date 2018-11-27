/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CarDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import model.Address;
import model.Car;
import model.CarDetail;
import model.Customer;
import model.CarOrder;
import model.Order;
import model.OrderDelivery;
import model.OrderStatus;
import model.Payment;
import model.StatusEnumType;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import security.CustomerUDS;
import tool.Randomizer;
import vessel.CartItem;
import vessel.Profile;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class CustomerService {
    
    @Autowired
    private CustomerDAO customerDAO;
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private CarDAO carDAO;
    
    
//    @Autowired
//    private CustomerUDS cusd;
    
//    @Autowired
//    private AuthenticationManager am;
    
    public void register(HttpServletRequest request, Customer customer) {
        BCryptPasswordEncoder bcrpt = new BCryptPasswordEncoder();
        customer.setPassword(bcrpt.encode(customer.getPassword()));
        customerDAO.registerCustomer(customer);
        try {
            request.login(customer.getEmail(), customer.getPassword());
        } catch (ServletException ex) {
            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Unable to login");
        }
    }
    
    public Customer loginCustomer(String email) {
        return customerDAO.getCustomerByUsername(email);
    }
    
    
    public Customer loadAddress(Customer cust) {
//        Hibernate.initialize(cust.getAddresses());
        Customer customer = customerDAO.loadAddress(cust);
        for (Address address : customer.getAddresses()) {
            address.setCustomer(null);
        }
        return customer;
    }

    public void saveProfile(Profile profile) {
        Customer cust = profile.getUser();
        for (Address add : profile.getDeletes()) {
            if(orderDAO.checkAddressDelivery(add.getId())) {
                customerDAO.detachAddress(add.getId(), cust.getId());
            } else {
                customerDAO.deleteAddress(add);
            }
            cust.removeAddress(add);
        }
        customerDAO.saveProfile(cust);
    }
    
    public boolean prepOrder(Customer customer, Map<String,String> orderinfo, String key, List<CartItem> cars, BigDecimal amount) {
        boolean valid = false;
        Address address = customerDAO.getAddress(Integer.parseInt(orderinfo.get("address")));
        
            Payment payment = new Payment();
            payment.setChid(key);
            payment.setStatus(StatusEnumType.PENDING);
            payment.setService(orderinfo.get("payment"));
            payment.setAmount(amount);
            payment.setCustomer(customer);
            
            payment = customerDAO.persistPayment(payment);
            
            Order order = new Order();
            order.setOrderDate(new Date());
            order.setOrderNumber(Randomizer.genNum());
            order.setTotalprice(amount);
            order.setOrderStatus(OrderStatus.PENDING);
            
            for (CartItem car : cars) {
                CarDetail c = carDAO.getCarById(car.getCarid());
                CarOrder carorder = new CarOrder();
                carorder.setCardet(c);
                carorder.setOrder(order);
                System.out.println();
//                order.addCarOrder(carorder);
                order.getCarOrders().add(carorder);
            }
            
            OrderDelivery delivery = new OrderDelivery();
            delivery.setAddress(address);
            delivery.setStatus(OrderStatus.PENDING);
            order.addDelivery(delivery);
            order.setCustomer(customer);
            order.setPayment(payment);
            
            int oid = customerDAO.persistOrder(order);
            if(oid > 0)
                valid = true;
        
        
        return valid;
        
    }
    
    public Customer loadOrders(Customer customer) {
//        Hibernate.initialize(customer.getOrder());
//        List<Order> orders = customerDAO.fetchOrders(customer);
//        customer.setOrder(orders);
        return customerDAO.fetchOrders(customer);
    }
    
    public void cancelOrder(int id, String reason) {
        Order order = customerDAO.getOrder(id);
        order.setOrderStatus(OrderStatus.CANCELED);
        order.setCancelReason(reason);
        customerDAO.updateOrder(order);
        
    }
    
    
    
}
