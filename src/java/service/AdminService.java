/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AdminDAO;
import java.util.List;
import model.Branch;
import model.Manager;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vessel.FormModelList;

/**
 *
 * @author MustiU
 */
@Service
public class AdminService {
    
    @Autowired
    private AdminDAO adminDAO;
    
    public List<Manager> managers() {
        return adminDAO.getManagers();
    }
    
    public void create(Object cl, User user) {
        adminDAO.createAdmin(cl, user);
    }
    
    public void createManager(Manager mg, User user, int brin, List<Branch> br) {
        if(brin - 1 >= 0) {
            mg.setBranch(br.get(brin - 1));
        }
        adminDAO.createAdmin(mg, user);
    }
    
}
