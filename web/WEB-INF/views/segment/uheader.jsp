<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header background -->
<div class="kl-header-bg"></div>
<!--/ Header background -->

<!-- Header wrapper -->
<div class="site-header-wrapper">
    <!-- Header Top wrapper -->
    <div class="site-header-top-wrapper">
        <!-- Header Top container -->
        <div class="siteheader-container container">
            <!-- Header Top -->
            <div class="site-header-row site-header-top d-flex justify-content-between">
                <!-- Header Top Left Side -->
                <div class="site-header-top-left d-flex">
                    <!-- Header Top Social links -->
                    <ul class="topnav social-icons sc--clean align-self-center">
                        <li>
                            <a href="https://www.facebook.com" target="_blank" title="Facebook">
                                    <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.twitter.com" target="_blank" title="Twitter">
                                    <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.dribble.com" target="_blank" title="Dribbble">
                                    <i class="fab fa-dribbble"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.google.com" target="_blank" title="Google Plus">
                                    <i class="fab fa-google-plus-g"></i>
                            </a>
                        </li>
                    </ul>
                    <!--/ Header Top Social links -->

                    <div class="clearfix visible-xxs">
                    </div>

                    <!-- Top Header contact text -->
                    <div class="kl-header-toptext align-self-center">	
                            <span class="topnav-item--text">QUESTIONS? CALL: </span>
                            <a href="tel:0900 800 900" class="fw-bold">0903 800 9000</a>
                            <i class="phone-header fas fa-phone ml-5 visible-xs visible-sm visible-md"></i>
                    </div>
                    <!--/ Top Header contact text -->
                </div>
                <!--/ .site-header-top-left -->

                <!-- Header Top Right Side -->
                <div class="site-header-top-right d-flex">
                    <!-- Languages -->
                    <div class="topnav topnav--lang align-self-center">
                        <div class="languages drop">
                            <a href="#" class="topnav-item">
                                <span class="fas fa-globe xs-icon"></span>
                                <span class="topnav-item--text">
                                    BRANCH
                                    ${sessionScope.carfilter.brid eq 0?': ALL':': '+=sessionScope.branches[sessionScope.carfilter.brindex][2]}
                                </span>
                            </a>
                            <div class="pPanel">
                                <ul class="inner">
                                    <li class="toplang-item ${sessionScope.carfilter.brid eq 0?'active':''}">
                                        <a href="${pageContext.request.contextPath}/changebranch/0/0">
                                                ALL
                                        </a>
                                    </li>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.branches}">
                                            <c:forEach items="${sessionScope.branches}" var="br" varStatus="lp">
                                                <li class="toplang-item ${br[0] eq sessionScope.carfilter.brid?'active':''}">
                                                    <a href="${pageContext.request.contextPath}/changebranch/${br[0]}/${lp.index}">
                                                            ${br[2]}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                            <c:otherwise>
                                                <li class="toplang-item ">
                                                        <a href="#">
                                                                ABUJA
                                                        </a>
                                                </li>
                                                <li class="toplang-item">
                                                        <a href="#">
                                                                LAGOS
                                                        </a>
                                                </li>
                                                <li class="toplang-item">
                                                        <a href="#">
                                                                KADUNA
                                                        </a>
                                                </li>
                                            </c:otherwise>
                                    </c:choose>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--/ Languages -->

                    <div class="topnav support--panel align-self-center">
                            <!-- Support panel trigger -->
                            <label for="support_p" class="topnav-item spanel-label">
                                    <i class="fas fa-info-circle support-info closed"></i>
                                    <i class="far fa-times-circle support-info opened"></i>
                                    <span class="topnav-item--text">HOW WE WORK</span>
                            </label>
                            <!--/ Support panel trigger -->
                    </div>
                    
                    <!-- Login trigger -->
                    <sec:authorize access="!isAuthenticated()">
                        <div class="topnav login--panel align-self-center">
                            <a class="topnav-item popup-with-form" href="#login_panel">
                                <i class="login-icon fas fa-sign-in-alt visible-xs xs-icon"></i>
                                <span class="topnav-item--text">LOGIN</span>
                            </a>
                        </div>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <!-- Profile -->
                        <div class="topnav topnav--lang align-self-center">
                            <div class="languages drop">
                                <a style="color: white;" href="#" class="topnav-item">
                                        <i class="fas fa-user visible-xs xs-icon"></i>
                                </a>
                                <div class="pPanel">
                                    <ul class="inner">
                                        <li class="toplang-item">
                                            <a href="${pageContext.request.contextPath}/user/profile">
                                                My Profile
                                            </a>
                                        </li>
                                        <li class="toplang-item">
                                            <a href="#" onclick="event.preventDefault();document.getElementById('ulogout').submit();">
                                                Logout
                                            </a>
                                            <form action="${pageContext.request.contextPath}/user/logout" method="post" id="ulogout">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--/ Profile -->	
                    </sec:authorize>
                    <!--/ Login trigger -->			

                    <!-- header search -->
                    <div id="search" class="header-search align-self-center">
                            <a href="#" class="searchBtn "><span class="fas fa-search white-icon"></span></a>
                            <div class="search-container">
                                    <div id="searchform" class="header-searchform">
                                            <input id="searchtext" name="q" maxlength="20" class="inputbox" type="text" size="20" value="SEARCH ..." onblur="if (this.value=='') this.value='SEARCH ...';" onfocus="if (this.value=='SEARCH ...') this.value='';">
                                            <button id="searchsubmit" class="searchsubmit fas fa-search white-icon"></button>
                                    </div>
                            </div>
                    </div>
                    <!--/ header search -->
                </div>
                <!--/ .site-header-top-right -->
            </div>
            <!--/ .site-header-row .site-header-top -->

            <!-- Header separator -->
            <div class="separator site-header-separator"></div>
            <!--/ Header separator -->
        </div>
        <!--/ .siteheader-container .container -->
    </div>
    <!--/ Header Top wrapper -->

    <!-- Header Main wrapper -->
    <div class="site-header-main-wrapper d-flex">
        <!-- Header Main container -->
        <div class="siteheader-container container align-self-center">
            <!-- Header Main -->
            <div class="site-header-row site-header-main d-flex flex-row justify-content-between">
                <!-- Header Main Left Side -->
                <div class="site-header-main-left d-flex justify-content-start align-items-center">
                    <!-- Logo container-->
                    <div class="logo-container hasInfoCard logosize--yes">
                        <!-- Logo -->
                        <h1 class="site-logo logo" id="logo">
                                <a href="index.html" title="">
                                        <img src="${pageContext.request.contextPath}/resources/client/images/kallyas-logo.svg" class="logo-img" alt="Kallyas" title="Kallyas Gigantic Premium Template" />
                                </a>
                        </h1>
                        <!--/ Logo -->

                        <!-- InfoCard -->
                        <div id="infocard" class="logo-infocard">
                            <div class="custom">
                                <div class="row">
                                    <div class="col-sm-6 left-side d-flex">
                                            <div class="align-self-center">
                                                    <div class="infocard-wrapper text-center">
                                                            <img src="${pageContext.request.contextPath}/resources/client/images/kallyas_icon.png" class="mb-25" alt="Kallyas" title="Kallyas" />
                                                            <p>
                                                                    Sell and Buy Cars the largest autodealers in the country, with over<strong>500,000 satisfied Customers</strong>.
                                                            </p>
                                                    </div>
                                                    <!--/ infocard-wrapper -->
                                            </div>
                                            <!--/ .align-self-center -->
                                    </div>
                                    <!--/ col-sm-6 left-side d-flex -->

                                    <div class="col-sm-6 right-side">
                                            <div class="custom contact-details">
                                                    <p>
                                                            Sell & Buy Cars LTD<br>
                                                            Street nr 100, 4536534, Abuja, NG <br>
                                                            <a href="mailto:sales@yourwebsite.com">sales@sellandbuycars.com</a>
                                                    </p>
                                                    <a href="http://goo.gl/maps/1OhOu" class="map-link" target="_blank" title="">
                                                            <span class="fas fa-map-marker-alt white-icon mr-10"></span>
                                                            <span>Open in Google Maps</span>
                                                    </a>
                                            </div>
                                            <div style="height:20px;">
                                            </div>
                                            <!-- Social links clean style -->
                                            <ul class="social-icons sc--clean">
                                                    <li><a href="#" target="_self" class="fab fa-twitter" title="Twitter"></a></li>
                                                    <li><a href="#" target="_self" class="fab fa-facebook-f" title="Facebook"></a></li>
                                                    <li><a href="#" target="_self" class="fab fa-dribbble" title="Dribbble"></a></li>
                                                    <li><a href="#" target="_blank" class="fab fa-google-plus-g" title="Google Plus"></a></li>
                                            </ul>
                                            <!--/ Social links clean style -->
                                    </div>
                                    <!--/ col-sm-6 right-side -->
                                </div>
                                <!--/ row -->
                            </div>
                            <!--/ custom -->
                        </div>
                        <!--/ InfoCard -->
                    </div>
                    <!--/ logo container-->

                        <!-- Separator -->
                        <div class="separator visible-xxs"></div>
                        <!--/ Separator -->
                </div>
                <!--/ .site-header-main-left -->

                <!-- Header Main Center Side -->
                <div class="site-header-main-center d-flex justify-content-center align-items-center">
                    <!-- Main Menu wrapper -->
                    <div class="main-menu-wrapper">
                        <!-- Responsive menu trigger -->
                        <div id="zn-res-menuwrapper">
                                <a href="#" class="zn-res-trigger "></a>
                        </div>
                        <!--/ responsive menu trigger -->

                        <!-- Main menu -->
                        <div id="main-menu" class="main-nav zn_mega_wrapper">
                            <ul id="menu-main-menu" class="main-menu zn_mega_menu">
                                <li class="menu-item"><a href="${pageContext.request.contextPath}/">HOME</a>

                                </li>
                                <li class="menu-item-has-children"><a href="${pageContext.request.contextPath}/buy-cars">BUY CARS</a>
                                
                                </li>
                                <li class="menu-item"><a href="showroom.html">SHOWROOM</a>
                                </li>
                                <li class="menu-item"><a href="upcomingcars.html">UPCOMING CARS</a>
                                </li>
                                <li class="menu-item"><a href="contact-us.html">CONTACT US</a>
                                </li>
                                <!-- <li class="menu-item-has-children"><a style="color: #CD2122;" href="contact-us.html">How we work</a>
                                        <ul class="sub-menu clearfix">
                                                <li><a href="#send_panel">How to Sell a Car</a></li>
                                                <li><a href="howbuycar.html">How to Buy a Car</a></li>
                                </li> -->																						

                            </ul>
                        </div>
                        <!--/ Main menu -->
                    </div>
                    <!--/ .main-menu-wrapper -->
                </div>						
                <!--/ .site-header-main-center -->

                <!-- Header Main Right Side -->
                <div class="site-header-main-right d-flex justify-content-end align-items-center">
                    <!-- Shopping Cart -->
                    <div class="mainnav mainnav--cart d-flex align-self-center">
                        <div class="drop">
                            <a href="${pageContext.request.contextPath}/user/shopcart" class="kl-cart-button" title="View your shopping cart">
                                    <i class="fas fa-shopping-basket xs-icon" :data-count="cart.length"></i>
                            </a>
                            <div class="pPanel">
                                <div class="inner cart-container">
                                    <div class="widget_shopping_cart_content">
                                        <ul class="cart_list product_list_widget ">
                                                <li>
                                                <a href="#" class="remove" title="Remove this item">×</a>
                                                <a href="#" class="product-title">
                                                        <img src="${pageContext.request.contextPath}/resources/client/images/ptf1.png" alt="Mercedes Benz" title="Mercedes Benz" />Mercedez Benz
                                                </a>
                                                <span class="color-variations">@010 Auto</span>
                                                <span class="quantity">1 × <span class="amount">₦3,000,000.00</span></span></li>
                                        </ul>
                                        <!-- end product list -->
                                        <p class="total">
                                                <strong>Subtotal:</strong><span class="amount">₦3,000,000.00</span>
                                        </p>
                                        <p class="buttons">
                                                <a href="${pageContext.request.contextPath}/user/shopcart" class="button wc-forward">View Cart</a>
                                                <a href="checkout.html" class="button checkout wc-forward">Checkout</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Shopping Cart -->

                    <!-- Call to action ribbon Free Quote (Contact form pop-up element) -->
                    <div class="quote-ribbon">
                            <a href="#contact_panel" id="ctabutton" class="ctabutton kl-cta-ribbon" title="SELL A CAR NOW" target="_self">
                                    <strong>SELL</strong>A CAR
                                    <svg version="1.1" class="trisvg"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" preserveaspectratio="none" width="14px" height="5px" viewbox="0 0 14 5" enable-background="new 0 0 14 5" xml:space="preserve">
                                            <polygon fill-rule="nonzero" points="14 0 7 5 0 0"></polygon>
                                    </svg>
                            </a>
                    </div>
                    <!--/ Call to action ribbon Free Quote (Contact form pop-up element) -->
                </div>
                <!--/ .site-header-main-right -->
            </div>
            <!--/ .site-header-row .site-header-main -->
        </div>
        <!--/ .siteheader-container .container -->
    </div>
    <!--/ Header Main wrapper -->
</div>
<!--/ Header wrapper -->






<%--
<div>
    <div>
        <a href="${pageContext.request.contextPath}/" style="color: white;">
            Home
        </a>
        <a href="${pageContext.request.contextPath}/test" style="color: white;">
            Home1
        </a>
    </div>
    <div style="float:right">
        <span style="padding: 0 .5rem;">
            <a style="color:white;" href="${pageContext.request.contextPath}/user/sellcar">Sell Car</a>
        </span>
        <sec:authorize access="!isAuthenticated()">
            <button><a href="${pageContext.request.contextPath}/login">Login</a></button>
        </sec:authorize>
            
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="user" property="principal" />
                <span style="padding: 0 .5rem;">
                    <a style="color:white;" href="${pageContext.request.contextPath}/user/profile">Profile</a>
                </span>
                <span style="padding: 0 .5rem;">
                    <a style="color:white;" href="${pageContext.request.contextPath}/user/orders">Orders</a>
                </span>
                <span style="color:white; padding: 0 .5rem">
                    ${user.user.firstname} ${user.user.lastname}
                </span>
                <button onclick="event.preventDefault();document.getElementById('ulogout').submit();">Logout</button>
                <form action="${pageContext.request.contextPath}/user/logout" method="post" id="ulogout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                </form>
            
        </sec:authorize>
    </div>
</div>
--%>