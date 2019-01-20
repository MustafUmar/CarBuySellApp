/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CarDetail;
import model.Customer;
import model.Order;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import security.CustomerPrincipal;
import service.CustomerService;
import service.OrderService;
import vessel.CartItem;
import vessel.Payment;
import vessel.Profile;
import vessel.ShoppingCart;

/**
 *
 * @author MustiU
 */
@Controller
@PropertySource(value= {"classpath:config/appconfig.properties"})
public class CustomerController {
    
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderService orderService;
    @Value("${app.domain}")
    private String appContext;
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(ModelAndView model) {
        model.addObject("customer", new Customer());
        model.setViewName("register");
        return model;
    }
    
    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    public String newAccount(HttpServletRequest request, @ModelAttribute("customer") Customer customer) {
        customerService.register(request,customer);
        return "redirect:/home";
    }
    
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if(auth instanceof AnonymousAuthenticationToken)
            return "login";
//        else
//            return "home";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(){
       return "user/home";
    }
    
    @RequestMapping(value = "user/profile", method = RequestMethod.GET)
    public String profile(){
       return "user/profile";
    }
    
    @RequestMapping(value = "user/user-profile", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody Profile getProfile(Authentication auth){
        CustomerPrincipal custprincipal = (CustomerPrincipal)auth.getPrincipal();
        Customer custwithAdd = customerService.loadAddress(custprincipal.getUser());
        Profile profile = new Profile();
        profile.setUser(custwithAdd);
//        profile.getUser().setOrder(null);
       return profile;
    }
    
    @RequestMapping(value = "user/profile/save", method = RequestMethod.POST)
    public @ResponseBody String saveProfile(@RequestBody Profile profile) {
        customerService.saveProfile(profile);
        return "ok";
    }
    
    
    @RequestMapping(value = "user/shopcart", method = RequestMethod.GET)
    public String cart(HttpSession session, ModelMap model) {
        ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
//        System.out.println(cart.getCars());
//        model.addAttribute("cart",cart);
        return "user/cart";
    }
    
    @RequestMapping(value = "/user/orders" ,method = RequestMethod.GET)
    public String customerOrders(Authentication auth, ModelMap model) {
        CustomerPrincipal custprincipal = (CustomerPrincipal)auth.getPrincipal();
        Customer customer = customerService.loadOrders(custprincipal.getUser());
//        List<Order> order = orderService.customerPendingOrders(custprincipal.getUser().getId());
        model.addAttribute("orders",customer.getOrder());

        return "user/ordersdetail";
    }
    
    @RequestMapping(value = "/user/order", method = RequestMethod.GET)
    public String placeOrder(Authentication auth, HttpSession session, ModelMap model) {
        CustomerPrincipal custprincipal = (CustomerPrincipal)auth.getPrincipal();
        Customer custwithAdd = customerService.loadAddress(custprincipal.getUser());
        model.addAttribute("addresses",custwithAdd.getAddresses());

        return "user/checkout";
    }
    
    @RequestMapping(value = "/user/prepare-order", method = RequestMethod.POST)
    public ResponseEntity prepareOrder(HttpSession session, Authentication auth, @RequestBody Map<String, String> moreinfo) {
        ShoppingCart cart =(ShoppingCart) session.getAttribute("cart");
        String key = null;
        if(cart != null) {
            CustomerPrincipal custprincipal = (CustomerPrincipal)auth.getPrincipal();
            Customer customer = custprincipal.getUser();
            
            JSONArray jsonprod = new JSONArray(cart.getCars());
            for (int i = 0; i < jsonprod.length(); i++) {
                jsonprod.getJSONObject(i).remove("carid");
            }
//            String products = jsonprod.toString();
            
            Payment pay = new Payment();
            pay.setName(customer.getFirstname()+" "+customer.getLastname());
            pay.setEmail(customer.getEmail());
            pay.setAmount(cart.getTotal());
            pay.setProducts(jsonprod);
            pay.setReturnUrl("http://localhost:8084/BuySellCar/rpservice");
            pay.setCancelUrl("http://localhost:8084/BuySellCar/user/order-error");
            
            JSONObject jsonpay = new JSONObject(pay);
            
            try {
                JSONObject response = HttpService("http://localhost:8383/requestToken",jsonpay);
                System.out.println(response.get("key").toString());
                if(response.isEmpty() || response.isNull("key"))
                    throw new IOException("Unable to initialize payment");
                key = response.get("key").toString();
                boolean ok = customerService.prepOrder(customer, moreinfo, key, cart.getCars(), cart.getTotal());
                
                JSONObject cancelresp = null;
                if(!ok) {
                    cancelresp = HttpService("http://localhost:8383/cancel",response);
                    return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Unable to connect to payment service provider.");
                }
                
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Unable to connect to payment service provider.");
            }
        } else
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("No items to order in cart. Refresh page.");
        
        System.out.println("Domain:"+appContext);
        JSONObject resjson = new JSONObject();
        resjson.put("pkey", key);
        resjson.put("envoy", String.format("%040x", new BigInteger(1, appContext.getBytes(Charset.defaultCharset()))));
        return ResponseEntity.ok(resjson.toMap());
        
    }
    
    @RequestMapping(value = "/user/order-success")
    public String orderSuccess() {
        return "user/ordersuccess";
    }
    
    @RequestMapping(value = "/user/order-error")
    public String orderError() {
        return "user/ordererror";
    }
    
    @RequestMapping(value="/user/cancel-order", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String cancelOrder(@RequestBody MultiValueMap<String, String> canceldet, HttpSession session) {
        System.out.println(canceldet.get("myorder").get(0).toString()+canceldet.get("reason").toString()+canceldet.get("myreceipt"));
        JSONObject refund = new JSONObject();
        refund.append("key", canceldet.get("myreceipt").get(0));
        try {
            JSONObject resp = HttpService("http://localhost:8383/refund", refund);
            customerService.cancelOrder(Integer.parseInt(canceldet.get("myorder").get(0)),canceldet.get("reason").get(0));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            session.setAttribute("ordererr", "Unable to cancel your order, try again later.<br/>"
                    + "If the problem persist, please don't hesitate to contact us");
            return "redirect:/user/order-error";
        }
        return "redirect:/user/orders";
    }
    
    @RequestMapping(value = "user/sellcar", method = RequestMethod.GET)
    public String sellCar(ModelMap model) {
        return "user/sellcar";
    }
    
    
    
    private JSONObject HttpService(String url, JSONObject payload) throws IOException {
        JSONObject json = null;
        HttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);

        StringEntity params = new StringEntity(payload.toString());
        post.setHeader("Content-type", "application/json");
        post.setEntity(params);
        HttpResponse res = httpclient.execute(post);

        HttpEntity entity = res.getEntity();
        Header encodingHeader = entity.getContentEncoding();
        if(res.getStatusLine().getStatusCode() >= 400)
            throw new IOException("Could not connect to service provider");
        if(entity != null) {
            ContentType ctype = ContentType.getOrDefault(entity);
            Charset charset = ctype.getCharset();
            String content =  EntityUtils.toString(entity, charset);
            System.out.println(content);
            json = new JSONObject(content);

        }
        
        return json;
    }
    
}
