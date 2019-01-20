/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import filter.BranchFilter;
import java.math.BigDecimal;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;
import org.hibernate.annotations.ParamDef;
import org.hibernate.annotations.Type;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Facet;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.FullTextFilterDef;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;

/**
 *
 * @author MustiU
 */
@Indexed
@Entity
@Table(name = "cardetails")
@FullTextFilterDef(name = "branch", impl = BranchFilter.class)
public class CarDetail {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Field
    @Column(name = "name")
    private String name;
    
    @Field
    @Column(name = "year")
    private String year;
    
    @Column(name = "mileage")
    private long mileage;
    
    @Column(name = "engine")
    private String engine;
    
    @Column(name = "transmission")
    private String transmission;
    
    @Column(name = "drivetrain")
    private String drivetrain;
    
    @Column(name = "fueltype")
    private String fueltype;
    
    @Field(analyze = Analyze.NO)
    @Facet
    @Column(name = "cartype")
    private String cartype;
    
    @Column(name = "psng_count")
    private int psng_count;
    
    @Column(name = "interior_color")
    private String interior_color;
    
    @Column(name = "exterior_color")
    private String exterior_color;
    
    @Column(name = "price")
//    @Type(type = "org.hibernate.type.BigDecimalType")
    private int price;
    
    @Column(name = "status", nullable = false)
//    @Type(type = "org.hibernate.type.NumericBooleanType")
    private String status;
    
    @Column(name = "neworused")
//    @Enumerated(EnumType.ORDINAL)
    private String newused;
    
    @IndexedEmbedded
    @ContainedIn
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "model_id")
    private Model model;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id")
//    @Fetch(FetchMode.JOIN)
//    @Filter(name = "branchFilter", condition = "id = :brid")
    private Branch branch;
    
//    @OneToOne(mappedBy = "cardet", fetch = FetchType.LAZY)
//    @LazyToOne( LazyToOneOption.FALSE )
    @OneToMany(mappedBy = "cardet", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    private CarOrder carorder;
    private List<CarOrder> carorder;

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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public long getMileage() {
        return mileage;
    }

    public CarOrder getCarorder() {
//        return carorder;
        return carorder.isEmpty() ? null : carorder.get(0);
    }

    public void setCarorder(CarOrder carorder) {
//        this.carorder = carorder;
        this.carorder.add(carorder);
    }

    public void setMileage(long mileage) {
        this.mileage = mileage;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getDrivetrain() {
        return drivetrain;
    }

    public void setDrivetrain(String drivetrain) {
        this.drivetrain = drivetrain;
    }

    public String getFueltype() {
        return fueltype;
    }

    public void setFueltype(String fueltype) {
        this.fueltype = fueltype;
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype;
    }

    public int getPsng_count() {
        return psng_count;
    }

    public void setPsng_count(int psng_count) {
        this.psng_count = psng_count;
    }

    public String getInterior_color() {
        return interior_color;
    }

    public void setInterior_color(String interior_color) {
        this.interior_color = interior_color;
    }

    public String getExterior_color() {
        return exterior_color;
    }

    public void setExterior_color(String exterior_color) {
        this.exterior_color = exterior_color;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
   
    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }
    
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNewused() {
        return newused;
    }

    public void setNewused(String newused) {
        this.newused = newused;
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
                return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
                return false;
        }
        CarDetail cd = (CarDetail) o;
        return Objects.equals(id, cd.id);
    }
    
    @Override
    public int hashCode() {
            return Objects.hash(id);
    }
    
}
