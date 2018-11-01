
package model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "orders")
public class Order {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Column(name = "payment_status")
    private String paymentStatus;
    
    @Column(name = "order_status")
    private String orderStatus;
    
    @Column(name = "totalprice")
    @Type(type = "org.hibernate.type.BigDecimalType")
    private BigDecimal totalprice;
    
    @Column(name = "date_order")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    
    @Column(name = "date_paid")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;
    
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade=CascadeType.ALL, orphanRemoval = true)
    private List<CustomerOrder> cutomerOrders;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
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

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public List<CustomerOrder> getCutomerOrders() {
        return cutomerOrders;
    }

    public void setCutomerOrders(List<CustomerOrder> cutomerOrders) {
        this.cutomerOrders = cutomerOrders;
    }
    
    
}
