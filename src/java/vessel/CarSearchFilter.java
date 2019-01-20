
package vessel;

import java.io.Serializable;
import java.math.BigDecimal;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author MustiU
 */

public class CarSearchFilter implements Serializable {
    private int brid = 0;
    private int brindex = 0;
    private String searchq;
    private String carmake;
    private String carmodel;
    private String cartype;
    private BigDecimal priceLowerBound;
    private BigDecimal priceUpperBound;

    public int getBrid() {
        return brid;
    }

    public void setBrid(int brid) {
        this.brid = brid;
    }

    public int getBrindex() {
        return brindex;
    }

    public void setBrindex(int brindex) {
        this.brindex = brindex;
    }


    public String getSearchq() {
        return searchq;
    }

    public void setSearchq(String searchq) {
        this.searchq = searchq;
    }

    public String getCarmake() {
        return carmake;
    }

    public void setCarmake(String carmake) {
        this.carmake = carmake;
    }

    public String getCarmodel() {
        return carmodel;
    }

    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel;
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype;
    }

    public BigDecimal getPriceLowerBound() {
        return priceLowerBound;
    }

    public void setPriceLowerBound(BigDecimal priceLowerBound) {
        this.priceLowerBound = priceLowerBound;
    }

    public BigDecimal getPriceUpperBound() {
        return priceUpperBound;
    }

    public void setPriceUpperBound(BigDecimal priceUpperBound) {
        this.priceUpperBound = priceUpperBound;
    }
    
    
}
