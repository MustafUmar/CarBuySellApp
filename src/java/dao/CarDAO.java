/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Branch;
import model.Car;
import model.CarDetail;
import model.Model;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import vessel.CarModelList;

/**
 *
 * @author MustiU
 */
@Repository
//@Transactional
public class CarDAO {
    
    @Autowired
    private SessionFactory sessionfactory;
    
    public List<Car> getCars() {
        return sessionfactory.getCurrentSession().createQuery("from Car").list();
    }
    
    
    public Car getCar(int id) {
        Session session = sessionfactory.getCurrentSession();
        return session.find(Car.class, id);
//        return sessionfactory.getCurrentSession().createQuery(
//                "select c "+
//                "from Car c "+
//                "where c.id = :carid ", Car.class
//        ).setParameter("carid", id)
//         .uniqueResult();
    }
    
    
    public Car getModelsByCarId(int carid) {
        return sessionfactory.getCurrentSession().createQuery(
                "select c "+
                "from Car c "+
                "left join fetch c.models m "+
                "where c.id = :carid ", Car.class
        ).setParameter("carid", carid)
         .uniqueResult();
    }
    
    public void saveCarModels(int carid, CarModelList cm) {
        Session session = sessionfactory.getCurrentSession();
        Car car = session.load(Car.class, carid);
        System.out.println(car.getMake());
        for (String name : cm.getName()) {
            if(!name.equals("") && name != null) {
                Model model = new Model();
                model.setName(name);
//                model.setCar(car);
//                session.persist(model);
//                model.setCar(null);
                car.addModel(model);
            }
        }
        session.persist(car);
    }
    
    public Model getCarModelList(int modid) {
        return sessionfactory.getCurrentSession().createQuery(
                "select m from Model m "+
                "left join fetch m.cardetails c "+
                "where m.id = :modid", Model.class)
            .setParameter("modid", modid)
            .uniqueResult();
    }
    
    public CarDetail getCarById(int id) {
        return sessionfactory.getCurrentSession().load(CarDetail.class, id);
//        return sessionfactory.getCurrentSession().createQuery(
//                "select c from CarDetail " +
//                "join c.model m "+
//                "join m.car c "+
//                "where c.id = :id", CarDetail.class)
//            .setParameter("id", id)
//            .uniqueResult();
    }
    
    
    public List<CarDetail> getCarListWithLimit() {
        FullTextSession fullTextSession = Search.getFullTextSession(sessionfactory.getCurrentSession());
        QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(CarDetail.class).get();
        org.apache.lucene.search.Query luQuery = qb.all().createQuery();
//                .keyword()
//                .onFields("name","model.name","model.car.make")
//                .matching("*")
//                .createQuery();
        Query qr = fullTextSession.createFullTextQuery(luQuery, CarDetail.class);
        qr.setMaxResults(10);
        return qr.list();
    }
    
    public void newCarDetail(int brin, int modid, CarDetail cardet) {
        Session session = sessionfactory.getCurrentSession();
        Model carmodel = session.load(Model.class, modid);
        Branch branch = session.load(Branch.class, brin);
        cardet.setModel(carmodel);
        cardet.setBranch(branch);
        session.persist(cardet);
    }
    
    
    
    
}
