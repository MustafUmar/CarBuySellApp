<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty sessionScope.cart}">
    <% response.sendRedirect("/"); %>
</c:if>
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
            <!--/ Background -->

            <!-- Sub-Header content wrapper -->
            <div class="ph-content-wrap d-flex">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-6">
                                <!-- Breadcrumbs -->
                                <ul class="breadcrumbs fixclear">
                                        <li><a href="index.html">Home</a></li>
                                        <li>CHECKOUT</li>
                                </ul>
                                <!--/ Breadcrumbs -->

                                <!-- Current date -->
                                <span id="current-date" class="subheader-currentdate">Jan 01, 2018</span>
                                <!--/ Current date -->

                                <div class="clearfix"></div>
                        </div>
                        <!--/ col-sm-12 col-md-6 col-lg-6 -->

                        <div class="col-sm-12 col-md-6 col-lg-6">
                                <!-- Sub-header titles -->
                                <div class="subheader-titles">
                                        <h2 class="subheader-maintitle">CHECKING OUT</h2>
                                        <h4 class="subheader-subtitle">FEW MORE STEPS</h4>
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
        <!--/ Page sub-header + Bott
        
        
        <!-- Checkout content page with custom paddings -->
        <section id="content" class="hg_section pt-80 pb-80">
            <div class="container">
                <div class="row">
                    <!-- Content page with right sidebar-->
                    <div class=" col-sm-12 col-md-12 col-lg-12 mb-md-50">
                        <!-- Page title & subtitle -->
                        <div class="kl-title-block clearfix text-left tbk-symbol--line  tbk-icon-pos--after-title">
                                <!-- Title with custom font, size, weight and color -->
                                <h2 class="tbk__title kl-font-alt fs-xl fw-semibold black">
                                        CHECKOUT PROCESS
                                </h2>

                                <!-- Symbol line -->
                                <span class="tbk__symbol ">
                                        <span></span>
                                </span>

                                <!-- Sub-title with custom font size and weight -->
                                <h4 class="tbk__subtitle fs-m fw-thin">
                                        You're definitely on the right track!
                                </h4>
                        </div>

                        <div class="text_box">
                            <div class="kl-store">
                                <sec:authorize access="!isAuthenticated()">
                                <div class="kl-store-info">
                                        Returning customer? <a href="#" class="showlogin">Click here to login</a>
                                </div>
                                </sec:authorize>
                                <form method="post" class="login" style="display:none;">
                                        <p>
                                                If you have shopped with us before, please enter your details in the boxes below. If you are a new customer please proceed to the Billing & Shipping section.
                                        </p>
                                        <p class="form-row form-row-first">
                                                <label for="username">Username or email <span class="required">*</span></label>
                                                <input type="text" class="input-text" name="username" id="username">
                                        </p>
                                        <p class="form-row form-row-last">
                                                <label for="password">Password <span class="required">*</span></label>
                                                <input class="input-text" type="password" name="password" id="password">
                                        </p>
                                        <div class="clear">
                                        </div>
                                        <p class="form-row">
                                                <label for="rememberme" class="inline">
                                                <input name="rememberme" type="checkbox" id="rememberme" value="forever"> Remember me </label>
                                        </p>
                                        <p class="lost_password">
                                                <a href="#">Lost your password?</a>
                                        </p>
                                        <div class="clear">
                                        </div>
                                </form>
                                <!-- <div class="kl-store-info">
                                        Have a coupon? <a href="#" class="showcoupon">Click here to enter your code</a>
                                </div> -->
                                <form class="checkout_coupon" method="post" style="display:none">
                                        <p class="form-row form-row-first">
                                                <input type="text" name="coupon_code" class="input-text" placeholder="Coupon code" id="coupon_code" value="">
                                        </p>
                                        <p class="form-row form-row-last">
                                                <input type="submit" class="button" name="apply_coupon" value="Apply Coupon">
                                        </p>
                                        <div class="clear">
                                        </div>
                                </form>
                                <!--<form name="checkout" method="post" class="checkout kl-store-checkout" action="#" enctype="multipart/form-data">-->
                                <div name="checkout" class="checkout kl-store-checkout">
                                    <div class="row" id="customer_details">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="kl-store-billing-fields">
                                                <h3>
                                                        Your Address
                                                </h3>
                                                <c:forEach var="address" items="${addresses}">
                                                    <div>
                                                        <label>
                                                            <input type="radio" class="input-radio" value="${address.id}" v-model="order.address"/>
                                                            <span>${address.street}</span>
                                                            <span>${address.city}</span>
                                                            <%--<span>${address.state}</span>--%>
                                                            <span>${address.country}</span>
                                                        </label>
                                                    </div>
                                                </c:forEach> 
                                                <div class="clear">
                                                </div>
                                            </div>
                                        </div>
                                        <!--/ col-sm-12 col-md-6 -->

                                        <div class="col-sm-12 col-md-6">
                                            <div class="kl-store-shipping-fields">
                                                <h3 id="ship-to-different-address">
                                                        <label for="ship-to-different-address-checkbox" class="checkbox">
                                                                Ship to a different address?
                                                        </label>
                                                        <a href="${pageContext.request.contextPath}/user/profile" class="showlogin">Change</a>
                                                </h3>
                                                <p class="form-row form-row notes" id="order_comments_field">
                                                        <label for="order_comments" class="">Order Notes</label><textarea name="order_comments" class="input-text " id="order_comments" placeholder="Notes about your order, e.g. special notes for delivery." rows="2" cols="5"></textarea>
                                                </p>
                                            </div>
                                        </div>
                                        <!--/ col-sm-12 col-md-6 -->
                                    </div>
                                    <!--/ row -->

                                    <h3 id="order_review_heading">
                                            Your order
                                    </h3>

                                    <div id="order_review" class="kl-store-checkout-review-order">
                                        <table class="shop_table kl-store-checkout-review-order-table">
                                            <thead>
                                                <tr>
                                                    <th class="product-name">
                                                            Product
                                                    </th>
                                                    <th class="product-total">
                                                            Total
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="car" items="${sessionScope.cart.cars}" varStatus="lp">
                                                    <tr class="cart_item">
                                                        <td class="product-name">
                                                            <p>${car.make} ${car.modelname} ${car.typename} ${car.year}</p>
                                                            <dl class="variation">
                                                                <dt class="variation-color"></dt>
                                                                <dd class="variation-color">
                                                                <p>
                                                                    <%--${car.newused}--%>
                                                                </p>
                                                                </dd>
                                                            </dl>
                                                        </td>
                                                        <td class="product-total">
                                                            <span class="amount">NGN <fmt:formatNumber minFractionDigits="2" type="number" value="${car.price}"/></span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr class="cart-subtotal">
                                                    <th>
                                                        Subtotal
                                                    </th>
                                                    <td>
                                                        <span class="amount">
                                                            NGN <fmt:formatNumber minFractionDigits="2" type="number" value="${sessionScope.cart.total}"/>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr class="shipping">
                                                    <th>
                                                        Shipping
                                                    </th>
                                                    <td>
                                                         Free Shipping <input type="hidden" name="shipping_method[0]" data-index="0" id="shipping_method_0" value="free_shipping" class="shipping_method">
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>
                                                        Total
                                                    </th>
                                                    <td>
                                                        <strong><span class="amount">NGN <fmt:formatNumber minFractionDigits="2" type="number" value="${sessionScope.cart.total}"/></span></strong>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>

                                        <div id="payment" class="kl-store-checkout-payment">
                                            <ul class="payment_methods methods">
                                                <li class="payment_method_card">
                                                    <input id="payment_method_card" type="radio" class="input-radio" name="payment_method" value="psp1" v-model="order.payment" data-order_button_text="">
                                                    <label for="payment_method_card">Credit card </label>
                                                    <div class="payment_box payment_method_card">
                                                        <p>
                                                                You will be redirected to a paymant gateway when you proceed
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="payment_method_paypal">
                                                    <input id="payment_method_paypal" type="radio" class="input-radio" name="payment_method" disabled value="paypal" data-order_button_text="Proceed to PayPal">
                                                    <label for="payment_method_paypal">
                                                    PayPal <img src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png" alt="PayPal Acceptance Mark"><a href="https://www.paypal.com/gb/webapps/mpp/paypal-popup" class="about_paypal" onclick="" title="What is PayPal?">What is PayPal?</a></label>
                                                    <div class="payment_box payment_method_paypal" style="display:none;">
                                                        <p>
                                                                Pay via PayPal; you can pay with your credit card if you don?t have a PayPal account.
                                                        </p>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="form-row place-order">
                                                    <input type="submit" @click.prevent="placeOrder" class="button alt" name="kl-store_checkout_place_order" id="place_order" value="Place order" data-value="Place order">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/ .kl-store -->
                        </div>
                        <!--/ .text_box -->
                    </div>
                    <!--/ Content page col-sm-12 col-md-12 col-lg-9 mb-md-50 -->

                </div>
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ Checkout  content page
        
            
            
        <!-- JS FILES // Loaded on this page -->
	<script type="text/javascript" src="js/plugins/jquery-ui-1.10.3.custom.min.js"></script>
	
	<!-- Custom Kallyas JS codes -->
	<script type="text/javascript" src="js/kl-scripts.js"></script>

	<!-- Custom user JS codes -->
	<script type="text/javascript" src="js/kl-custom.js"></script>
        
    </jsp:body>
</t:usertag>
