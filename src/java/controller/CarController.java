/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.CarService;

/**
 *
 * @author MustiU
 */
@Controller
@RequestMapping(value = "/cars")
public class CarController {
   
    @Autowired
    private CarService carService;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView cars(ModelAndView model) {
        List<Car> cars = carService.all();
        model.addObject("cars",cars);
        model.setViewName("cars");
        return model;
    }
    
    
}
