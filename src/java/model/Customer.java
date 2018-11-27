/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.DynamicUpdate;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "customers")
//@DynamicUpdate
@DynamicUpdate(true)
public class Customer implements Serializable{
    
    private static final long serialVersionUID = 7576473295612776147L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Column(name = "firstname")
    private String firstname;
    
    @Column(name = "lastname")
    private String lastname;
    
    @Column(name = "phone_num")
    private String phonenum;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "password")
    private String password;
    
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade=CascadeType.ALL, orphanRemoval = true)
    private List<Order> order;
    
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    private List<Address> addresses;
    
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade=CascadeType.ALL, orphanRemoval = true)
    private List<Payment> payment;
    
    public void addAddress(Address address) {
        addresses.add(address);
        address.setCustomer(this);
    }
    
    public void removeAddress(Address address) {
        addresses.remove(address);
        address.setCustomer(null);
    } 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    
//    @Transient
//    public String fullname() {
//        return this.firstname +" "+ this.lastname;
//    }
    
    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Payment> getPayment() {
        return payment;
    }

    public void setPayment(List<Payment> payment) {
        this.payment = payment;
    }
    
    
}
