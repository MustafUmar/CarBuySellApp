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
                <div class="admin-container">
                    <jsp:doBody />
                </div>
            </div>
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        </footer>
    </jsp:body>
</t:wrapper>