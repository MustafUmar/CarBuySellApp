
package model;

import constants.OrderStatus;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;
import org.hibernate.annotations.Type;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "orders")
@FilterDef(
    name="orderstatus",
    parameters=@ParamDef(
        name="orderstat",
        type="String"
    )
)
@Filter(name = "orderstatus", condition = "order_status = :orderstat")
public class Order implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Column(name = "order_number")
    private String orderNumber;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "order_status")
    private OrderStatus orderStatus;
    
    @Column(name = "totalprice")
    @Type(type = "org.hibernate.type.BigDecimalType")
    private BigDecimal totalprice;
    
    @Column(name = "date_order")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    
    @Column(name = "cancel_reason")
    private String cancelReason;
    
    @Column(name = "cancel_confirm")
    private boolean cancelConfirm;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_id")
    private Customer customer;
    
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    private List<BranchOrder> branches = new ArrayList<>();
    
//    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
//    private List<CarOrder> carOrders = new ArrayList<>();
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_id")
    private Payment payment;
    
    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private OrderDelivery delivery;
    
    public void addBranch(Branch branch) {
        BranchOrder branchOrder = new BranchOrder(this, branch);
        branches.add(branchOrder);
        branch.getOrders().add(branchOrder);
    }
    
    public void removeBranch(Branch branch) {
        BranchOrder branchOrder = new BranchOrder(this, branch);
        branch.getOrders().remove(branchOrder);
        branches.remove(branchOrder);
        branchOrder.setOrder(null);
        branchOrder.setBranch(null);
    }
    
    
    public void addPayment(Payment payment) {
        payment.setOrder(this);
        this.payment = payment;
    }
    
//    public void addCarOrder(CarOrder carorder) {
//        this.carOrders.add(carorder);
//        carorder.setOrder(this);
//    }
//    
//    public void removeCarOrder(CarOrder carOrder) {
//        carOrders.remove(carOrder);
//        carOrder.setOrder(null);
//    }
    
    public void addDelivery(OrderDelivery delivery) {
        this.delivery = delivery;
        delivery.setOrder(this);
    }
    

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public OrderDelivery getDelivery() {
        return delivery;
    }

    public void setDelivery(OrderDelivery delivery) {
        this.delivery = delivery;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public BigDecimal getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(BigDecimal totalprice) {
        this.totalprice = totalprice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

//    public List<CarOrder> getCarOrders() {
//        return carOrders;
//    }
//
//    public void setCarOrders(List<CarOrder> carOrders) {
//        this.carOrders = carOrders;
//    }
    
    public List<BranchOrder> getBranches() {
        return branches;
    }

    public void setBranches(List<BranchOrder> branches) {
        this.branches = branches;
    }

    public boolean isCancelConfirm() {
        return cancelConfirm;
    }

    public void setCancelConfirm(boolean cancelConfirm) {
        this.cancelConfirm = cancelConfirm;
    }
    
    
     public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }
    
    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
                return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
                return false;
        }
        Order person = (Order) o;
        return Objects.equals( orderNumber, person.orderNumber );
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(orderNumber);
    }
    
    
}
