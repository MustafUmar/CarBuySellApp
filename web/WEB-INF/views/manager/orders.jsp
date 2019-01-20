<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/datefunctions.tld" prefix="f" %>

<t:mgtag>
    <jsp:body>
        <!--<p>Last 48 hours order section</p>-->
        <div class="block">
            <div class="block-title">
                <h3>Pending Orders</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['pending']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Customer Name</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['pending']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${order.order.customer.firstname} ${order.order.customer.lastname}</td>
                                <td>${f:pastTime(order.order.orderDate)}</td>
                                <td><a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>View</button></a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No pending orders</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Incomplete Orders</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['approved']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Customer Name</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['approved']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${order.order.customer.firstname} ${order.order.customer.lastname}</td>
                                <td>${f:pastTime(order.order.orderDate)}</td>
                                <td><a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>View</button></a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No incomplete orders</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Canceled Deliveries</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['canceled']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Customer Name</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['canceled']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${order.order.customer.firstname} ${order.order.customer.lastname}</td>
                                <td>${f:pastTime(order.order.orderDate)}</td>
                                <td><a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>View</button></a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No canceled deliveries</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Recently Viewed</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['viewed']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Customer Name</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['viewed']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${order.order.customer.firstname} ${order.order.customer.lastname}</td>
                                <td>${f:pastTime(order.order.orderDate)}</td>
                                <td><a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>View</button></a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>None</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Recently Completed</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['completed']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Customer Name</th><th>Duration</th><th></th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['recent']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${order.order.customer.firstname} ${order.order.customer.lastname}</td>
                                <td>${f:pastTime(order.order.orderDate)}</td>
                                <th>No user rating</th>
                                <td><a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>View</button></a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>None</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        
    </jsp:body>
</t:mgtag>
