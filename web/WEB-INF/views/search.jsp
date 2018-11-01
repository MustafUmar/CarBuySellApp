<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:wrapper>
    <jsp:body>
        <h1>Search Results</h1>
        <div class="searchbar">
            <div class="search-container">
                <label><b><em>Search:</em></b></label>
                <input style="width:100%;" type="text" id="searchtext" name="search"/>
                <button id="search">Search</button>
            </div>
        </div>
            <div class="cargview" style="width: 70%; margin: 0 auto;">
                <c:choose>
                    <c:when test="${not empty searchresult}">
                        <c:forEach var="car" items="${searchresult}">
                            <div class="box-content">
                                <h4>${car.model.car.make} ${car.model.name} ${car.name}</h4>
                                <h5>${car.price}</h5>
                                <div>
                                    <p>Year: ${car.year}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div><p>No result</p></div>
                    </c:otherwise>
                </c:choose>
            
            </div>
        
        <script>
            var searchbtn = document.getElementById('search')
            var text = document.getElementById('searchtext')
            searchbtn.onclick = searchQuery
            text.onkeypress = function(e) {
                if(e.keyCode == 13)
                    searchQuery()
            }
            
            function searchQuery() {
                if(text.value !== '' && text.value !== null) {
                    console.log('sent')
                    window.location.href = 'http://localhost:8084/BuySellCar/searchquery?q='+text.value
                }
            }
        </script>
    </jsp:body>
</t:wrapper>
