
package service;

import dao.ManagerDAO;
import model.Order;
import dao.OrderDAO;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import model.BranchOrder;
import model.Employee;
import model.Manager;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Service
@Transactional
public class OrderService {
    
    @Autowired
    private OrderDAO orderdao;
    @Autowired
    private ManagerDAO mgdao;
    
    public Map<String,List<BranchOrder>> orderlist(int brid, HttpSession session) {
        Object sessorder = session.getAttribute("mgv");
        List<Integer> order = null;
        if(sessorder != null) {
            System.out.println("Sessorder"+sessorder);
            JSONObject orderview = new JSONObject(sessorder.toString());
            JSONArray orderlist = orderview.getJSONArray("orders");
            order = orderlist.toList().stream().map(o -> Integer.parseInt(o.toString())).collect(Collectors.toList());
            System.out.println(order);
        }
        
        return orderdao.orderList(brid, order);
    }
    
    public List<BranchOrder> pendingOrders(int brid) {
        return orderdao.pendingOrders(brid);
    }
    
    public List<BranchOrder> approvedOrders(int brid) {
        return orderdao.approvedOrders(brid);
    }
    
    public BranchOrder order(int oid, Manager mg, HttpSession session) {
        JSONObject json = null;
        JSONArray array = null;
        if(session.getAttribute("mgv") == null) {
            json = new JSONObject();
            json.put("orders", new JSONArray());
            json.put("delvs", new JSONArray());
            array = json.getJSONArray("orders");
            array.put(oid);
            session.setAttribute("mgv", json.toString());
//            mgdao.saveViews(mg.getId(), json.toString());
        } else {
            json = new JSONObject(session.getAttribute("mgv").toString());
            Set order = new HashSet(json.getJSONArray("orders").toList());
//            List order = json.getJSONArray("orders").toList();
            if(order.size() > 5) {
                order.remove(4);
                order.add(oid);
//                order.add(0, oid);
            } else 
                order.add(oid);
//                order.add(0, oid);
            json.put("orders", order);
            session.setAttribute("mgv", json.toString());
//            mg.setViews(json.toString());
//            mgdao.saveViews(mg.getId(), json.toString());
        }
        
        return orderdao.orderWithPackage(oid, mg.getBranch().getId());
    }
    
    public BranchOrder approve(int oid, int brid, Manager mg) {
        return orderdao.approve(oid, brid, mg);
    }
    
    public List<Order> customerPendingOrders(int custid) {
        return orderdao.getCustomerOrder(custid);
    }
    
    public boolean updatePayment(String key) {
        boolean ok = orderdao.updatePayment(key);
        return ok;
    }
    
    
}
