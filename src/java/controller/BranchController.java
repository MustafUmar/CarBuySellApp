/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BranchDAO;
import java.util.List;
import model.Branch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import service.BranchService;

/**
 *
 * @author MustiU
 */
@Controller
public class BranchController {
    
    @Autowired
    private BranchService branchService;
    
    @RequestMapping(value = "/admin/branch", method = RequestMethod.GET)
    public ModelAndView branches(ModelAndView model) {
        List<Branch> branches = branchService.all();
        System.out.println(branches.get(0).getName());
        model.addObject("branches",branches);
        model.setViewName("admin/branch");
        return model;
    }
    
    @RequestMapping(value = "/admin/branch/create", method = RequestMethod.GET)
    public ModelAndView create(ModelAndView model) {
        model.addObject("branch", new Branch());
        model.setViewName("admin/branchform");
        return model;
    }
    
    @RequestMapping(value = "/admin/branch/new", method = RequestMethod.POST)
    public String add(@ModelAttribute Branch branch) {
        if (branch.getId() == 0) {
            branchService.create(branch);
        } else {
            branchService.update(branch);
        }
        
//        return "redirect:admin/branch";
        return "redirect:/admin/branch";
    }
    
    @RequestMapping(value = "/admin/branch/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") int id, ModelAndView model) {
        Branch branch = branchService.branch(id);
        model.addObject("branch", branch);
        model.setViewName("admin/branchform");
        return model;
    }
    
}
