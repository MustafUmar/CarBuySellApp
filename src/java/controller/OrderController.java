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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import security.CustomerPrincipal;
import service.OrderService;
import vessel.ShoppingCart;

/**
 *
 * @author MustiU
 */
@Controller
public class OrderController {
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value = "rpservice", method = RequestMethod.GET)
    public String paymentConfirm(HttpSession session, @RequestParam("pkey") String key, @RequestParam("status") String status) {
        System.out.println(key);
        if(status.equals("success")) {
            boolean ok = orderService.updateOrder(key);
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
