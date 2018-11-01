/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Car;
import model.CarDetail;
import model.Model;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MustiU
 */
@Repository
//@Transactional
public class SearchDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
//    public List<Car> search(String query) {
//        FullTextSession fullTextSession = Search.getFullTextSession(sessionFactory.getCurrentSession());
//        QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Car.class).get();
//        org.apache.lucene.search.Query luQuery = qb.keyword()
//                .onFields("make","models.name","models.cardet_name","models.cardet_cartype")
//                .matching(query)
//                .createQuery();
//        Query qr = fullTextSession.createFullTextQuery(luQuery, Car.class);
////        Query qr = fullTextSession.createFullTextQuery(luQuery, Car.class, Model.class, CarDetail.class);
//        return qr.list();
//    }
    
    public List<CarDetail> search(String query) {
        FullTextSession fullTextSession = Search.getFullTextSession(sessionFactory.getCurrentSession());
        QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(CarDetail.class).get();
        org.apache.lucene.search.Query luQuery = qb.keyword()
                .onFields("name","model.name","model.car.make")
                .matching(query)
                .createQuery();
        Query qr = fullTextSession.createFullTextQuery(luQuery, CarDetail.class);
//        Query qr = fullTextSession.createFullTextQuery(luQuery, Car.class, Model.class, CarDetail.class);
        return qr.list();
    }
    
    public void buildIndex() throws InterruptedException {
        FullTextSession fullTextSession = Search.getFullTextSession(sessionFactory.getCurrentSession());
        fullTextSession.createIndexer().startAndWait();
    }
    
    
    
}
