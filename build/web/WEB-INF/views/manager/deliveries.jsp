<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/datefunctions.tld" prefix="f" %>

<t:mgtag>
    <jsp:body>
        
        <div class="block">
            <div class="block-title">
                <h3>Pending Deliveries</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty delvs['pending']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Courier</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${delvs['pending']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${not empty order.order.delivery.employee?order.order.delivery.employee.firstname+=' '+=order.order.delivery.employee.lastname:'N/A'} </td>
                                <td>${order.order.delivery.duration gt 0?order.order.delivery.duration:'N/A'}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}/delivery"><button>Delivery Details</button></a>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>Order info</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No pending deliveries</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Awaiting Deliveries</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty delvs['awaiting']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Courier</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${delvs['awaiting']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${not empty order.order.delivery.employee?order.order.delivery.employee.firstname+=' '+=order.order.delivery.employee.lastname:'N/A'} </td>
                                <td>${order.order.delivery.duration gt 0?order.order.delivery.duration:'N/A'}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}/delivery"><button>Delivery Details</button></a>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>Order info</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No awaiting deliveries</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Ongoing Deliveries</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['ongoing']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Courier</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['ongoing']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${not empty order.order.delivery.employee?order.order.delivery.employee.firstname+=' '+=order.order.delivery.employee.lastname:'N/A'} </td>
                                <td>${order.order.delivery.duration gt 0?order.order.delivery.duration:'N/A'}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}/delivery"><button>Delivery Details</button></a>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>Order info</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No ongoing deliveries</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Withdrawn Deliveries</h3>
            </div>
            <div class="block-content">
                <c:choose>
                    <c:when test="${not empty orders['canceled']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Courier</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['canceled']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${not empty order.order.delivery.employee?order.order.delivery.employee.firstname+=' '+=order.order.delivery.employee.lastname:'N/A'} </td>
                                <td>${order.order.delivery.duration gt 0?order.order.delivery.duration:'N/A'}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}/delivery"><button>Delivery Details</button></a>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>Order info</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No withdrawn deliveries</p>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="block">
            <div class="block-title">
                <h3>Recently Completed</h3>
            </div>
            <div class="block-content">
                <%--<c:choose>
                    <c:when test="${not empty orders['complete']}">
                        <table class="table">
                            <tr>
                                <th>#</th><th>Order Number</th><th>Courier</th><th>Duration</th><th></th>
                            </tr>
                            <c:forEach var="order" items="${orders['complete']}" varStatus="lp">
                            <tr>
                                <td>${lp.index + 1}</td>
                                <td>${order.order.orderNumber}</td>
                                <td>${not empty order.order.delivery.employee?order.order.delivery.employee.firstname+=' '+=order.order.delivery.employee.lastname:'N/A'} </td>
                                <td>${order.order.delivery.duration gt 0?order.order.delivery.duration:'N/A'}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}/delivery"><button>Delivery Details</button></a>
                                    <a href="${pageContext.request.contextPath}/mg/order/${order.order.id}"><button>Order info</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>No awaiting deliveries</p>
                    </c:otherwise>
                </c:choose>--%>
                
            </div>
        </div>
        
    </jsp:body>
</t:mgtag>
