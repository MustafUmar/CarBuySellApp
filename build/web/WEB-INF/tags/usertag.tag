<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>
    <jsp:body>
        <header>
            <%-- Include header.jsp --%>
            <%@include file="/WEB-INF/views/segment/uheader.jsp" %>
        </header>
        <main>
            <div id="vapp">
                <shopcart :items=cart.length></shopcart>
                <jsp:doBody />
            </div>
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        </footer>
        
        <script src="${pageContext.request.contextPath}/resources/js/ven/vue.js" ></script>
        <script
        src="${pageContext.request.contextPath}/resources/js/ven/require.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
        <!--data-main="${pageContext.request.contextPath}/resources/js/ven/rqconfig.js"-->
    </jsp:body>
    
</t:wrapper>