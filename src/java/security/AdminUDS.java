/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import dao.AdminDAO;
import java.util.HashSet;
import java.util.Set;
import model.Admin;
import model.Manager;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author MustiU
 */
@Service
public class AdminUDS implements UserDetailsService {

    @Autowired
    AdminDAO adminDAO;
    
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = adminDAO.getUser(email);
        if(user == null)
            throw new UsernameNotFoundException("User not found");
        
        AdminPrincipal principal = null;
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));
        if(user.getRole().equals("ROLE_ADMIN")) {
            Admin admin = adminDAO.getAdmin(user.getUserid());
            principal = new AdminPrincipal<Admin>(
                    user.getUsername(), user.getPassword(), true, true, true, true,
                    grantedAuthorities, admin);
        }
        else if(user.getRole().equals("ROLE_MANAGER")) {
            Manager mg = adminDAO.getManager(user.getUserid());
            principal = new AdminPrincipal<Manager>(
                    user.getUsername(), user.getPassword(), true, true, true, true,
                    grantedAuthorities, mg);
        }
        else
            throw new UsernameNotFoundException("User not found");
            
        return principal;
        
//        return new org.springframework.security.core.userdetails.User(
//                user.getUsername(), user.getPassword(), grantedAuthorities
//        );
    }
    
}
