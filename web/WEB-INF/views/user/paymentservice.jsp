<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <h1>Error</h1>
        <p>Unable to connect to payment service provider.</p>
        <button><a href="${pageContext.request.contextPath}/user/order">Choose another payment option.</a></button>
    </jsp:body>
</t:usertag>