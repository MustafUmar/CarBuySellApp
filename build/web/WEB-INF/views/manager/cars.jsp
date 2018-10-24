<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:mgtag>
    <jsp:body>
        <style>
            .cargview {
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-gap: 1.2rem;
            }
            .box-content {
                border: 1px solid grey;
                border-radius: 4px;
                padding: .2rem .8rem;
            }
        </style>
        <a href="${pageContext.request.contextPath}/mg/model/${sessionScope.carid}">Back To Models</a>
        <h1>${sessionScope.carname} ${modelcars.name}</h1>
        <h3><a href="${pageContext.request.contextPath}/mg/car/${sessionScope.modelname}/newmodel/${modelcars.id}">
                Add New ${modelcars.name} Car
            </a>
        </h3>
            <div class="cargview" style="width: 70%; margin: 0 auto;">
            <c:choose>
                <c:when test="${not empty modelcars.cardetails}">
                    <c:forEach var="cardet" items="${modelcars.cardetails}">
                        <div class="box-content">
                            <h4>${cardet.name}</h4>
                            <h5>${cardet.price}</h5>
                            <div>
                                <p>Year: ${cardet.year}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No ${sessionScope.carname} ${modelcars.name} cars.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:mgtag>
