
package controller;

import java.util.List;
import model.Car;
import model.CarDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.SearchService;
import vessel.SearchObj;


@Controller
//@Transactional
public class SearchController {
    
    @Autowired
    private SearchService searchService;
    
    @RequestMapping(value = "/searchquery", method = RequestMethod.GET)
    public ModelAndView search(@RequestParam("q") String searchquery, ModelAndView model) {
        List<CarDetail> searchresult = searchService.searchresult(searchquery);
//        for (CarDetail carDetail : searchresult) {
//            System.out.println("cardet:"+carDetail.getName());
//            System.out.println("price:"+carDetail.getPrice());
//            System.out.println("model:"+carDetail.getModel().getName());
//            System.out.println("car:"+carDetail.getModel().getCar().getMake());
//        }
        model.addObject("searchresult", searchresult);
        model.setViewName("search");
        return model;
    }
    
    
    @RequestMapping(value = "/admin/search", method = RequestMethod.GET)
    public String searchOption() {
        return "admin/searchoptions";
    }
    
    
    @RequestMapping(value = "/admin/searchindex", method = RequestMethod.GET)
    public String buildSearchIndex() {
        try {
            searchService.buildIndex();
            return "admin/dashboard";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "admin/searchoptions?error=true";
        }
    }
    
//    @RequestMapping(value = "admin/rebuildindex", method = RequestMethod.GET)
//    public String rebuildSearchIndex() {
//        
//    }
    
    
}
