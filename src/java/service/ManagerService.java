/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ManagerDAO;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author MustiU
 */
@Service
public class ManagerService {
    
    @Autowired
    private ManagerDAO mgdao;
    
    public Map<String, Object[]> dashData() {
        return mgdao.loadDashdata();
    }
    
}
