/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.SearchDAO;
import java.util.List;
import model.Car;
import model.CarDetail;
import model.Model;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class SearchService {
    
    @Autowired
    private SearchDAO searchDAO;
    
    public List<CarDetail> searchresult(String query) {
        List<CarDetail> result = searchDAO.search(query);
        for (CarDetail carDetail : result) {
            Hibernate.initialize(carDetail.getModel().getCar());
        }
        return result;
    }
    
    
    public void buildIndex() throws InterruptedException {
        searchDAO.buildIndex();
    }
    
}
