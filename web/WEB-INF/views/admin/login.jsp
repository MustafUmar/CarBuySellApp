<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <% response.sendRedirect(getServletContext().getContextPath()+"/admin/dashboard"); %>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_MANAGER')">
        <% response.sendRedirect(getServletContext().getContextPath()+"/mg/dashboard"); %>
    </sec:authorize>
</sec:authorize>
<t:wrapper>
    <jsp:body>
        <header>
            <%-- Include header.jsp --%>
            <%@include file="/WEB-INF/views/segment/header.jsp" %>
        </header>
        <main>
            <c:if test="${param.error != null and param.error eq true}">
                <div style="width:60%;margin: 0 auto;padding: 8px;">
                    <font color="red">Haba! mek una put correct credentials</font>
                </div>
            </c:if>
            <form method="post" action="<c:url value="login" />">
                <h1>Admin</h1>
                <div>
                    <label>Username:</label>
                    <input type="text" name="username"/>
                </div>
                <div>
                    <label>Password:</label>
                    <input type="password" name="password"/>
                </div>
                <div>
                    <input type="submit" value="Submit" />
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            </form>
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        </footer>
    </jsp:body>
</t:wrapper>
