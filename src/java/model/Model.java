/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.IndexedEmbedded;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "models")
public class Model {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;
    
    @Field
    @Column(name="name")
    private String name;
    
    @ContainedIn
    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Car.class)
    @JoinColumn(name = "carid", referencedColumnName = "id")
//    for cardet
    @IndexedEmbedded(includePaths = {"make"})
    private Car car;
    
    @OneToMany(mappedBy="model", fetch = FetchType.LAZY, cascade=CascadeType.ALL, orphanRemoval = true)
    @IndexedEmbedded( prefix = "cardet_", includePaths = {"name","year","cartype"})
//    for cardet
    @ContainedIn
    private List<CarDetail> cardetails;
    
    public void addCarDetail(CarDetail cd) {
        cardetails.add(cd);
        cd.setModel(this);
    }
    
    public void removeCarDetail(CarDetail cd) {
        cardetails.remove(cd);
        cd.setModel(null);
    }

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

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public List<CarDetail> getCardetails() {
        return cardetails;
    }

    public void setCardetails(List<CarDetail> cardetails) {
        this.cardetails = cardetails;
    }
    
    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
                return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
                return false;
        }
        Model model = (Model) o;
        return Objects.equals(id, model.id);
    }
    
    @Override
    public int hashCode() {
            return Objects.hash(id);
    }
    
}
