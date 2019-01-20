<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/datefunctions.tld" prefix="f" %>

<t:mgtag>
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
								<li>ORDER DETAILS</li>
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
								<h2 class="subheader-maintitle">ORDER DETAILS</h2>
								<h4 class="subheader-subtitle">YOUR ORDER DETAILS</h4>
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

        
        <div class="detail-block">
            
            <div class="normal-flexbox order-nav">
                <a href="#order-info" class="flex-items">Order Info</a>
                <a href="#customer-info" class="flex-items">Customer Info</a>
                <a href="#payment-info" class="flex-items">Payment</a>
                <a href="#delivery-info" class="flex-items">Delivery</a>
            </div>
            
            <c:if test="${bo.order.orderStatus eq 'CANCELED' or bo.orderStatus eq 'CANCELED'}">
            <div class="warning-box">
                <div class="warning-title">
                    <h4>Canceled order</h4>
                </div>
                <div class="warning-content">
                    <c:choose>
                        <c:when test="${bo.order.orderStatus eq 'CANCELED'}">
                            <div>Customer canceled this order.</div>
                            <div>Reason: <i>"I hate you"</i></div>
                        </c:when>
                        <c:when test="${bo.orderStatus eq 'CANCELED'}">
                            <div>This order has been canceled.</div>
                            <div>Reason: <i>"Customer insulted me, I'm teaching him a lesson"</i></div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            </c:if>
            
            <div class="detail-content"><!--Color to show status-->
                
                <h3 id="order-info" class="divided">Order Info</h3>
                <div class="split-container">
                    <div class="split-content">
                        <p><strong>Order Number: </strong>${bo.order.orderNumber}</p>
                        <p><strong>Status: </strong>${bo.orderStatus eq 'PENDING'?'Waiting for approval':bo.orderStatus}</p>
                        <!--<p><strong>Total Amount: </strong></p>-->
                        <p><strong>Placed on: </strong>${bo.order.orderDate}</p>
                    </div>
                    <div class="split-content">
                        <div class="order-buttons">
                            <c:if test="${bo.orderStatus eq 'PENDING' and bo.order.payment.status eq 'PAID' and f:currentDateDiff('m',bo.order.orderDate) ge 10}">
                                <form method="post" action="${pageContext.request.contextPath}/mg/order/${bo.order.id}/${bo.id}/approve">
                                    <input type="submit" value="Approve Order" class="button">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                </form>
                            </c:if>
                            <c:if test="${(bo.orderStatus ne 'CANCELED' or bo.order.orderStatus ne 'CANCELED' or bo.orderStatus ne 'COMPLETE') and f:currentDateDiff('m',bo.order.orderDate) ge 10}">
                                <form method="post" action="${pageContext.request.contextPath}/mg/order/${bo.order.id}/${bo.id}/approve">
                                    <input type="submit" value="Cancel this order" class="button">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                </form>
                            </c:if>
                            
                        </div>
                        <p class="order-title-item mt"><strong>Item(s): </strong></p>
                        <div class="order-items">
                            <c:forEach var="car" items="${bo.carOrders}">
                                <div><p>=> ${car.cardet.year} ${car.cardet.model.car.make} ${car.cardet.model.name} ${car.cardet.name}</p></div>
                            </c:forEach>
                        </div>
                        <p class="order-title-item"><strong>Total: </strong>NGN <fmt:formatNumber minFractionDigits="2" type="number" value="${bo.order.totalprice}"/></p>
                    </div>
                </div>
            </div>
            <div class="detail-content"><!--Color to show status-->
                <h3 id="customer-info" class="divided">Customer Info</h3>
                <p><strong>Name: </strong>${bo.order.customer.firstname} ${bo.order.customer.lastname}</p>
                <p><strong>Phone Number: </strong>${bo.order.customer.phonenum}</p>
                <p><strong>Email: </strong>${bo.order.customer.email}</p>
            </div>
            <div class="detail-content"><!--Color to show status-->
                <h3 id="payment-info" class="divided">Payment</h3>
                <p><strong>Status: </strong>${bo.order.payment.status eq 'PAID'?'Complete':'Incomplete'}</p>
                <p>
                    <strong>Amount: </strong>${bo.order.payment.amount le 0?'N/A':bo.order.payment.amount}
                    <c:if test="${bo.order.payment.amount le 0}"></c:if>
                </p>
                <p><strong>Date: </strong>${bo.order.payment.paymentDate}</p>
            </div>
            <div class="detail-content"><!--Color to show status-->
                <h3 id="delivery-info" class="divided">Delivery</h3>
                <div class="split-container">
                    <div class="split-content">
                        <p>
                            <strong>Status: </strong>
                            <c:choose>
                                <c:when test="${bo.orderStatus eq 'PENDING' and bo.order.delivery.status eq 'PENDING'}">
                                    Order not approved yet.
                                </c:when>
                                <c:otherwise>
                                    ${bo.order.delivery.status}
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Delivery Address: </strong>
                            ${bo.order.delivery.address.street} ${bo.order.delivery.address.city}
                            ${bo.order.delivery.address.country}
                        </p>
                        <p><strong>Courier: </strong>
                            ${bo.order.delivery.employee.firstname ne null?
                              bo.order.delivery.employee.firstname+=' '+=bo.order.delivery.employee.lastname:
                              'N/A'}
                        </p>
                        <p><strong>Commence Date: </strong>${bo.order.delivery.beginDate?bo.order.delivery.beginDate:'N/A'}</p>
                        <p><strong>Date Delivered: </strong>${bo.order.delivery.deliveryDate?bo.order.delivery.deliveryDate:'N/A'}</p>
                        <p><strong>Courier Duration: </strong>${bo.order.delivery.duration le 0?'N/A':bo.order.delivery.duration}</p>
                        <p><strong>Actual Duration: </strong>
                            ${bo.order.delivery.beginDate and bo.order.delivery.deliveryDate?f:dayDiff('d',bo.order.delivery.beginDate, order.delivery.deliveryDate):'N/A'}
                        </p>
                    </div>
                    <div class="split-content">
                        <div class="order-buttons">
                            <c:if test="${bo.orderStatus ne 'PENDING'}">
                                <a 
                                <c:if test="${bo.orderStatus ne 'PENDING'}">
                                href="${pageContext.request.contextPath}/mg/order/${bo.order.id}/delivery"
                                </c:if>>
                                    <button ${bo.orderStatus ne 'APPROVED'?'disabled':''} class="button">
                                        <c:if test="${bo.order.delivery.status eq 'PENDING'}">
                                            Set Delivery
                                        </c:if>
                                        <c:if test="${bo.order.delivery.status ne 'PENDING'}">
                                            View Delivery
                                        </c:if>
                                    </button>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
             <!-- INCLUDE // These should be loaded in every page -->
        <%@include file="/WEB-INF/views/segment/everypagescript.jsp" %>
                        
              <!-- JS FILES // Loaded on this page -->
            <script type="text/javascript" src="js/plugins/jquery-ui-1.10.3.custom.min.js"></script>

            <!-- Custom Kallyas JS codes -->
            <script type="text/javascript" src="js/kl-scripts.js"></script>

            <!-- Custom user JS codes -->
            <script type="text/javascript" src="js/kl-custom.js"></script>
    </jsp:body>
</t:mgtag>
