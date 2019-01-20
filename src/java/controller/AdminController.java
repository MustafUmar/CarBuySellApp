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
import model.Employee;
import model.Manager;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
@PropertySource(value= {"classpath:config/appconfig.properties"})
@RequestMapping(value = "admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    @Autowired
    private BranchService branchService;
    @Value("${asset.constants_path}")
    private String saveLoc;
    
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
    
    @RequestMapping(value = "/manager/new", method = RequestMethod.POST)
    public String newManager(
            HttpSession session, @ModelAttribute("mg") Manager mg,
            @ModelAttribute("user") User user, @ModelAttribute("brin") FormModelObj<String> brin) {
        List<Branch> branches = (List<Branch>)session.getAttribute("branches");
        adminService.createManager(mg, user, Integer.parseInt(brin.getData()), branches);
        
        return "redirect:/admin/manager";
    }
    
    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String employees(ModelMap model) {
        List<Employee> employees = branchService.employees();
        model.addAttribute("employees", employees);
        return "admin/employees";
    }
    
    @RequestMapping(value = "/employee/create", method = RequestMethod.GET)
    public String createEmployee(HttpSession session, ModelMap model) {
        List<Branch> branches = branchService.all();
        int brin = -1;
        session.setAttribute("branches", branches);
        model.addAttribute("em", new Employee());
        model.addAttribute("user", new User());
        model.addAttribute("brin", new FormModelObj<Integer>(-1));
        return "admin/employeeform";
    }
    
    @RequestMapping(value = "/employee/new", method = RequestMethod.POST)
    public String newEmployee(
            HttpSession session, @ModelAttribute("em") Employee em,
            @ModelAttribute("user") User user, @ModelAttribute("brin") FormModelObj<String> brin) {
        List<Branch> branches = (List<Branch>)session.getAttribute("branches");
        adminService.createEmployee(em, user, Integer.parseInt(brin.getData()), branches);
        
        return "redirect:/admin/employees";
    }
    
    @RequestMapping(value = "settings", method = RequestMethod.GET)
    public String Viewsettings() {
        return "admin/settings";
    }

    @RequestMapping(value="local-save", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody String localSave() {
        if(adminService.localSaveFile(saveLoc))
            return "success";
        else
            return "unsuccessful";
    }
    
    
//    @InitBinder
//    public void initBinder(WebDataBinder dataBinder) {
//        dataBinder.setDisallowedFields(new String[]{"brin", "admin", "user"});
//        
//        // this will allow 500 size of array.
//        dataBinder.setAutoGrowCollectionLimit(500);
//    }
    
}
