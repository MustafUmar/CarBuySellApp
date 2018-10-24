<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<t:admintag>
    <jsp:body>
        <h1>Admin</h1>
        <sec:authorize access="isAuthenticated()">
            <div><h1>Welcome, <sec:authentication property="name"/></h1></div>
        </sec:authorize>
    </jsp:body>
</t:admintag>
