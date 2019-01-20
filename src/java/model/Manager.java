/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
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
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "managers")
@DynamicUpdate
public class Manager extends BaseAdmin implements Serializable {
    
    @Column(name = "views")
    private String views;
    
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "branch_id")
    @Fetch(FetchMode.JOIN)
    private Branch branch;
    
    @OneToMany(mappedBy = "overseer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BranchOrder> branchOrders;
    
//    @OneToMany(mappedBy = "manager", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    private List<Employee> employees;

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public List<BranchOrder> getBranchOrders() {
        return branchOrders;
    }

    public void setBranchOrders(List<BranchOrder> branchOrders) {
        this.branchOrders = branchOrders;
    }
    
    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
                return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
                return false;
        }
        Manager mg = (Manager) o;
        return Objects.equals( this.getId(), mg.getId()) && Objects.equals(this.branch.getId(), mg.branch.getId());
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(getId()+branch.getId()+branch.getName());
    }
    
}
