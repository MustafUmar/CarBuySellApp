<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div>
    <div>
        <a href="${pageContext.request.contextPath}/" style="color: white;">
            Home
        </a>
    </div>
    <div style="float:right">
        <sec:authorize access="!isAuthenticated()">
            <button><a href="${pageContext.request.contextPath}/login">Login</a></button>
        </sec:authorize>
            
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="user" property="principal" />
                <span style="padding: 0 .5rem;">
                    <a style="color:white;" href="${pageContext.request.contextPath}/user/profile">Profile</a>
                </span>
                <span style="padding: 0 .5rem;">
                    <a style="color:white;" href="${pageContext.request.contextPath}/user/orders">Orders</a>
                </span>
                <span style="color:white; padding: 0 .5rem">
                    ${user.user.firstname} ${user.user.lastname}
                </span>
                <button onclick="event.preventDefault();document.getElementById('ulogout').submit();">Logout</button>
                <form action="${pageContext.request.contextPath}/user/logout" method="post" id="ulogout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                </form>
            
        </sec:authorize>
    </div>
</div>
