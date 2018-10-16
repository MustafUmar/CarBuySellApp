<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>
    <jsp:body>
        <div class="sidemenu-layout">
            <div class="sidemenu">
                <nav>
                    <%@include file="/WEB-INF/views/segment/sidebar.jsp" %>
                </nav>
            </div>
            <div class="admin-container">
                <jsp:doBody />
            </div>
        </div>
    </jsp:body>
    
</t:wrapper>