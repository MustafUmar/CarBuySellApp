/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

/**
 *
 * @author MustiU
 */
public class CsrfProtection  implements RequestMatcher {
    
    private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/ext/**", null);
    
//    private AntPathRequestMatcher[] requestMatchers = {
//          new AntPathRequestMatcher("/login"),
//          new AntPathRequestMatcher("/logout"),
//          new AntPathRequestMatcher("/verify/**")
//      };

    @Override
    public boolean matches(HttpServletRequest hsr) {
        return !unprotectedMatcher.matches(hsr);
    }
    
}
