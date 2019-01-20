/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.io.Serializable;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author MustiU
 */
public class AdminPrincipal<E> extends User implements Serializable {

    private E admin;
    
    public AdminPrincipal(String username, String password, boolean enabled, boolean accountNonExpired,
            boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
            E admin) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.admin = admin;
    }
    
//    public AdminPrincipal(String username, String password, boolean enabled, boolean accountNonExpired,
//            boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
//            String firstname, String lastname) {
//        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
//        this.firstname = firstname;
//        this.lastname = lastname;
//    }

    public E getAdmin() {
        return admin;
    }

    public void setAdmin(E admin) {
        this.admin = admin;
    }
}
