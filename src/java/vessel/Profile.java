/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vessel;

import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.Customer;

/**
 *
 * @author MustiU
 */
public class Profile {
    private Customer user;
    private List<Address> deletes = new ArrayList();
//    private List<Address> inserts = new ArrayList();

    public Customer getUser() {
        return user;
    }

    public void setUser(Customer user) {
        this.user = user;
    }

    public List<Address> getDeletes() {
        return deletes;
    }

    public void setDeletes(List<Address> deletes) {
        this.deletes = deletes;
    }

//    public List<Address> getInserts() {
//        return inserts;
//    }
//
//    public void setInserts(List<Address> inserts) {
//        this.inserts = inserts;
//    }
    
    
}
