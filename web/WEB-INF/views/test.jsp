<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon-32x32.png">

    <title>Dashboard</title>

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

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body class="full-width">

  <section id="container" class="hr-menu">
      <!--header start-->
      <header class="header fixed-top">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle hr-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="fa fa-bars"></span>
              </button>

              <!--logo start-->
              <!--logo start-->
              <div class="brand ">
                  <a href="dashboard.html" class="logo">
                      <img src="${pageContext.request.contextPath}/resources/back/images/kallyas-logo.svg" alt="">
                  </a>
              </div>
              <!--logo end-->
              <!--logo end-->
              <div class="horizontal-menu navbar-collapse collapse ">
                  <ul class="nav navbar-nav">
                      <li  class="active"><a href="dashboard.html">Dashboard</a></li>
                      <li><a href="managecars.html">Manage Cars</a></li>
                      <li><a href="manageorders.html">Manage Orders</a></li>
                      <li><a href="upcomingcars">Upcoming Cars</a></li>
                      <!-- <li class="dropdown">
                          <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">UI Kits <b class=" fa fa-angle-down"></b></a>
                          <ul class="dropdown-menu">
                              <li><a href="general.html">General</a></li>
                              <li><a href="buttons.html">Buttons</a></li>
                              <li><a href="typography.html">Typography</a></li>
                              <li><a href="font_awesome.html">Font Awesome</a></li>
                          </ul>
                      </li>
                      <li><a href="basic_table.html">Sample Menu</a></li>
                      <li class="dropdown">
                          <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">Extra <b class=" fa fa-angle-down"></b></a>
                          <ul class="dropdown-menu">
                              <li><a href="blank.html">Blank Page</a></li>
                              <li><a href="boxed_page.html">Boxed Page</a></li>
                              <li><a href="profile.html">Profile</a></li>
                              <li><a href="404.html">404 Error Page</a></li>
                              <li><a href="500.html">500 Error Page</a></li>
                          </ul>
                      </li> -->
                  </ul>

              </div>
              <div class="top-nav hr-top-nav">
                  <ul class="nav pull-right top-menu">
                      <li>
                          <input type="text" class="form-control search" placeholder=" Search">
                      </li>
                      <!-- user login dropdown start-->
                      <li class="dropdown">
                          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                              <img alt="" src="images/avatar1_small.jpg">
                              <span class="username">John Doe</span>
                              <b class="caret"></b>
                          </a>
                          <ul class="dropdown-menu extended logout">
                              <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                              <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                              <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li>
                              <li><a href="login.html"><i class="fa fa-key"></i> Log Out</a></li>
                          </ul>
                      </li>
                      <!-- user login dropdown end -->
                  </ul>
              </div>

          </div>

      </header>
      <!--header end-->
          <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-8">
                <!--Admin Dash-->
                <section class="panel">
                    <header class="panel-heading">
                        General Notification <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-cog"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                    </span>
                    </header>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mini-stat clearfix">
                                    <a href="#"><span class="mini-stat-icon orange"><i class="fa fa-gavel"></i></span><a>
                                    <div class="mini-stat-info">
                                        <span>7</span>
                                        Pending Orders
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mini-stat clearfix">
                                    <a href="#"><span class="mini-stat-icon tar"><i class="fa fa-tag"></i></span></a>
                                    <div class="mini-stat-info">
                                        <span>22,450</span>
                                        Test drive Requests
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mini-stat clearfix">
                                    <a href="#"><span class="mini-stat-icon pink"><i class="fa fa-gavel"></i></span><a>
                                    <div class="mini-stat-info">
                                        <span>7</span>
                                        New Order Received
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mini-stat clearfix">
                                    <a href="#"><span class="mini-stat-icon green"><i class="fa fa-tag"></i></span></a>
                                    <div class="mini-stat-info">
                                        <span>22,450</span>
                                        Copy Sold Today
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        <!-- Clock -->
            <div class="col-md-4">
                <div class="profile-nav alt">
                    <section class="panel">
                        <div class="user-heading alt clock-row terques-bg">
                            <h1>December 14</h1>
                            <p class="text-left">2014, Friday</p>
                            <p class="text-left">7:53 PM</p>
                        </div>
                        <ul id="clock">
                            <li id="sec"></li>
                            <li id="hour"></li>
                            <li id="min"></li>
                        </ul>
                        <ul class="clock-category">
                    <li>
                        <a href="#" class="active">
                            <i class="ico-clock2"></i>
                            <span>Clock</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="ico-alarm2 "></i>
                            <span>Alarm</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="ico-stopwatch"></i>
                            <span>Stop watch</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class=" ico-clock2 "></i>
                            <span>Timer</span>
                        </a>
                    </li>
                </ul>
                    </section>
                </div>
            </div>  
        </div>
        
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
    </section>

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

</body>
</html>
