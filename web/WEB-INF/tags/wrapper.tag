<%@tag description="Master page wrapper" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%--<spring:url value="" var="" />--%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf_token" content="${_csrf.token}"/>
        <meta name="csrf_header" content="${_csrf.headerName}"/>
        <!--<meta charset="ISO-8859-1">-->
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css"> 
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/site.css"> 
        <title>Buy Sell Cars</title>
        
    </head>
    <body>
        <jsp:doBody />
<!--        <header>
            <%-- Include header.jsp --%>
            <%--@include file="/WEB-INF/views/segment/header.jsp" --%>
        </header>
        <main>
            
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        </footer>-->
            
        
<!--        <script src="${pageContext.request.contextPath}/resources/js/vue.min.js" ></script>-->
        
            
            
    </body>
    
    
</html>