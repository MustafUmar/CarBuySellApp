<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:admintag>
    <jsp:body>
        <h2>New Manager</h2>
        <c:url var="actionForm" value="/admin/manager/new"/>
        <form class="form" method="post" action="${actionForm}">
            <div>
                <label>Select manager's branch:</label>
                <spring:bind path="brin.data">
                    <select name="${status.expression}">
                        <option disabled="true" selected>-- Choose branch --</option>
                        <c:forEach var="branch" items="${sessionScope.branches}" varStatus="lp">
                            <option value="${lp.index + 1}">${branch.name}</option>
                        </c:forEach>
                    </select>
                </spring:bind>
            </div>
            <div>
                <label>First Name:</label>
                <spring:bind path="mg.firstname">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Last Name:</label>
                <spring:bind path="mg.lastname">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Email:</label>
                <spring:bind path="mg.email">
                    <input type="text" name="${status.expression}" value="${status.value}"/>
                </spring:bind>
            </div>
            <div>
                <label>Phone Number:</label>
                <spring:bind path="mg.phone">
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
        </form>
    </jsp:body>
</t:admintag>
