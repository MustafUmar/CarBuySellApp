
package model;

import java.util.List;
import java.util.Objects;
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
@Table(name = "addresses")
public class Address {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Column(name = "street")
    private String street;
    
    @Column(name = "city")
    private String city;
    
    @Column(name = "state")
    private String state;
    
    @Column(name = "country")
    private String country;
    
    @Column(name = "other_details")
    private String moreinfo;
    
    @Column(name = "prev_owner")
    private int prevown;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_id")
    private Customer customer;
    
    @OneToMany(mappedBy = "address", fetch = FetchType.LAZY)
    private List<OrderDelivery> delivery;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMoreinfo() {
        return moreinfo;
    }

    public void setMoreinfo(String moreinfo) {
        this.moreinfo = moreinfo;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    public int getPrevown() {
        return prevown;
    }

    public void setPrevown(int prevown) {
        this.prevown = prevown;
    }
    
    @Override
    public boolean equals(Object o) {
            if ( this == o ) {
                    return true;
            }
            if ( o == null || getClass() != o.getClass() ) {
                    return false;
            }
            Address address = (Address) o;
            return Objects.equals( id, address.id );
    }

    @Override
    public int hashCode() {
            return Objects.hash( id );
    }
}
