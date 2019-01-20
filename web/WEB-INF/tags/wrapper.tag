<%@tag description="Master page wrapper" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
    <head>
        <!-- meta -->
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="csrf_token" content="${_csrf.token}"/>
        <meta name="csrf_header" content="${_csrf.headerName}"/>
        <!--<meta charset="ISO-8859-1">-->
        
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/images/favicon-32x32.png">
        
        <!--Core CSS -->
        <link href="${pageContext.request.contextPath}/resources/back/bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/back/css/bootstrap-reset.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/back/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!--clock css-->
        <link href="${pageContext.request.contextPath}/resources/back/js/css3clock/css/style.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/back/css/style-responsive.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/back/images" />
        
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/site.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/side.css">
        <title>Buy Sell Cars</title>
        
    </head>
    <body>
        
        <jsp:doBody />

    </body>
    
    <!-- Placed js at the end of the document so the pages load faster -->

      <!--Core js-->
      <script src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/bs3/js/bootstrap.min.js"></script>
      <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.dcjqaccordion.2.7.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/jquery.scrollTo.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/jquery.nicescroll.js"></script>
      <!--Easy Pie Chart-->
      <script src="${pageContext.request.contextPath}/resources/back/js/easypiechart/jquery.easypiechart.js"></script>
      <!--Sparkline Chart-->
      <script src="${pageContext.request.contextPath}/resources/back/js/sparkline/jquery.sparkline.js"></script>
      <!--jQuery Flot Chart-->
      <script src="${pageContext.request.contextPath}/resources/back/js/flot-chart/jquery.flot.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/flot-chart/jquery.flot.tooltip.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/flot-chart/jquery.flot.resize.js"></script>
      <script src="${pageContext.request.contextPath}/resources/back/js/flot-chart/jquery.flot.pie.resize.js"></script>
      <!--clock init-->
      <script src="${pageContext.request.contextPath}/resources/back/js/css3clock/js/css3clock.js"></script>

      <!--common script init for all pages-->
      <script src="${pageContext.request.contextPath}/resources/back/js/scripts.js"></script>
    
</html>