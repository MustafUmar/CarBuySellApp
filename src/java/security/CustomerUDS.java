/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import dao.CustomerDAO;
import java.util.HashSet;
import java.util.Set;
import model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 *
 * @author MustiU
 */
@Service
public class CustomerUDS implements UserDetailsService {
    
    @Autowired
    private CustomerDAO customerDAO;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Customer customer = customerDAO.getCustomerByUsername(email);
        if(customer == null)
            throw new UsernameNotFoundException("Invalid Credentials");
        
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//        for (Role role : user.getRoles()){
//            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
//        }
        return new org.springframework.security.core.userdetails.User(
                customer.getEmail(), customer.getPassword(), grantedAuthorities
        );
    }
    
}