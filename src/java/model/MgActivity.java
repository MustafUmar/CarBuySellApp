
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "activity")
public class MgActivity {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Column(name = "viewed_orders")
    private String viewOrders;
    
    @Column(name = "viewed_delvs")
    private String viewDelvs;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getViewOrders() {
        return viewOrders;
    }

    public void setViewOrders(String viewOrders) {
        this.viewOrders = viewOrders;
    }

    public String getViewDelvs() {
        return viewDelvs;
    }

    public void setViewDelvs(String viewDelvs) {
        this.viewDelvs = viewDelvs;
    }
    
}
