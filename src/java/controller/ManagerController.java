/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Car;
import model.CarDetail;
import model.Manager;
import model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import security.AdminPrincipal;
import service.CarService;
import service.ManagerService;
import vessel.CarModelList;
import vessel.FormModelList;

/**
 *
 * @author MustiU
 */
@Controller
@RequestMapping(value = "mg")
public class ManagerController {
    
    @Autowired
    private ManagerService mngservice;
    @Autowired
    private CarService carService;
    
    @RequestMapping(value = "dashboard", method = RequestMethod.GET)
    public String managers() {
        return "manager/dashboard";
    }
    
    @RequestMapping(value = "cars", method = RequestMethod.GET)
    public String cars(HttpSession session, ModelMap model) {
        List<Car> cars = carService.all();
        model.addAttribute("cars",cars);
        return "manager/carmakes";
    }
    
    @RequestMapping(value = "model/{id}", method = RequestMethod.GET)
    public String carmodels(@PathVariable("id") int carid, HttpSession session, ModelMap model) {
        Car car = carService.carmodel(carid);
        session.setAttribute("carid", carid);
        model.addAttribute("car", car);
        return "manager/models";
    }
    
    @RequestMapping(value = "model/{name}/{id}/create", method = RequestMethod.GET)
    public String createmodel(@PathVariable("name") String make, @PathVariable("id") int carid,
            HttpSession session, ModelMap model) {
        session.setAttribute("carid", carid);
        session.setAttribute("make", make);
        model.addAttribute("models", new CarModelList());
        return "manager/modelform";
    }
    
    @RequestMapping(value = "model/new", method = RequestMethod.POST)
    public String addModel(HttpSession session, @ModelAttribute("models") CarModelList cm) {
        String carid = session.getAttribute("carid").toString();
        carService.addmodel(carid, cm);
        return "redirect:/mg/model/"+carid;
    }
    
    @RequestMapping(value = "cars/{cname}/{mname}/{id}", method = RequestMethod.GET)
    public String carlist(@PathVariable("cname") String cname, @PathVariable("mname") String mname,
            @PathVariable("id") int id, HttpSession session, ModelMap model) {
        session.setAttribute("carname", cname);
        session.setAttribute("modelname", mname);
        Model modelcars = carService.carmodellist(id);
        model.addAttribute("modelcars", modelcars);
        return "manager/cars";
    }
    
    @RequestMapping(value = "car/{mname}/newmodel/{id}", method = RequestMethod.GET)
    public ModelAndView createCarWithDet(@PathVariable("id") int modid, HttpSession session, ModelAndView model) {
        session.setAttribute("modid", modid);
        model.addObject("newcarmodel", new CarDetail());
        model.setViewName("manager/cardetailsform");
        return model;
    }
    
    @RequestMapping(value = "carmodel/new", method = RequestMethod.POST)
    public String addCarWithDet(HttpSession session, @ModelAttribute("newcarmodel") CarDetail cardet, Authentication auth) {
        int modid = Integer.parseInt(session.getAttribute("modid").toString());
        String cname = session.getAttribute("carname").toString();
        String mname = session.getAttribute("modelname").toString();
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        int brid = mg.getBranch().getId();
        carService.addcar(brid, modid, cardet);
        if(cname == null)
            return "redirect:/mg/cars";
        else
            return "redirect:/mg/cars/"+cname+"/"+mname+"/"+modid;
    }
    
}

