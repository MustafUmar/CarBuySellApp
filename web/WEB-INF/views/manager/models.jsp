<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty car}">
    <% response.sendRedirect(getServletContext().getContextPath()+"/mg/cars"); %>
</c:if>
<t:mgtag>
    <jsp:body>
        <a href="${pageContext.request.contextPath}/mg/cars">Back To Cars</a>
        <h1>${car.make} Models</h1>
        <h3><a href="${pageContext.request.contextPath}/mg/model/${car.make}/${car.id}/create">Add Models</a></h3>
        <table cellpadding="5" style="width: 70%;">
            <c:choose>
                <c:when test="${not empty car.models}">
                    <c:forEach var="model" items="${car.models}">
                        <tr style="border-bottom: 1px solid grey;">
                            <td>
                                <a href="${pageContext.request.contextPath}/mg/cars/${car.make}/${model.name}/${model.id}" style="padding: .2rem 0">
                                    >> ${model.name}
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div>No models</div>
                </c:otherwise>
            </c:choose>
        </table>
    </jsp:body>
</t:mgtag>
