/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.CustomerService;

/**
 *
 * @author MustiU
 */
@Controller
public class CustomerController {
    
    @Autowired
    private CustomerService customerService;
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(ModelAndView model) {
        model.addObject("customer", new Customer());
        model.setViewName("register");
        return model;
    }
    
    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    public String newAccount(HttpServletRequest request, @ModelAttribute("customer") Customer customer) {
        customerService.register(request,customer);
        return "redirect:/home";
    }
    
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if(auth instanceof AnonymousAuthenticationToken)
            return "login";
//        else
//            return "home";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(){
       return "home";
    }
}
