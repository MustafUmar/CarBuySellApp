<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
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
                                <cart-action v-if="contains(${car.id})"></cart-action>
                                <buy-action v-else carid="${car.id}" @cart-action="addToCart"></buy-action>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div><p>No result</p></div>
                    </c:otherwise>
                </c:choose>
            
            </div>
    </jsp:body>
</t:usertag>
