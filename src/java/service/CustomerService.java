/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CustomerDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import security.CustomerUDS;

/**
 *
 * @author MustiU
 */
@Service
public class CustomerService {
    
    @Autowired
    private CustomerDAO customerDAO;
    
    @Autowired
    private CustomerUDS cusd;
    
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
    
//    public void login(String email, String password) {
//        UserDetails ud = cusd.loadUserByUsername(email);
//        UsernamePasswordAuthenticationToken upat = new UsernamePasswordAuthenticationToken(ud, password,ud.getAuthorities());
//        am.authenticate(upat);
//        if(upat.isAuthenticated()) {
//            SecurityContextHolder.getContext().setAuthentication(upat);
//        }
//    }
    
    
}
