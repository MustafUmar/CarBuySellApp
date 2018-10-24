<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:admintag>
    <jsp:body>
        <div style="margin-bottom: 1rem;">
            <a href="${pageContext.request.contextPath}/admin/manager/create">Add Manager</a>
        </div>
        <c:choose>
            <%--<c:when test="${fn:length(branches) gt 0}"> --%>
            <c:when test="${not empty managers }">
                <table>
                <c:forEach items="${managers}" var="manager">
                    <tr>
                        <td>
                            <p><em>${manager.firstname} ${manager.lastname}<em></p>
                            <p>Branch: ${manager.branch.name}</p>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/admin/manager/edit/${manager.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
            </c:when>
            <c:otherwise>
                <div><b>No Managers</b></div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:admintag>
