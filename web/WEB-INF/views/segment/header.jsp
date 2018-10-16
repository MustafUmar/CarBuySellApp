<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div>
    <div style="float:right">
        <sec:authorize access="!isAuthenticated()">
            <button>Login</button>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <sec:authorize access="hasRole('ROLE_USER')">
                <button onclick="event.preventDefault();document.getElementById('ulogout').submit();">Logout</button>
                <form action="${pageContext.request.contextPath}/user/logout" method="post" id="ulogout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                </form>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <button onclick="event.preventDefault();document.getElementById('alogout').submit();">Logout</button>
                <form action="${pageContext.request.contextPath}/admin/logout" method="post" id="alogout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                </form>
            </sec:authorize>
        </sec:authorize>
    </div>
</div>