
package model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "branches")
//@FilterDef(name = "branchFilter", parameters = @ParamDef(name = "brid", type = "integer"))
public class Branch implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    @Filter(name = "branchFilter", condition = "id = :brid")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "city", nullable = true)
    private String city;
    
    @Column(name = "country", nullable = true)
    private String country;
    
    @Column(name = "geoloc", nullable = true)
    private String geoloc;
    
    @OneToOne(mappedBy = "branch", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Fetch(FetchMode.JOIN)
    @JsonManagedReference
    private Manager manager;
    
    @OneToMany(mappedBy = "branch", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Employee> employees;
    
    @OneToMany(mappedBy = "branch", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    private List<BranchOrder> orders = new ArrayList<>();
    
    public void addManager(Manager manager) {
        manager.setBranch(this);
        this.manager = manager;
    }
    
    public void removeManager() {
        if(manager != null) {
            manager.setBranch(null);
            this.manager = null;
        }
    }
    
//    public void addOrder(Order order) {
//        BranchOrder branchOrder = new BranchOrder(order, this, manager);
//    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }
    
    public List<BranchOrder> getOrders() {
        return orders;
    }

    public void setOrders(List<BranchOrder> orders) {
        this.orders = orders;
    }
    
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getGeoloc() {
        return geoloc;
    }

    public void setGeoloc(String geoloc) {
        this.geoloc = geoloc;
    }
    
    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        Branch branch = (Branch) o;
        return Objects.equals( id, branch.id ) && Objects.equals( name, branch.name );
    }
    
    public int hashCode() {
        return Objects.hash(id, name);
    }
    
    
}
