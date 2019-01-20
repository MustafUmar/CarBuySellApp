<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/datefunctions.tld" prefix="f" %>

<t:usertag>
    <jsp:body>
    
        <div class="base-container">
            <h2>Orders</h2>
            <c:choose>
                <c:when test="${not empty orders}">
                    <table class="table">
                        <tr>
                            <th>#</th><th>Order Number</th><th>Items</th><th>Total Amount</th><th>Status</th>
                            <th></th><th></th>
                        </tr>
                        <c:forEach var="order" items="${orders}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.orderNumber}</td>
                                <td>
                                    <div class="caritems">
                                    <c:forEach var="branch" items="${order.branches}">
                                        <c:forEach var="car" items="${branch.carOrders}">
                                            <div>
                                                ${car.cardet.year}
                                                ${car.cardet.model.car.make}
                                                ${car.cardet.model.name}
                                                ${car.cardet.name}
                                                <p>
                                                    <strong>Price: NGN <fmt:formatNumber type="number" value="${car.cardet.price}"/></strong>
                                                </p>
                                                <p>
                                                    <em>Location: ${branch.branch.name}</em>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:forEach>
                                    </div>
                                </td>
                                <td>NGN <fmt:formatNumber type="number" value="${order.totalprice}"/></td>
                                <td>${order.orderStatus}</td>
                                <td>
                                    ${f:pastTime(order.orderDate)}
                                </td>
                                <td>
                                    <c:if test="${order.orderStatus ne 'CANCELED'}">
                                        <c:if test="${f:currentDateDiff('m', order.orderDate) lt 40}">
                                            <button @click="openModal(${order.id},'${order.payment.chid}')">
                                                Cancel Order
                                            </button>
                                        </c:if>
                                    
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    No pending orders
                </c:otherwise>
            </c:choose>
            
        </div>
        
        <modal v-show="showmodal" @emitter="cancelOrder" @close="showmodal=false">
            <h4 slot="modal-header">
                Please tell us the reason for canceling your order? It can help us improve our service for you.
            </h4>
            <form slot="modal-content" id="reasonform" method="post" action="${pageContext.request.contextPath}/user/cancel-order">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div>
                    <label>
                        <input type="radio" name="reason" value="I changed my mind." v-model="cancel.reason"/>
                        I changed my mind.
                    </label>
                </div>
                <div>
                    <label>
                        <input type="radio" name="reason" value="Found a better deal." v-model="cancel.reason"/>
                        Found a better deal.
                    </label>
                </div>
                <div>
                    <label>
                        <input type="radio" name="reason" value="" @change="cancel.reason===''?cancel.other=true:cancel.other=false" v-model="cancel.reason"/>
                        Other
                    </label>
                    <textarea v-if="cancel.other" name="reason" v-model="cancel.reason" style="vertical-align: top;" cols="80" rows="3"></textarea>
                </div>
                
            </form>
        </modal>
        
    </jsp:body>
</t:usertag>
