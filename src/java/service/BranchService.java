/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.BranchDAO;
import java.util.List;
import model.Branch;
import model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author MustiU
 */
@Service
public class BranchService {
    
    @Autowired
    private BranchDAO branchDAO;
    
    public List<Branch> all() {
        return branchDAO.getBranches();
    }
    
    public Branch branch(int id) {
        return branchDAO.getBranch(id);
    }
    
    public void create(Branch branch) {
        branchDAO.create(branch);
    }
    
    public void update(Branch branch) {
        branchDAO.update(branch);
    }
    
    public List<Employee> employees() {
        return branchDAO.getEmployees();
    }
    
    public List<Employee> employeesByBranch(int brid) {
        return branchDAO.employeesByBranch(brid);
    }
    
    public List<Employee> courierBranch(int brid) {
        return branchDAO.couriersByBranch(brid);
    }
    
    
}
