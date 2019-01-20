
package model;

import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "car_orders")
public class CarOrder {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    
    @Column(name = "drop_reason")
    private String dropReason;
    
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "order_id")
//    private Order order;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cardet_id")
    private CarDetail cardet;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_order")
    private BranchOrder branchOrder;
    
    public void addBranchOrder() {
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

//    public Order getOrder() {
//        return order;
//    }
//
//    public void setOrder(Order order) {
//        this.order = order;
//    }

    public CarDetail getCardet() {
        return cardet;
    }

    public void setCardet(CarDetail cardet) {
        this.cardet = cardet;
    }
    
    public String getDropReason() {
        return dropReason;
    }

    public void setDropReason(String dropReason) {
        this.dropReason = dropReason;
    }

//    public Branch getBranch() {
//        return branch;
//    }
//
//    public void setBranch(Branch branch) {
//        this.branch = branch;
//    }

    public BranchOrder getBranchOrder() {
        return branchOrder;
    }

    public void setBranchOrder(BranchOrder branchOrder) {
        this.branchOrder = branchOrder;
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        CarOrder that = (CarOrder) o;
        return Objects.equals( id, that.id ) && Objects.equals( branchOrder, that.branchOrder );
    }
    
    @Override
    public int hashCode() {
        return Objects.hash( id, branchOrder );
    }
    
}
