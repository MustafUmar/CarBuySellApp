/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.fasterxml.jackson.core.JsonParser;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CarDetail;
import model.Model;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.CarService;
import vessel.SearchObj;

/**
 *
 * @author MustiU
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
    
    @Autowired
    private CarService carService;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model) {
        List<CarDetail> cars = carService.carswithlimit();
        model.addObject("cars", cars);
        model.setViewName("index");
        return model;
    }
    
    @RequestMapping(value = "external", method = RequestMethod.GET)
    public String external(Model model) {
        HttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost("http://localhost:8383/pay");
        
        List<NameValuePair> params = new ArrayList();
        
        params.add(new BasicNameValuePair("paydata", "carbs"));
        
        try {
            post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            
            HttpResponse res = httpclient.execute(post);
            HttpEntity entity = res.getEntity();
            Header encodingHeader = entity.getContentEncoding();
            System.out.println("Status:"+res.getStatusLine().getStatusCode());
            if(res.getStatusLine().getStatusCode() >= 400)
                throw new IOException("Could not connect to service provider");
            if(entity != null) {
                ContentType ctype = ContentType.getOrDefault(entity);
                Charset charset = ctype.getCharset();
//                Charset encoding = encodingHeader == null ? StandardCharsets.UTF_8 : 
//                Charsets.toCharset(encodingHeader.getValue());
                String content =  EntityUtils.toString(entity, charset);
                JSONObject json = new JSONObject(content);
//                json.
                System.out.println(json.get("hello"));
            }
            
            
        } catch (UnsupportedEncodingException ex) {
            System.out.println("Encode Error: "+ex.getMessage());
            return "user/paymentservice";
        } catch (IOException ex) {
            System.out.println("Error connecting: "+ex.getMessage());
            return "user/paymentservice";
        }
        
        return "redirect:/";
    }
    
    
}
