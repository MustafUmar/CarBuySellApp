<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:wrapper>
    <jsp:body>
        <c:url var="actionForm" value="/user/register"/>
        <form:form class="form" method="post" action="${actionForm}" modelAttribute="customer">
            <form:hidden path="id"/>
            <div>
                <label>First Name:</label>
                <form:input path="firstname"/>
            </div>
            <div>
                <label>Last Name:</label>
                <form:input path="lastname"/>
            </div>
            <div>
                <label>Email:</label>
                <form:input path="email"/>
            </div>
            <div>
                <label>Phone Number:</label>
                <form:input path="phonenum"/>
            </div>
            <div>
                <label>Password:</label>
                <form:input path="password"/>
            </div>
            <div>
                <input type="submit" value="Submit" />
            </div>
        </form:form>
    </jsp:body>
</t:wrapper>
