/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CarDAO;
import java.util.List;
import model.Car;
import model.CarDetail;
import model.Model;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vessel.CarModelList;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class CarService {
    
    @Autowired
    CarDAO carDAO;
    
    public List<Car> all() {
        return carDAO.getCars();
    }
    
    public Car carmodel(int id) {
        return carDAO.getModelsByCarId(id);
    }
    
    public void addmodel(String carid, CarModelList cm) {
//        Car car = carDAO.getCar(Integer.parseInt(carid));
//        for (String name : cm.getName()) {
//            if(!name.equals("") && name != null) {
//                Model model = new Model();
//                model.setName(name);
//                car.addModel(model);
//            }
//        }
//        carDAO.saveCarModels(car);
        carDAO.saveCarModels(Integer.parseInt(carid), cm);
    }
    
    public Model carmodellist(int modid) {
        return carDAO.getCarModelList(modid);
    }
    
    public List<CarDetail> carswithlimit() {
        List<CarDetail> cars = carDAO.getCarListWithLimit();
        for (CarDetail car : cars) {
            Hibernate.initialize(car.getModel().getCar());
        }
        return cars;
    }
    
    public CarDetail car(int id) {
        CarDetail car = carDAO.getCarById(id);
        Hibernate.initialize(car.getModel().getCar());
        return car;
    }
    
    
    
    public void addcar(int brid, int modid, CarDetail cardet) {
        carDAO.newCarDetail(brid, modid, cardet);
    }
    
    
    
    
}
