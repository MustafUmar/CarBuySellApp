/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Car;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Repository
@Transactional
public class CarDAO {
    
    @Autowired
    private SessionFactory sessionfactory;
    
    public List<Car> getCars() {
        return sessionfactory.getCurrentSession().createQuery("from Car").list();
    }
    
    
}
