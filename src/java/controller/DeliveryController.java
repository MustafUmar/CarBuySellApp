
package controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.BranchOrder;
import model.Employee;
import model.Manager;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import security.AdminPrincipal;
import service.BranchService;
import service.DeliveryService;
import service.OrderService;
import vessel.FormModelObj;

/**
 *
 * @author MustiU
 */
@Controller
public class DeliveryController {
    
    @Autowired
    private OrderService orderService;
    @Autowired
    private DeliveryService deliveryService;
    @Autowired
    private BranchService branchService;
    
    @RequestMapping(value = "/mg/deliveries", method = RequestMethod.GET)
    public String viewDeliveries(Authentication auth, ModelMap model) {
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        Map<String,List<BranchOrder>> deliveries = deliveryService.deliveries(mg.getBranch().getId());
        model.addAttribute("delvs", deliveries);
        return "manager/deliveries";
    }
    
    @RequestMapping(value = "/mg/order/{id}/delivery", method = RequestMethod.GET)
    public String viewDelivery(@PathVariable("id") int oid, Authentication auth, HttpSession session, Model model) {
        Order order = deliveryService.orderDelivery(oid);
        model.addAttribute("order", order);
        if(order.getDelivery().getEmployee() == null) {
            AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
            Manager mg = (Manager)adp.getAdmin();
            List<Employee> em = branchService.courierBranch(mg.getBranch().getId());
            model.addAttribute("employees", em);
            model.addAttribute("empno",new FormModelObj<Integer>());
            session.setAttribute("couriers", em);
        } 

        return "manager/deliverysetting";
    }
    
    @RequestMapping(value = "/mg/delivery/{id}/courier", method = RequestMethod.POST)
    public String updateDelivery(@PathVariable("id") int did, @ModelAttribute("empno") FormModelObj<String> empno,
            @ModelAttribute("or") Order order, HttpSession session) {
        List<Employee> em = (List<Employee>) session.getAttribute("couriers");
        deliveryService.assignCourier(did, em, Integer.parseInt(empno.getData()));
        session.removeAttribute("couriers");
        return "redirect:/mg/order/"+order.getId();
    }
    
    @RequestMapping(value = "/mg/delivery/{id}/courier/change", method = RequestMethod.POST)
    public String changeCourier(@PathVariable("id") int oid, HttpServletRequest request) {
        int did = Integer.parseInt(request.getParameter("did"));
        int eid = Integer.parseInt(request.getParameter("courier"));
        deliveryService.changeCourier(did, eid);
        return "redirect:/mg/order/"+oid+"/delivery";
    }
    
    @RequestMapping(value = "/mg/delivery/{id}/cancel", method = RequestMethod.POST)
    public String haltDelivery(@PathVariable("id") int oid, HttpServletRequest request) {
        int did = Integer.parseInt(request.getParameter("did"));
        deliveryService.cancelDelivery(did);
        return "redirect:/mg/order/"+oid+"/delivery";
    }
    
}
