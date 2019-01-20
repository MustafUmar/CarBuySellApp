<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.cart}">
    <% response.sendRedirect("/"); %>
</c:if>
<t:usertag>
    <jsp:body>
        <div class="base-container">
        <!--<form method="post">-->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            <c:choose>
                <c:when test="${not empty sessionScope.cart.cars}">
                    <error :entity="error"></error>
                    <tabs @confirm ="placeOrder">
                        <tab name="Order Details">
                            <div class="tabfixedframe">
                                <c:set var="count" value="${0}" scope="page" />
                                <c:forEach var="car" items="${sessionScope.cart.cars}" varStatus="lp">
                                    <div class="carorder-list">
                                        <div class="ordernum">
                                            <c:set var="count" value="${count + 1}" scope="page" />
                                            ${count}.
                                        </div>
                                        <div class="carorder-item">
                                            <p>${car.make} ${car.modelname} ${car.typename} ${car.year}</p>
                                            <p>${car.price}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                                <div class="orderamount">Total: ${sessionScope.cart.total}</div>
                        </tab>
                        <tab name="Billing Address" v-bind:validate="true" valname="address">
                            <div class="tabfixedframe">
                                <h3>Select billing address</h3>
                                <c:choose>
                                    <c:when test="${not empty addresses}">
                                        <div class="address-container">
                                        <c:forEach var="address" items="${addresses}">
                                            <label class="address-list">
                                                <input type="radio" name="add" value="${address.id}" v-model="order.address"/>
                                                <div class="address-item">
                                                    <span>${address.street}</span>
                                                    <span>${address.city}</span>
                                                    <span>${address.state}</span>
                                                    <span>${address.country}</span>
                                                </div>
                                            </label>
                                        </c:forEach>
                                        </div>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </tab>
                        <tab name="Payment" v-bind:validate="true" valname="payment">
                            <div class="tabfixedframe">
                                <h1>Choose payment option</h1>
                                <div>
                                    <label>
                                        <input type="radio" name="payment" value="psp1" v-model="order.payment"/>
                                        Pay with credit card
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input type="radio" name="payment" value="psp2" v-model="order.payment" disabled/>
                                        Pay option #2
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input type="radio" name="payment" value="psp3" v-model="order.payment" disabled/>
                                        Pay option #3
                                    </label>
                                </div>
                            </div>
                        </tab>
                    </tabs>
                </c:when>
                <c:otherwise>
                    <p>No orders</p>
                </c:otherwise>
            </c:choose>
        <!--</form>-->
        </div>
    </jsp:body>
</t:usertag>
