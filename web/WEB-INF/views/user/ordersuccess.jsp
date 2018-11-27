<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <h1>Success</h1>
        <p>Your order will be reviewed and prepared for delivery</p>
        <a href="${pageContext.request.contextPath}/user/orders">Check your orders here.</a>
    </jsp:body>
</t:usertag>