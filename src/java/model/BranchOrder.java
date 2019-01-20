
package model;

import constants.OrderStatus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author MustiU
 */

@Entity
@Table(name = "branch_order")
public class BranchOrder implements Serializable {
    
    public BranchOrder() {
        
    }
    
    public BranchOrder(Order order, Branch branch) {
        this.order = order;
        this.branch = branch;
//        this.overseer = overseer;
    }
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
//    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id")
    private Branch branch;
    
//    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")
    private Order order;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private OrderStatus orderStatus;
    
    @Column(name = "complete_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date completeDate;
    
    @Column(name = "approve_deny_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date approveDenyDate;
    
    @OneToMany(mappedBy = "branchOrder", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<CarOrder> carOrders = new ArrayList<>();
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "overseer")
    private Manager overseer;
    
    public void addCarOrder(CarOrder carOrder) {
        carOrders.add(carOrder);
        carOrder.setBranchOrder(this);
    }
    
    public void removeCarOrder(CarOrder carOrder) {
        carOrders.remove(carOrder);
        carOrder.setBranchOrder(null);
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public Date getApproveDenyDate() {
        return approveDenyDate;
    }

    public void setApproveDenyDate(Date approveDenyDate) {
        this.approveDenyDate = approveDenyDate;
    }

    public List<CarOrder> getCarOrders() {
        return carOrders;
    }

    public void setCarOrders(List<CarOrder> carOrders) {
        this.carOrders = carOrders;
    }

    public Manager getOverseer() {
        return overseer;
    }

    public void setOverseer(Manager overseer) {
        this.overseer = overseer;
    }
    
    
    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        BranchOrder that = (BranchOrder) o;
        return Objects.equals( order, that.order ) && Objects.equals( branch, that.branch );
    }
    
    @Override
    public int hashCode() {
        return Objects.hash( order, branch );
    }
    
}
