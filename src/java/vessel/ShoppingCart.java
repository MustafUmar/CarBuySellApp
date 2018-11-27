
package vessel;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.CarDetail;

/**
 *
 * @author MustiU
 */
public class ShoppingCart {
    
    private List<CartItem> cars = new ArrayList<>();
    private BigDecimal total = new BigDecimal(0);

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public List<CartItem> getCars() {
        return cars;
    }

    public void setCars(List<CartItem> cars) {
        this.cars = cars;
    }
    
    
}
