<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:admintag>
    <jsp:body>
        <div style="margin-bottom: 1rem;">
            <a href="${pageContext.request.contextPath}/admin/employee/create">Add Employee</a>
        </div>
        <c:choose>
            <%--<c:when test="${fn:length(branches) gt 0}"> --%>
            <c:when test="${not empty employees }">
                <table>
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td>
                            <p><em>${employee.firstname} ${employee.lastname}<em></p>
                            <%--<p>Branch: ${employee.branch.name}</p>--%>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/admin/employee/edit/${employee.id}">Edit</a></td>
                    </tr>
                </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div><b>No Employees</b></div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:admintag>
