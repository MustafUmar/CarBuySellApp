<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:mgtag>
    <jsp:body>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="user" property="principal" />
            <div><p>Welcome, ${user.admin.firstname}</p></div>
        </sec:authorize>
            
        <div class="dashview">
            <a href="${pageContext.request.contextPath}/mg/orders" class="box">
                <div class="box-desc">
                    <div>Pending(${dashdata['orders'][0]})</div>
                    <div>Canceled(${dashdata['orders'][1]})</div>
                </div>
                <p class="box-title">Orders</p>
            </a>
            <a href="${pageContext.request.contextPath}/mg/deliveries" class="box">
                <div class="box-desc">
                    <div>Pending(${dashdata['delvs'][0]})</div>
                    <div>Issues(${dashdata['delvs'][1]})</div>
                </div>
                <p class="box-title">Deliveries</p>
            </a>
            <a class="box">
                <div class="box-desc">
                    Requests(0)
                </div>
                <p class="box-title">Car Trade Requests</p>
            </a>
            <a class="box">
                <div class="box-desc">
                    Appointments(0)
                </div>
                <p class="box-title">Test Drive Appointment</p>
            </a>
        </div>
            
    </jsp:body>
</t:mgtag>
