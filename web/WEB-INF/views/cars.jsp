<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <h1>Cars</h1>
        <ul>
            <c:forEach items="${ cars }" var="car">
                <li>${car.make}</li>
            </c:forEach>
        </ul>
    </jsp:body>
</t:usertag>