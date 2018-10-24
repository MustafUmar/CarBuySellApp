/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 *
 * @author MustiU
 */
public class AdminAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    
    
//implements AuthenticationSuccessHandler
//    @Override
//    public void onAuthenticationSuccess(HttpServletRequest hsr, HttpServletResponse hsr1, Authentication a) throws IOException, ServletException {
//        String role = a.getAuthorities().toString();
//        
//        String targetUrl = "";
//        if(role.contains("ROLE_ADMIN")) {
//            targetUrl = hsr.getContextPath()+"/admin/dashboard";
//        } else if(role.contains("ROLE_MANAGER")) {
//            targetUrl = hsr.getContextPath()+"/mg/dashboard";
//        }
//        hsr1.sendRedirect(hsr1.encodeURL(targetUrl));
//    }
    
    
    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().toString();
        
        String targetUrl = "";
        if(role.contains("ROLE_ADMIN")) {
            targetUrl = "/admin/dashboard";
        } else if(role.contains("ROLE_MANAGER")) {
            targetUrl = "/mg/dashboard";
        }
        return targetUrl;
    }
}
