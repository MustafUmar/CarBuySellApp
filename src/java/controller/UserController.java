/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vessel.ShoppingCart;

/**
 *
 * @author MustiU
 */
@Controller
public class UserController {
    
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    
}
