<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        
        <!-- Page sub-header + Bottom mask style 3 -->
        <div id="page_header" class="page-subheader hg_def_header_style ">
            <div class="bgback"></div>

            <!-- Animated Sparkles -->
            <div class="th-sparkles"></div>
            <!--/ Animated Sparkles -->

            <!-- Background -->
            <div class="kl-bg-source">
                    <!-- Gradient overlay -->
                    <div class="kl-bg-source__overlay" style="background: rgba(0,94,176,1); background: -moz-linear-gradient(left, rgba(0,94,176,1) 0%, rgba(0,202,255,1) 100%); background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(0,94,176,1)), color-stop(100%,rgba(0,202,255,1))); background: -webkit-linear-gradient(left, rgba(0,94,176,1) 0%,rgba(0,202,255,1) 100%); background: -o-linear-gradient(left, rgba(0,94,176,1) 0%,rgba(0,202,255,1) 100%); background: -ms-linear-gradient(left, rgba(0,94,176,1) 0%,rgba(0,202,255,1) 100%); background: linear-gradient(to right, rgba(0,94,176,1) 0%,rgba(0,202,255,1) 100%); ">
                    </div>
                    <!--/ Gradient overlay -->
            </div>
            <!-- Background -->

            <!-- Sub-Header content wrapper -->
            <div class="ph-content-wrap d-flex">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-6">
                                <!-- Breadcrumbs -->
                                <ul class="breadcrumbs fixclear">
                                        <li><a href="index.html">Home</a></li>
                                        <li>CART</li>
                                </ul>
                                <!--/ Breadcrumbs -->

                                <!-- Current date -->
                                <!--<span id="current-date" class="subheader-currentdate">Jan 01, 2018</span>-->
                                <!--/ Current date -->

                                <div class="clearfix"></div>
                        </div>
                        <!--/ col-sm-12 col-md-6 col-lg-6 -->

                        <div class="col-sm-12 col-md-6 col-lg-6">
                                <!-- Sub-header titles -->
                                <div class="subheader-titles">
                                    <h2 class="subheader-maintitle">STORE CART</h2>
                                    <h4 class="subheader-subtitle">YOUR PERSONAL BASKET</h4>
                                </div>
                                <!--/ Sub-header titles -->
                        </div>
                        <!--/ col-sm-12 col-md-6 col-lg-6 -->
                    </div>
                    <!--/ row -->
                </div>
                <!--/ .container .align-self-center -->
            </div>
            <!--/ Sub-Header content wrapper .d-flex -->

            <!-- Sub-header Bottom mask style 3 -->
            <div class="kl-bottommask kl-bottommask--mask3">
                <svg width="5000px" height="57px" class="svgmask " viewBox="0 0 5000 57" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <defs>
                        <filter x="-50%" y="-50%" width="200%" height="200%" filterUnits="objectBoundingBox" id="filter-mask3">
                            <feOffset dx="0" dy="3" in="SourceAlpha" result="shadowOffsetInner1"></feOffset>
                            <feGaussianBlur stdDeviation="2" in="shadowOffsetInner1" result="shadowBlurInner1"></feGaussianBlur>
                            <feComposite in="shadowBlurInner1" in2="SourceAlpha" operator="arithmetic" k2="-1" k3="1" result="shadowInnerInner1"></feComposite>
                            <feColorMatrix values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.4 0" in="shadowInnerInner1" type="matrix" result="shadowMatrixInner1"></feColorMatrix>
                            <feMerge>
                                <feMergeNode in="SourceGraphic"></feMergeNode>
                                <feMergeNode in="shadowMatrixInner1"></feMergeNode>
                            </feMerge>
                        </filter>
                    </defs>
                    <path d="M9.09383679e-13,57.0005249 L9.09383679e-13,34.0075249 L2418,34.0075249 L2434,34.0075249 C2434,34.0075249 2441.89,33.2585249 2448,31.0245249 C2454.11,28.7905249 2479,11.0005249 2479,11.0005249 L2492,2.00052487 C2492,2.00052487 2495.121,-0.0374751261 2500,0.000524873861 C2505.267,-0.0294751261 2508,2.00052487 2508,2.00052487 L2521,11.0005249 C2521,11.0005249 2545.89,28.7905249 2552,31.0245249 C2558.11,33.2585249 2566,34.0075249 2566,34.0075249 L2582,34.0075249 L5000,34.0075249 L5000,57.0005249 L2500,57.0005249 L1148,57.0005249 L9.09383679e-13,57.0005249 Z" class="bmask-bgfill" filter="url(#filter-mask3)" fill="#fbfbfb"></path>
                </svg>
                <i class="fas fa-angle-down"></i>
            </div>
            <!--/ Sub-header Bottom mask style 3 -->
        </div>
        <!--/ Page sub-header + Bottom mask style 3 -->
        
        <!-- Cart page content section with custom paddings -->
        <section id="content" class="hg_section pt-80 pb-80">
            <div class="container">
                <div class="row">
                    <!-- Content page with right sidebar-->
                    <div class=" col-sm-12 col-md-12 col-lg-12 mb-md-50">
                        <!-- Page title & subtitle -->
                        <div class="kl-title-block text-left tbk-symbol--line  tbk-icon-pos--after-title">
                                <!-- Title -->
                                <h2 class="tbk__title kl-font-alt fs-xl fw-semibold black">
                                        YOUR PERSONAL BASKET
                                </h2>

                                <!-- Symbol line -->
                                <span class="tbk__symbol ">
                                        <span></span>
                                </span>

                                <!-- Sub-title -->
                                <h4 class="tbk__subtitle fs-l fw-thin">
                                        Let's see what we've got inside.
                                </h4>
                        </div>
                        <!--/ Page title & subtitle -->

                        <!-- Text box -->
                        <div class="text_box">
                            <div class="kl-store">
                                <form action="#" method="post" class="table-responsive-md mb-50">
                                    <table class="table shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-remove">
                                                </th>
                                                <th class="product-thumbnail">
                                                </th>
                                                <th class="product-name">
                                                        Product
                                                </th>
                                                <th class="product-price">
                                                        Price
                                                </th>
                                                
                                                <th class="product-subtotal">
                                                        Total
                                                </th>
                                            </tr>
                                        </thead>
                                        <!--<tbody>-->
                                            
                                            <tbody is="shoppingcart" :cart="cart"></tbody>
                                        
<!--                                            <tr>
                                                <td colspan="6" class="actions">
                                                    <div class="coupon">
                                                            <label for="coupon_code">Coupon:</label><input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code"><input type="submit" class="button" name="apply_coupon" value="Apply Coupon">
                                                    </div>
                                                    <input type="submit" class="button" name="update_cart" value="Update Cart">
                                                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="1b98fc7d5b"><input type="hidden" name="_wp_http_referer" value="/demo/cart/">
                                                </td>
                                            </tr>
                                        </tbody>-->
                                    </table>
                                </form>

                                <!-- Cart details -->
                                <div class="cart-collaterals">
                                    <div class="cart_totals ">
                                        <h2>
                                                Cart Totals
                                        </h2>

                                        <table class="mb-30">
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>
                                                        Subtotal
                                                    </th>
                                                    <td>
                                                        <span class="amount">{{totalVal | currency}}</span>
                                                    </td>
                                                </tr>
                                                <tr class="shipping">
                                                    <th>
                                                        Shipping
                                                    </th>
                                                    <td>
                                                         Free Shipping <input type="hidden" name="shipping_method[0]" data-index="0" id="shipping_method_0" value="free_shipping" class="shipping_method">
                                                        <form class="kl-store-shipping-calculator" action="#" method="post">
                                                            <p>
                                                                <a href="#" class="shipping-calculator-button">
                                                                        Calculate Shipping
                                                                </a>
                                                            </p>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>
                                                        Total
                                                    </th>
                                                    <td>
                                                        <span class="amount">
                                                                <strong>{{totalVal | currency}}</strong>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Checkout button -->
                                        <div class="wc-proceed-to-checkout">
                                            <a href="${pageContext.request.contextPath}/user/order" class="checkout-button button alt wc-forward">
                                                    Proceed to Checkout
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Content page col-sm-12 col-md-12 col-lg-9 mb-md-50 -->

                </div>	
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ Cart page content section with custom paddings -->
        
        
<!--        <h1>Cart List</h1>
        <shopitems :cart="cart" @remove_item="removeFromCart" @clear_all="removeAll"></shopitems>-->
        
        <!-- INCLUDE // These should be loaded in every page -->
        <%@include file="/WEB-INF/views/segment/everypagescript.jsp" %>
        
        <!-- JS FILES // Loaded on this page -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/plugins/jquery-ui-1.10.3.custom.min.js"></script>

	<!-- Custom Kallyas JS codes -->
	<!--<script type="text/javascript" src="js/kl-scripts.js"></script>-->

	<!-- Custom user JS codes -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/kl-custom.js"></script>
        
    </jsp:body>
</t:usertag>
