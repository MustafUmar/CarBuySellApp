<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:mgtag>
    <jsp:body>
        <h2>Delivery</h2>
        <p><strong>Delivery Status:</strong> ${order.delivery.status}</p>
        <a class="button" href="${pageContext.request.contextPath}/mg/order/${order.id}">View Order Details</a>
        <div class="base-container box-border">
        <c:choose>
            <c:when test="${order.orderStatus ne 'COMPLETE' and order.delivery.employee eq null}">
               <form action="${pageContext.request.contextPath}/mg/delivery/${order.delivery.id}/courier" method="post">
                   Courier has not been set.
                   <h4>Select courier:</h4>
                   <div>
                        <c:forEach items="${employees}" var="em" varStatus="lp">
                            <p>
                                <label>
                                    <form:radiobutton path="empno.data" value="${lp.index + 1}"/>
                                    ${em.firstname} ${em.lastname}
                                </label>
                            </p>
                        </c:forEach>
                   </div>
                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                    <input type="submit" value="Set as courier"/>
                </form>
            </c:when>
            <c:otherwise>
                <div>
                    <c:if test="${order.delivery.status ne 'COMPLETE'}">
                        <button @click="loadEmployees(${order.delivery.employee.id})" ${order.delivery.status eq 'CANCELED'?'':'disabled'}>
                            Change person
                        </button>
                    </c:if>
                    <c:if test="${order.delivery.status ne 'CANCELED'}">
                        <form method="post" action="${pageContext.request.contextPath}/mg/delivery/${order.id}/cancel">
                            <input type="hidden" name="did" value="${order.delivery.id}"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                            <input type="submit" value="Withdraw order" />
                        </form>
                    </c:if>
                        <div v-if="emp.showemp">
                            <form method="post" action="${pageContext.request.contextPath}/mg/delivery/${order.id}/courier/change">
                                <div v-if="emp.couriers.length > 0">
                                    <div v-for="(em,index) in emp.couriers">
                                        <label>
                                            <input type="radio" name="courier" v-model.number="emp.selected" :value="em.id" :disabled="em.id === ${order.delivery.employee.id}"/>
                                            {{em.firstname}} {{em.lastname}} {{em.id === ${order.delivery.employee.id}?'<- current courier':''}}
                                        </label>
                                    </div>
                                </div>
                                <div v-else>
                                    No available couriers
                                </div>
                                <input type="hidden" name="did" value="${order.delivery.id}"/>
                                <input :disabled="emp.selected === ''" type="submit" value="Change" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                <button @click="emp.showemp = false">Cancel</button>
                            </form>
                        </div>
                    <p><strong>Courier: </strong>${order.delivery.employee.firstname} ${order.delivery.employee.lastname}</p>
                    <p><strong>Status: </strong>${order.delivery.status}</p>
                    <p><strong>Date of Approval: </strong>${order.delivery.beginDate}</p>
                    <p><strong>Duration: </strong>
                        ${order.delivery.duration gt 0?order.delivery.duration+=' day delivery':'N/A'}
                    </p>
                    <p>
                        <strong>Delivery Location: </strong>
                        ${order.delivery.address.street} ${order.delivery.address.city} ${order.delivery.address.country}
                    </p>
                    <p><strong>Date of Completion: </strong>
                        ${order.delivery.deliveryDate?order.delivery.deliveryDate:'N/A'}
                    </p>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
        
    </jsp:body>
</t:mgtag>
