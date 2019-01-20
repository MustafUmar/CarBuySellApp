<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<t:usertag>
    <jsp:body>
        <h1>Welcome User</h1>
        
        
        <!-- INCLUDE // These should be loaded in every page -->
        <%@include file="/WEB-INF/views/segment/everypagescript.jsp" %>
    </jsp:body>
</t:usertag>
