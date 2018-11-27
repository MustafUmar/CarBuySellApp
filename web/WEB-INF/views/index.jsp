<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <%--<button><a href="${pageContext.request.contextPath}/external">Connect External</a></button>--%>
        <h1>Buy & Sell Cars</h1>
        <div v-pre class="searchbar">
            <div v-pre class="search-container">
                <label><b><em>Search:</em></b></label>
                <input style="width:100%;" type="text" id="searchtext" name="search"/>
                <button id="search">Search</button>
            </div>
        </div>
        <div class="cargview" style="width: 70%; margin: 0 auto;">
            <c:forEach var="car" items="${cars}">
                <div class="box-content">
                    <h4>${car.model.car.make} ${car.model.name} ${car.name}</h4>
                    <h5>${car.price}</h5>
                    <div>
                        <p>Year: ${car.year}</p>
                    </div>
                    <cart-action v-if="contains(${car.id})"></cart-action>
                    <buy-action v-else carid="${car.id}" @cart-action="addToCart"></buy-action>
<!--                        <a v-if="contains(${car.id})" href="${pageContext.request.contextPath}/user/order">Check cart</a>
                    <button v-else @click.prevent="addToCart(${car.id})">Buy Car</button>-->
                </div>
            </c:forEach>
        </div>
    </jsp:body>
</t:usertag>
