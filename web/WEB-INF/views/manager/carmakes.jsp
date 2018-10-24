<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:mgtag>
    <jsp:body>
        <h1>Make</h1>
        <div style="width: 70%;">
            <c:forEach var="car" items="${cars}">
                <a href="${pageContext.request.contextPath}/mg/model/${car.id}"
                   style="display: block; cursor: pointer; padding:.4rem 0; border-bottom: 1px solid grey;">
                    <span>${car.make}</span>
                    <span style="float: right">Models >></span>
                </a>
            </c:forEach>
        </div>
        
    </jsp:body>
</t:mgtag>
