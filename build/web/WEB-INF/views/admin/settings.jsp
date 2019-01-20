<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:admintag>
    <jsp:body>
        <div style="margin-bottom: 1rem;">
            <h2>Search Options</h2>
        </div>
        <hr/>
        <c:if test="${param.error != null and param.error eq true}">
            <p>Indexing not successful!</p>
        </c:if>
            <p><a href="${pageContext.request.contextPath}/admin/searchindex">Build Index</a>
                
        <div style="margin-bottom: 1rem;">
            <h2>Local Storage</h2>
        </div>
        <hr/>
        <button class="button" @click="saveCar">Save Car Locally</button>
        <span v-if="saveFile.saveSuccess">
            {{saveFile.msg}} 
            <button @click="saveFile.saveSuccess = false">Ok</button>
        </span>
    </jsp:body>
</t:admintag>
