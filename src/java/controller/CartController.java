
package controller;

import java.math.BigDecimal;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import model.CarDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import service.CarService;
import vessel.CartItem;
import vessel.ShoppingCart;
import java.util.List;
import vessel.CartInfo;

/**
 *
 * @author MustiU
 */
@RestController
//@EnableWebMvc
public class CartController {
    
    @Autowired
    private CarService carService;
//    @RequestMapping(value = "cart", headers = {"Accept=application/json"},
//            method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    @RequestMapping(value = "cart", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ShoppingCart getCart(HttpSession session) {
        ShoppingCart cart =(ShoppingCart) session.getAttribute("cart");
        if(cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
    
    @RequestMapping(value = "cart/add/{id}", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ShoppingCart addToCart(@PathVariable int id, HttpSession session) {
        ShoppingCart cart = null;
        CarDetail car = carService.car(id);
        if(car != null) {
            cart =(ShoppingCart) session.getAttribute("cart");
            if(cart != null) {
                CartItem item = new CartItem();
                item.setCarid(car.getId());
                item.setTypename(car.getName());
                item.setModelname(car.getModel().getName());
                item.setMake(car.getModel().getCar().getMake());
                item.setPrice(car.getPrice());
                item.setYear(car.getYear());
                cart.getCars().add(item);
                cart.setTotal(cart.getTotal().add(new BigDecimal(car.getPrice())));
                
                session.setAttribute("cart",cart);
            }
        }
        return cart;
    }
    
    @RequestMapping(value = "cart/remove/{id}", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public String removeItemCart(@PathVariable int id, HttpSession session) {
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Optional<CartItem> caritem = cart.getCars().stream().filter(item -> item.getCarid() == id).findFirst();
        if(caritem.isPresent()) {
            cart.getCars().remove(caritem.get());
            cart.setTotal(cart.getTotal().subtract(new BigDecimal(caritem.get().getPrice())));
            session.setAttribute("cart",cart);
        }
        return "remove";
    }
    
    @RequestMapping(value = "cart/clear", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public String clearCart(HttpSession session) {
         session.setAttribute("cart", new ShoppingCart());
         return "cleared";
    }
    
//    @RequestMapping(value = "/user/order" ,method = RequestMethod.POST)
//    public String placeOrder(CartInfo cart) {
//        System.out.println(cart.getTotal());
//        return "user/ordersuccess";
//    }
}
