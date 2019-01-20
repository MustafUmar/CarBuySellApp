/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import org.apache.lucene.index.Term;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TermQuery;

import org.hibernate.search.annotations.Factory;

/**
 *
 * @author MustiU
 */
public class BranchFilter {
    private Integer brid;

    public void setBrid(Integer brid) {
        this.brid = brid;
    }
    
    @Factory
    public Query getFilter() {
        return new TermQuery(new Term("branch_id", brid.toString()));
    }
    
}
