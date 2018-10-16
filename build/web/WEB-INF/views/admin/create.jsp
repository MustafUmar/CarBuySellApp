<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<t:wrapper>
    <jsp:body>
        <c:url var="actionForm" value="/admin/new"/>
        <form method="post" action="${actionForm}">
            <div>
                <label>First Name:</label>
                <spring:bind path="admin.firstname">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Last Name:</label>
                <spring:bind path="admin.lastname">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Email:</label>
                <spring:bind path="admin.email">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Phone Number:</label>
                <spring:bind path="admin.phone">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Password:</label>
                <spring:bind path="user.password">
                    <input type="password" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            <div>
                <input type="submit" value="Create" />
            </div>
        <form>
    </jsp:body>
</t:wrapper>
