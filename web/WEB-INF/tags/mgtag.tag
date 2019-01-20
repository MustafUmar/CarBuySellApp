<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>
    <jsp:body>
        <header>
            <%-- Include header.jsp --%>
            <%@include file="/WEB-INF/views/segment/header.jsp" %>
        </header>
        <main>
            <div class="sidemenu-layout">
                <div class="sidemenu">
                    <nav>
                        <%@include file="/WEB-INF/views/segment/mgsidebar.jsp" %>
                    </nav>
                </div>
                <div id="mgapp" class="admin-container">
                    <jsp:doBody />
                </div>
            </div>
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        </footer>
        
        <script src="${pageContext.request.contextPath}/resources/js/ven/vue.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/js/ven/require.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/client/js/mgappb.js" ></script>
    </jsp:body>
</t:wrapper>