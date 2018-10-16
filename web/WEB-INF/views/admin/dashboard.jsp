<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<t:admintag>
    <jsp:body>
        <c:if test="${param.error != null and param.error eq true}">
            <div style="width:60%;margin: 0 auto;padding: 8px;">
                <font color="red">Haba! mek una put correct credentials</font>
            </div>
        </c:if>
        <form method="post" action="<c:url value="admin/login" />">
            <h1>Admin</h1>
            <sec:authorize access="isAuthenticated()">
                <div><h1>Welcome, <sec:authentication property="name"/></h1></div>
            </sec:authorize>
        </form>
    </jsp:body>
</t:admintag>
