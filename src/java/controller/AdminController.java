/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import model.Admin;
import model.Manager;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;

/**
 *
 * @author MustiU
 */
@Controller
@RequestMapping(value = "admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    @RequestMapping(value = "login", method=RequestMethod.GET)
    public String login() {
        return "admin/login";
    }
    
    @RequestMapping(value = "/dashboard", method=RequestMethod.GET)
    public String dashboard() {
        return "admin/dashboard";
    }
    
    @RequestMapping(value = "/create", method=RequestMethod.GET)
    public String create(ModelMap model) {
        model.addAttribute("admin", new Admin());
        model.addAttribute("user", new User());
        return "admin/create";
    }
    
    @RequestMapping(value = "/new", method=RequestMethod.POST)
    public String newuser(@ModelAttribute("admin") Admin admin, @ModelAttribute("user") User user) {
        adminService.create(admin, user);
        return "admin/dashboard";
    }
    
}
