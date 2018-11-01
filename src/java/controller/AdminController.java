/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Admin;
import model.Branch;
import model.Manager;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;
import service.BranchService;
import vessel.FormModelList;
import vessel.FormModelObj;

/**
 *
 * @author MustiU
 */
@Controller
@RequestMapping(value = "admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    @Autowired
    private BranchService branchService;
    
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
        return "redirect:/admin/dashboard";
    }
    
    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String managers(ModelMap model) {
        List<Manager> managers = adminService.managers();
        model.addAttribute("managers", managers);
        return "admin/managers";
    }
    
    
    @RequestMapping(value = "/manager/create", method = RequestMethod.GET)
    public String createManager(HttpSession session, ModelMap model) {
        List<Branch> branches = branchService.all();
        int brin = -1;
        session.setAttribute("branches", branches);
        model.addAttribute("mg", new Manager());
        model.addAttribute("user", new User());
        model.addAttribute("brin", new FormModelObj<Integer>(-1));
        return "admin/managerform";
    }
//    public ModelAndView createManager(HttpSession session, ModelAndView model) {
//        FormModelList formModel = new FormModelList();
//        formModel.setMg(new Manager());
//        formModel.setUser(new User());
//        session.setAttribute("branches", branchService.all());
////        formModel.setBranchlist(branchService.all());
//        formModel.setBrin(-1);
//        model.addObject("mgform",formModel);
//        model.setViewName("admin/managerform");
//        
//        return model;
//    }
    
    @RequestMapping(value = "/manager/new", method = RequestMethod.POST)
    public String newManager(
            HttpSession session, @ModelAttribute("mg") Manager mg,
            @ModelAttribute("user") User user, @ModelAttribute("brin") FormModelObj<String> brin) {
        System.out.println(mg.getClass());
        System.out.println(user.getClass());
        System.out.println(brin);
        List<Branch> branches = (List<Branch>)session.getAttribute("branches");
        adminService.createManager(mg, user, Integer.parseInt(brin.getData()), branches);
        
        return "redirect:/admin/manager";
    }
    
//    @RequestMapping(value = "/manager/new", method = RequestMethod.POST)
//    public String newManager(HttpSession session, @ModelAttribute("mgform") FormModelList formModel) {
//        
//        System.out.println(formModel.getMg().getFirstname());
//        System.out.println(formModel.getUser().getPassword());
////        System.out.println(formModel.getBranchlist().get(formModel.getBrin() - 1).getName());
//        System.out.println("Branch: "+((List<Branch>)(session.getAttribute("branches"))).get(2).getName());
//        System.out.println(formModel.getBrin());
//        return "redirect:/admin/manager/create";
//    }
    
//    @InitBinder
//    public void initBinder(WebDataBinder dataBinder) {
//        dataBinder.setDisallowedFields(new String[]{"brin", "admin", "user"});
//        
//        // this will allow 500 size of array.
//        dataBinder.setAutoGrowCollectionLimit(500);
//    }
    
}
