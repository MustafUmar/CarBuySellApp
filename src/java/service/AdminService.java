/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AdminDAO;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Service
public class AdminService {
    
    @Autowired
    private AdminDAO adminDAO;
    
    public void create(Object cl, User user) {
        adminDAO.createAdmin(cl, user);
    }
    
    
}
