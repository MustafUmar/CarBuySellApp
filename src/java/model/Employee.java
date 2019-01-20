
package model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "employees")
public class Employee extends BaseAdmin {
    
    @Column(name = "designation")
    private String designation;
    
    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "br_id")
    private Branch branch;
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    @JsonManagedReference
//    @JsonIgnoreProperties("deliveries")
    private List<OrderDelivery> deliveries;

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }
    
    public List<OrderDelivery> getDeliveries() {
        return deliveries;
    }

    public void setDeliveries(List<OrderDelivery> deliveries) {
        this.deliveries = deliveries;
    }
    
    
}
