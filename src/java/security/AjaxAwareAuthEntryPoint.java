/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.stereotype.Component;

/**
 *
 * @author MustiU
 */

public class AjaxAwareAuthEntryPoint extends LoginUrlAuthenticationEntryPoint implements Serializable {
    
    private static List<String> uris = new ArrayList<>(
            Arrays.asList("/user/prepare-order","/mg/couriers")
    );
    
    public AjaxAwareAuthEntryPoint(String loginFormUrl) {
        super(loginFormUrl);
    }
    
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) 
            throws IOException, ServletException {
        
//        request.getRequestURI().startsWith("/api/secured");
        
        if (uris.stream().anyMatch(uri -> request.getRequestURI().contains(uri))) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
        } else {
            super.commence(request, response, authException);
        }
        
//        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
//            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
//        } else {
//            super.commence(request, response, authException);
//        }
    }
    
}
