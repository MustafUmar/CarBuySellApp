<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:admintag>
    <jsp:body>
        <div style="margin-bottom: 1rem;">
            <a href="${pageContext.request.contextPath}/admin/branch/create">New Branch</a>
        </div>
        <c:choose>
            <%--<c:when test="${fn:length(branches) gt 0}"> --%>
            <c:when test="${not empty branches }">
                <table>
                <c:forEach items="${branches}" var="branch">
                    <tr>
                        <td>${branch.name} -- ${branch.address}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/branch/edit/${branch.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
            </c:when>
            <c:otherwise>
                <div><b>No Branches</b></div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:admintag>
