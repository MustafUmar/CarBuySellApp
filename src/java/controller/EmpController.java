
package controller;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;
import java.util.stream.Collectors;
import model.Employee;
import model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import security.AdminPrincipal;
import service.EmpService;
import vessel.FormModelList;

/**
 *
 * @author MustiU
 */
@Controller
public class EmpController {
    
    @Autowired
    private EmpService empService;
    
    @JsonIgnore
    @RequestMapping(value="/mg/couriers", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody List emps(Authentication auth, @RequestParam("emp") int curemp) {
        AdminPrincipal adp =(AdminPrincipal) auth.getPrincipal();
        Manager mg = (Manager)adp.getAdmin();
        List<Employee> courier = empService.couriers(mg.getBranch().getId());
        
        return courier;
    }
    
}
