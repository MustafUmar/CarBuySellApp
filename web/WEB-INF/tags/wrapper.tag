<%@tag description="Master page wrapper" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%--<%@attribute name="message"%>--%>
<!DOCTYPE html>
<%--<spring:url value="" var="" />--%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="ISO-8859-1">
        <title>Buy Sell Cars</title>
    </head>
    <body>
        <header>
            <%-- Include header.jsp --%>
            <%--@include file="/WEB-INF/views/header.jsp"--%>
        </header>
        <main>
            <jsp:doBody />
        </main>
        <footer>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/footer.jsp"--%>
        </footer>
    </body>
</html>