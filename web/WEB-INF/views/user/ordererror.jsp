<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <h1>Error</h1>
        <c:if test="${not empty sessionScope.ordererr}">
            <p>${sessionScope.ordererr}</p>
        </c:if>
        
    </jsp:body>
</t:usertag>