<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:emtag>
    <jsp:body>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="user" property="principal" />
            <div><p>Welcome, ${user.admin.firstname}</p></div>
        </sec:authorize>
            
        <div class="dashview">
            <a href="${pageContext.request.contextPath}/mg/orders" class="box">
                <div class="box-desc">
                    Orders(0)
                </div>
                <p class="box-title">New Orders</p>
            </a>
            <a href="${pageContext.request.contextPath}/mg/deliveries" class="box">
                <div class="box-desc">
                    Pending(0)
                </div>
                <p class="box-title">Deliveries</p>
            </a>
        </div>
            
    </jsp:body>
</t:emtag>
