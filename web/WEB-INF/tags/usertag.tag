<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@tag description="Master page wrapper" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
    <head>
        <!-- meta -->
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="csrf_token" content="${_csrf.token}"/>
        <meta name="csrf_header" content="${_csrf.headerName}"/>
        <!--<meta charset="ISO-8859-1">-->
        
        <!-- iDevices & Retina Favicons -->
	<link rel="apple-touch-icon-precomposed" type="image/x-icon" href="${pageContext.request.contextPath}/resources/client/images/favicons/apple-touch-icon-72x72-precomposed.png" sizes="72x72" />
	<link rel="apple-touch-icon-precomposed" type="image/x-icon" href="${pageContext.request.contextPath}/resources/client/images/favicons/apple-touch-icon-114x114-precomposed.png" sizes="114x114" />
	<link rel="apple-touch-icon-precomposed" type="image/x-icon" href="${pageContext.request.contextPath}/resources/client/images/favicons/apple-touch-icon-144x144-precomposed.png" sizes="144x144" />
	<link rel="apple-touch-icon-precomposed" type="image/x-icon" href="${pageContext.request.contextPath}/resources/client/images/favicons/apple-touch-icon-precomposed.png" />
        
        <!--  Desktop Favicons  -->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/client/images/favicons/favicon-32x32.png" sizes="32x32">
        
        <!-- ***** Boostrap Custom / Addons Stylesheets ***** -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/bootstrap.css" type="text/css" media="all">

	<!-- Font Awesome icons library -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/fonts/font-awesome/css/font-awesome.min.css" type="text/css" media="all">

	<!-- IOS Slider required CSS Stylesheet file -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/sliders/ios/style.css" type="text/css" media="all">

	<!-- ***** Main + Responsive & Base sizing CSS Stylesheet ***** -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/template.css" type="text/css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/responsive.css" type="text/css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/base-sizing.css" type="text/css" media="all">

	<!-- Custom CSS Stylesheet (where you should add your own css rules) -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/custom.css" type="text/css" />

	<!-- Modernizr Library -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/modernizr.min.js"></script>

	<!-- jQuery Library -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/jquery.js"></script>
        
         <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css">--> 
         <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/site.css">-->
         <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/side.css">-->
        <title>Buy Sell Cars</title>
        
    </head>
    <body class="kl-store-page kl-store single-product preloader">
        
        <%-- Include supportpanel.jsp --%>
        <%@include file="/WEB-INF/views/segment/supportpanel.jsp" %>
        
        <div id="vapp">
            <!-- Page Wrapper -->
            <div id="page_wrapper">

                <header id="header" class="site-header cta_button" data-header-style="1">
                    <%-- Include header.jsp --%>
                    <%@include file="/WEB-INF/views/segment/uheader.jsp" %>
                </header>
                <main>
                    <div>
                        <!--<shopcart :items=cart.length></shopcart>-->
                        <jsp:doBody />
                    </div>
                </main>
                <footer id="footer" data-footer-style="1">
                    <%-- Include footer.jsp --%>
                    <%@include file="/WEB-INF/views/segment/footer.jsp" %>
                </footer>

            </div>
        </div>
        
        
        
        
        <%@include file="/WEB-INF/views/segment/loginregisterpanel.jsp" %>
        
        <%@include file="/WEB-INF/views/segment/contactpopup.jsp" %>
        
        <!-- ToTop trigger -->
	<a href="#" id="totop">TOP</a>
	<!--/ ToTop trigger -->
        
	

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID.
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-XXXXX-X', 'auto');
	  ga('send', 'pageview');
	</script>
	-->
        
        <script src="${pageContext.request.contextPath}/resources/js/ven/vue.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/js/ven/require.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/client/js/uappb.js" ></script>

    </body>
    
    
</html>

<%--<t:wrapper>
    <jsp:body>
        
    </jsp:body>
    
</t:wrapper>--%>