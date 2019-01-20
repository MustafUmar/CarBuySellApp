
package security;

import java.io.Serializable;
import java.util.Collection;
import model.Customer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
/**
 *
 * @author MustiU
 */
public class CustomerPrincipal extends User implements Serializable {
    
    private Customer user;
//    private String firstname;
//    private String lastname;
    
    public CustomerPrincipal(String username, String password, boolean enabled, boolean accountNonExpired,
            boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
            Customer user) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.user = user;
    }

    public Customer getUser() {
        return user;
    }

    public void setUser(Customer user) {
        this.user = user;
    }
    
    
}
