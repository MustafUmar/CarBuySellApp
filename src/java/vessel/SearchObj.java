/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vessel;

import java.util.List;

/**
 *
 * @author MustiU
 */
public class SearchObj<T> {
    
//    private String query;
    private int maxPageSize;
    private int resultPerPage = 10;
    private int pageNumber = 1;
    private List<T> result;

    public int getMaxPageSize() {
        return maxPageSize;
    }

    public void setMaxPageSize(int resultSize) {
        this.maxPageSize =  (int) Math.ceil((float)resultSize/this.resultPerPage);
    }

    public int getResultPerPage() {
        return resultPerPage;
    }

    public void setResultPerPage(int resultPerPage) {
        this.resultPerPage = resultPerPage;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int PageNumber) {
        this.pageNumber = PageNumber;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

}
