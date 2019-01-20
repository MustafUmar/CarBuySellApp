/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.BranchOrder;
import model.Employee;
import model.Manager;
import model.Order;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import security.AdminPrincipal;
import security.CustomerPrincipal;
import service.BranchService;
import service.ManagerService;
import service.OrderService;
import vessel.FormModelObj;
import vessel.ShoppingCart;

/**
 *
 * @author MustiU
 */
@Controller
public class OrderController {
    
    @Autowired
    private OrderService orderService;
    @Autowired
    private BranchService branchService;
//    @Autowired
//    private ManagerService mgService;
    
    @RequestMapping(value = "rpservice", method = RequestMethod.GET)
    public String paymentConfirm(HttpSession session, @RequestParam("pkey") String key, @RequestParam("status") String status) {
        System.out.println(key);
        if(status.equals("success")) {
            boolean ok = orderService.updatePayment(key);
            if(ok) {
                session.setAttribute("cart", new ShoppingCart());
                return "redirect:/user/order-success";
            } else {
                JSONObject refund = new JSONObject();
                refund.append("key", key);
                try {
                    JSONObject res = HttpService("http://localhost:8383/refund",refund);
                } catch (IOException ex) {
                    System.out.println(ex.getMessage());
                    Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("ordererr", "Unable to complete your order");
                return "redirect:/user/order-error";
            }
            
            
        } else if(status.equals("charged_before")) {
            
            return "redirect:/user/ordersdetail";
        } else
            return "redirect:/user/order-error";
        
    }
    
    @RequestMapping(value = "/mg/orders", method = RequestMethod.GET)
    public String viewOrders(Authentication auth, ModelMap model, HttpSession session) {
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        System.out.println(session.getAttribute("mgv"));
        Map<String,List<BranchOrder>> orders = orderService.orderlist(mg.getBranch().getId(), session);
        model.addAttribute("orders", orders);
        return "manager/orders";
    }
    
    @RequestMapping(value = "/mg/order/{id}", method = RequestMethod.GET)
    public String viewOrder(@PathVariable("id") int oid, Authentication auth, HttpSession session, ModelMap model) {
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        BranchOrder order = orderService.order(oid, mg, session);
//        BranchOrder order = orderService.order(oid, mg.getBranch().getId());
        model.addAttribute("bo", order);
        return "manager/orderdetail";
    }
    
    @RequestMapping(value = "/mg/order/{oid}/{brid}/approve", method = RequestMethod.POST)
    public String approveOrder(@PathVariable("oid") int oid, @PathVariable("brid") int brid, Authentication auth, ModelMap model) {
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        BranchOrder order = orderService.approve(oid, brid, mg);
        model.addAttribute("order", order);
        return "redirect:/mg/order/"+oid;
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
            System.out.println(ctype);
            json = new JSONObject(content);

        }
        
        return json;
    }
    
}
