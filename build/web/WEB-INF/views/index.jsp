<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        
        <%@include file="/WEB-INF/views/segment/carousel.jsp" %>
        
        <!-- Action Box - Style 3 section with custom top padding and white background color -->
        <section class="hg_section bg-white pt-0">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="action_box style3" data-arrowpos="center" style="margin-top:-25px;">
                            <div class="action_box_inner">
                                <div class="action_box_content row">
                                    <div class="ac-content-text col-sm-12 col-md-12 col-lg-7">
                                        <!-- Title -->
                                        <h4 class="text">
                                                <span class="fw-thin">SELL & BUY CARS, THE <span class="fw-semibold">BEST SELLING</span> AND LARGEST WEBSITE TO BUY AND SELL CARS</span>
                                        </h4>
                                        <!--/ Title -->

                                        <!-- Sub-Title -->
                                        <h5 class="ac-subtitle mb-md-30">
                                                Get informed on our newest cars & enjoy special discounts.
                                        </h5>
                                        <!--/ Sub-Title -->
                                    </div>
                                    <!--/ .ac-content-text .col-sm-12 .col-md-12 .col-lg-7 -->

                                    <!-- Call to Action buttons -->
                                    <div class="ac-buttons col-sm-12 col-md-12 col-lg-5 d-flex align-self-center justify-content-center justify-content-lg-end">
                                        <a href="#" target="_self" class="btn btn-lined ac-btn" title="">
                                                BUY A CAR
                                        </a>
                                        <a href="#contact_panel" target="_self" class="btn btn-lined ac-btn kl-cta-ribbon" title="">
                                                SELL A CAR
                                        </a>
                                    </div>
                                    <!--/ Call to Action buttons -->
                                </div>
                                <!--/ action_box_content -->
                            </div>
                            <!--/ action_box_inner -->
                        </div>
                        <!--/ action_box style3 -->
                    </div>
                    <!--/ col-sm-12 col-md-12 -->
                </div>
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ Action Box - Style 3 section with custom top padding and white background color -->
        
        <!-- Brands (Partners) Carousel section -->
        <section class="hg_section--relative">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <!-- Partners carousel element dark style -->
                        <div class="testimonials-partners testimonials-partners--dark">	
                            <div class="ts-pt-partners ts-pt-partners--y-title clearfix">
                                <!-- Title -->
                                <div class="ts-pt-partners__title no-border">
                                        <h3 class="tbk__title fw-thin fs-38 light-gray">
                                                <span class="fw-bold fs-xl">
                                                        OUR
                                                </span><br>
                                                PARTNERS
                                        </h3>
                                </div>
                                <!--/ Title -->

                                <!-- Partners carousel wrapper -->
                                <div class="ts-pt-partners__carousel-wrapper">
                                    <div class="ts-pt-partners__carousel js-slick" data-slick='{
                                            "infinite": true,
                                            "autoplay": true,
                                            "autoplaySpeed": 3000,
                                            "arrows": false,
                                            "dots": false,
                                            "slidesToShow": 5,
                                            "slidesToScroll": 1,
                                            "waitForAnimate": false,
                                            "speed": 0,
                                            "swipe": false,
                                            "respondTo": "slider",
                                            "responsive": [
                                                    {
                                                            "breakpoint": 1024,
                                                            "settings": {
                                                                    "slidesToShow": 4,
                                                                    "slidesToScroll": 4
                                                            }
                                                    },
                                                    {
                                                            "breakpoint": 767,
                                                            "settings": {
                                                                    "slidesToShow": 3,
                                                                    "slidesToScroll": 3
                                                            }
                                                    },
                                                    {
                                                            "breakpoint": 520,
                                                            "settings": {
                                                                    "slidesToShow": 2,
                                                                    "slidesToScroll": 2
                                                            }
                                                    },
                                                    {
                                                            "breakpoint": 380,
                                                            "settings": {
                                                                    "slidesToShow": 1,
                                                                    "slidesToScroll": 1
                                                            }
                                                    }
                                            ]

                                    }'>

                                        <!-- Item #1 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo6_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #1 -->

                                        <!-- Item #2 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo7_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #2 -->

                                        <!-- Item #3 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo8_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #3 -->

                                        <!-- Item #4 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo1_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #4 -->

                                        <!-- Item #5 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo2_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #5 -->

                                        <!-- Item #6 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo3_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #6 -->

                                        <!-- Item #7 -->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo4_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #7 -->

                                        <!-- Item  #8-->
                                        <div class="ts-pt-partners__carousel-item">
                                                <!-- Partner image link -->
                                                <a class="ts-pt-partners__link" href="#" target="_self" title="">
                                                        <!-- Image -->
                                                        <img class="ts-pt-partners__img img-fluid" src="${pageContext.request.contextPath}/resources/client/images/logo5_dark.svg" alt="" title="" />
                                                        <!--/ Image -->
                                                </a>
                                                <!--/ Partner image link -->
                                        </div>
                                        <!--/ Item #8 -->
                                    </div>
                                    <!--/ .ts-pt-partners__carousel js-slick -->
                                </div>
                                <!--/ Partners carousel wrapper -->
                            </div>
                        </div>
                        <!--/ Partners carousel element dark style - .ts-pt-partners -->
                    </div>
                    <!--/ col-sm-12 col-md-12 -->
                </div>
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ Brands (Partners) Carousel section -->
        
        <!-- Offer banners section with white background, shadow and custom paddings -->
        <section class="hg_section--relative bg-white section-shadow pt-80 pb-100">
            <!-- Background section -->
            <div class="kl-bg-source">
                <!-- Glos overlay - default white style -->
                <div class="kl-bg-source__overlay-gloss">
                </div>
            </div>
            <!--/ Background section -->

            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <!-- Title element with icon symbol and custom bottom padding -->
                        <div class="kl-title-block text-center tbk-symbol--icon">
                            <!-- Title with custom alternative font, size and default theme color -->
                            <h3 class="tbk__title kl-font-alt fs-xl tcolor">
                                    LATEST COLLECTIONS
                            </h3>

                            <!-- Title bottom icon symbol = .fas fa-ellipsis-h / custom size and lightgray2 color -->
                            <div class="tbk__symbol ">
                                    <span class="tbk__icon fs-xl light-gray2 fas fa-ellipsis-h"></span>
                            </div>
                            <!--/ Title bottom icon symbol -->
                        </div>
                        <!--/ Title element with icon symbol -->

                        <!-- Offer banners element -->
                        <div class="offer-banners ob--resize-no-resize">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-9">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6 col-lg-5">
                                                <!-- Offer banner image link -->
                                                <a href="#" target="_blank" class="offer-banners-link hoverBorder" title="">
                                                        <!-- Border image wrapper -->
                                                        <span class="hoverBorderWrapper">
                                                                <!-- Image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/banner-set1-1.jpg" class="img-fluid offer-banners-img" alt="" title="" />

                                                                <!-- Hover border -->
                                                                <span class="theHoverBorder"></span>
                                                        </span>
                                                        <!--/ Border image wrapper -->
                                                </a>
                                                <!--/ Offer banner image link -->
                                        </div>
                                        <!--/ col-sm-12 col-md-6 col-lg-5 -->

                                        <div class="col-sm-12 col-md-6 col-lg-7">
                                                <!-- Offer banner image link -->
                                                <a href="#" target="_blank" class="offer-banners-link hoverBorder" title="">
                                                        <!-- Border image wrapper -->
                                                        <span class="hoverBorderWrapper">
                                                                <!-- Image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/banner-set1-2.jpg" class="img-fluid offer-banners-img" alt="" title="" />

                                                                <!-- Hover border -->
                                                                <span class="theHoverBorder"></span>
                                                        </span>
                                                        <!--/ Border image wrapper -->
                                                </a>
                                                <!--/ Offer banner image link -->
                                        </div>
                                        <!--/ col-sm-12 col-md-6 col-lg-7 -->
                                    </div>
                                    <!--/ row -->
                                </div>
                                <!--/ col-sm-12 col-md-12 col-lg-9 -->

                                <div class="col-sm-12 col-md-12 col-lg-3">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-12">
                                                <!-- Offer banner image link -->
                                                <a href="#" target="_blank" class="offer-banners-link hoverBorder" title="">
                                                        <!-- Border image wrapper -->
                                                        <span class="hoverBorderWrapper">
                                                                <!-- Image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/banner-set2-32.jpg" class="img-fluid offer-banners-img" alt="" title="" />

                                                                <!-- Hover border -->
                                                                <span class="theHoverBorder"></span>
                                                        </span>
                                                        <!--/ Border image wrapper -->
                                                </a>
                                                <!--/ Offer banner image link -->
                                        </div>
                                        <!--/ col-sm-6 col-md-6 col-lg-12 -->

                                        <div class="col-sm-6 col-md-6 col-lg-12">
                                                <!-- Offer banner image link -->
                                                <a href="#" target="_blank" class="offer-banners-link hoverBorder" title="">
                                                        <!-- Border image wrapper -->
                                                        <span class="hoverBorderWrapper">
                                                                <!-- Image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/banner-set2-41.jpg" class="img-fluid offer-banners-img" alt="" title="" />

                                                                <!-- Hover border -->
                                                                <span class="theHoverBorder"></span>
                                                        </span>
                                                        <!--/ Border image wrapper -->
                                                </a>
                                                <!--/ Offer banner image link -->
                                        </div>
                                        <!--/ col-sm-6 col-md-6 col-lg-12 -->
                                    </div>
                                    <!--/ row -->
                                </div>
                                <!--/ col-sm-12 col-md-12 col-lg-3 -->

                                <div class="col-sm-12 col-md-12 col-lg-12">
                                        <!-- Offer banner image link -->
                                        <a href="#" target="_blank" class="offer-banners-link hoverBorder" title="">
                                                <!-- Border image wrapper -->
                                                <span class="hoverBorderWrapper">
                                                        <!-- Image -->
                                                        <img src="${pageContext.request.contextPath}/resources/client/images/banner-set2-51.jpg" class="img-fluid offer-banners-img" alt="" title="" />

                                                        <!-- Hover border -->
                                                        <span class="theHoverBorder"></span>
                                                </span>
                                                <!--/ Border image wrapper -->
                                        </a>
                                        <!--/ Offer banner image link -->
                                </div>
                                <!--/ col-sm-12 col-md-12 col-lg-12 -->
                            </div>
                            <!--/ row -->
                        </div>
                        <!--/ Offer banners element -->
                    </div>
                    <!--/ col-md-12 col-sm-12 -->
                </div>
                <!--/ row -->
            </div>
            <!--/ container -->

            <!-- Bottom mask style 4 left aligned -->
            <div class="kl-bottommask kl-bottommask--mask4">
                    <svg width="5000px" height="27px" class="svgmask svgmask-left" viewbox="0 0 5000 27" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <defs>
                                    <filter x="-50%" y="-50%" width="200%" height="200%" filterunits="objectBoundingBox" id="filter-mask4">
                                            <feoffset dx="0" dy="2" in="SourceAlpha" result="shadowOffsetInner1"></feoffset>
                                            <fegaussianblur stddeviation="1.5" in="shadowOffsetInner1" result="shadowBlurInner1"></fegaussianblur>
                                            <fecomposite in="shadowBlurInner1" in2="SourceAlpha" operator="arithmetic" k2="-1" k3="1" result="shadowInnerInner1"></fecomposite>
                                            <fecolormatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0" in="shadowInnerInner1" type="matrix" result="shadowMatrixInner1"></fecolormatrix>
                                            <femerge>
                                                    <femergenode in="SourceGraphic"></femergenode>
                                                    <femergenode in="shadowMatrixInner1"></femergenode>
                                            </femerge>
                                    </filter>
                            </defs>
                            <path d="M3.63975516e-12,-0.007 L2418,-0.007 L2434,-0.007 C2434,-0.007 2441.89,0.742 2448,2.976 C2454.11,5.21 2479,15 2479,15 L2492,21 C2492,21 2495.121,23.038 2500,23 C2505.267,23.03 2508,21 2508,21 L2521,15 C2521,15 2545.89,5.21 2552,2.976 C2558.11,0.742 2566,-0.007 2566,-0.007 L2582,-0.007 L5000,-0.007 L5000,27 L2500,27 L3.63975516e-12,27 L3.63975516e-12,-0.007 Z" class="bmask-bgfill" filter="url(#filter-mask4)" fill="#fbfbfb"></path>
                    </svg>
            </div>
            <!--/ Bottom mask style 4 left aligned -->
        </section>
        <!--/ Offer banners section with white background, shadow and custom paddings -->
        
        <!-- Shop category images section with custom paddings -->
        <section class="hg_section pt-80 pb-0 pb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <!-- Title element -->
                        <div class="kl-title-block clearfix text-left tbk-symbol-- tbk-icon-pos--after-title">
                                <!-- Title with custom kl-font-alt font, size and default theme color -->
                                <h3 class="tbk__title kl-font-alt fs-26 tcolor ">
                                    BROWSE CATEGORIES
                                </h3>

                                <!-- Sub-title with custom font size, lightgray color and thin style -->
                                <h4 class="tbk__subtitle fs-normal light-gray fw-thin">
                                    BARELY UPDATED
                                </h4>
                        </div>
                        <!--/ Title element -->
                    </div>
                    <!--/ col-sm-12 col-md-12 -->

                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <!-- Image boxes style 4 element - bottom title -->
                        <div class="box image-boxes imgboxes_style4 kl-title_style_bottom">
                            <!-- Image box link wrapper -->
                            <a href="#" target="_self" class="imgboxes4_link imgboxes-wrapper" title="">
                                <!-- Image -->
                                <img src="${pageContext.request.contextPath}/resources/client/images/shop-cat-1-460x307.jpg" class="img-fluid imgbox_image cover-fit-img" alt="CLOTHING" title="CLOTHING" />
                                <!--/ Image -->

                                <!-- Border helper -->
                                <span class="imgboxes-border-helper"></span>
                                <!--/ Border helper -->

                                <!-- Title -->
                                <h3 class="m_title imgboxes-title">
                                        GREAT SUPPORT
                                </h3>
                                <!--/ Title -->
                            </a>
                            <!--/ Image box link wrapper -->
                        </div>
                        <!--/ Image boxes style 4 element - bottom title -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 -->

                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <!-- Image boxes style 4 element - bottom title -->
                        <div class="box image-boxes imgboxes_style4 kl-title_style_bottom">
                            <!-- Image box link wrapper -->
                            <a href="#" target="_self" class="imgboxes4_link imgboxes-wrapper" title="">
                                <!-- Image -->
                                <img src="${pageContext.request.contextPath}/resources/client/images/shop-cat-2-460x307.jpg" class="img-fluid imgbox_image cover-fit-img" alt="SHOES" title="SHOES" />
                                <!--/ Image -->

                                <!-- Border helper -->
                                <span class="imgboxes-border-helper"></span>
                                <!--/ Border helper -->

                                <!-- Title -->
                                <h3 class="m_title imgboxes-title">
                                    SHOES
                                </h3>
                                <!--/ Title -->
                            </a>
                            <!--/ Image box link wrapper -->
                        </div>
                        <!--/ Image boxes style 4 element - bottom title -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 -->

                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <!-- Image boxes style 4 element - bottom title -->
                        <div class="box image-boxes imgboxes_style4 kl-title_style_bottom">
                            <!-- Image box link wrapper -->
                            <a href="#" target="_self" class="imgboxes4_link imgboxes-wrapper" title="">
                                <!-- Image -->
                                <img src="${pageContext.request.contextPath}/resources/client/images/shop-cat-3-460x307.jpg" class="img-fluid imgbox_image cover-fit-img" alt="ACCESSORIES" title="ACCESSORIES" />
                                <!--/ Image -->

                                <!-- Border helper -->
                                <span class="imgboxes-border-helper"></span>
                                <!--/ Border helper -->

                                <!-- Title -->
                                <h3 class="m_title imgboxes-title">
                                        ACCESSORIES
                                </h3>
                                <!--/ Title -->
                            </a>
                            <!--/ Image box link wrapper -->
                        </div>
                        <!--/ Image boxes style 4 element - bottom title -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 -->

                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <!-- Image boxes style 4 element - bottom title -->
                        <div class="box image-boxes imgboxes_style4 kl-title_style_bottom">
                            <!-- Image box link wrapper -->
                            <a href="#" target="_self" class="imgboxes4_link imgboxes-wrapper" title="">
                                <!-- Image -->
                                <img src="${pageContext.request.contextPath}/resources/client/images/shop-cat-4-460x307.jpg" class="img-fluid imgbox_image cover-fit-img" alt="KIDS" title="KIDS" />
                                <!--/ Image -->

                                <!-- Border helper -->
                                <span class="imgboxes-border-helper"></span>
                                <!--/ Border helper -->

                                <!-- Title -->
                                <h3 class="m_title imgboxes-title">
                                        KIDS
                                </h3>
                                <!--/ Title -->
                            </a>
                            <!--/ Image box link wrapper -->
                        </div>
                        <!--/ Image boxes style 4 element - bottom title -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 -->

                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <!-- Image boxes style 4 element - bottom title -->
                        <div class="box image-boxes imgboxes_style4 kl-title_style_bottom">
                            <!-- Image box link wrapper -->
                            <a href="#" target="_self" class="imgboxes4_link imgboxes-wrapper" title="">
                                <!-- Image -->
                                <img src="${pageContext.request.contextPath}/resources/client/images/shop-cat-5-460x307.jpg" class="img-fluid imgbox_image cover-fit-img" alt="HOME GEAR" title="HOME GEAR" />
                                <!--/ Image -->

                                <!-- Border helper -->
                                <span class="imgboxes-border-helper"></span>
                                <!--/ Border helper -->

                                <!-- Title -->
                                <h3 class="m_title imgboxes-title">
                                        HOME GEAR
                                </h3>
                                <!--/ Title -->
                            </a>
                            <!--/ Image box link wrapper -->
                        </div>
                        <!--/ Image boxes style 4 element - bottom title -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 -->

                    <div class="col-sm-12 col-md-6 col-lg-4 align-self-center">
                        <!-- Title element with custom top padding -->
                        <div class="kl-title-block clearfix text-center tbk-symbol-- tbk-icon-pos--after-title ptop-50">
                            <!-- Title with custom kl-font-alt font, size and bold style -->
                            <h3 class="tbk__title kl-font-alt fs-xl fw-bold">
                                    TOUGH DECISION?
                            </h3>

                            <!-- Sub-title with custom font size, lightgray color and thin style -->
                            <h4 class="tbk__subtitle fs-normal light-gray fw-thin">
                                    YES, IT'S A SUMMER SALE STEAM
                            </h4>
                        </div>
                        <!-- Title element -->

                        <!-- Button -->
                        <div class="text-center">
                            <!-- Button lined custom style -->
                            <a href="#" target="_self" class="btn-element btn btn-lined lined-custom" title="">
                                    <span>SEE THE FULL COLLECTION</span>
                            </a>
                        </div>
                        <!--/ Button -->
                    </div>
                    <!--/ col-sm-12 col-md-6 col-lg-4 align-self-center -->
                </div>
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ Shop category images section with custom paddings -->
        
        <!-- FEATURED / LATEST / BEST SELLING Carousels section -->
        <section class="hg_section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12 mb-30">
                        <div class="shop-latest">
                            <div class="spp-products-rows">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- Title with default theme color  -->
                                        <h3 class="m_title tcolor spp-title">
                                                FEATURED PRODUCTS
                                        </h3>
                                    </div>
                                    <!--/ col-sm-12 -->

                                    <div class="col-sm-12">
                                        <!-- Shop latest carousel -->
                                        <div class="shop-latest-carousel spp-carousel sppCrs--c">	
                                            <!-- Featured products list -->
                                            <ul class="featured_products spp-list js-slick" data-slick='{
                                                    "infinite": true,
                                                    "slidesToShow": 3,
                                                    "slidesToScroll": 1,
                                                    "swipeToSlide": true,
                                                    "autoplay": true,
                                                    "autoplaySpeed": 3000,
                                                    "speed": 500,
                                                    "cssEase": "ease-in-out",
                                                    "arrows": true,
                                                    "appendArrows": ".spp-carousel .hgSlickNav.hgSlickNav_0",
                                                    "responsive": [
                                                            {
                                                                    "breakpoint": 1199,
                                                                    "settings": {
                                                                            "slidesToShow": 3
                                                                    }
                                                            },
                                                            {
                                                                    "breakpoint": 992,
                                                                    "settings": {
                                                                            "slidesToShow": 2
                                                                    }
                                                            },
                                                            {
                                                                    "breakpoint": 576,
                                                                    "settings": {
                                                                            "slidesToShow": 1
                                                                    }
                                                            }
                                                    ]
                                            }'>
                                                <!-- Product #1 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_sale">SALE!</span>
                                                            <span class="hg_badge_new">NEW!</span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural beige fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                        <span class="amount">Â£2,500.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                        <span class="amount">Â£1,999.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 5 out of 5">
                                                                    <span style="width:100%">
                                                                            <strong class="rating">5</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                            <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                    </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                    <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #1 -->

                                                <!-- Product #2 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">

                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                        Natural grej fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                        <del data-was="WAS">
                                                                                <span class="amount">Â£3,499.00</span>
                                                                        </del>
                                                                        <ins data-now="NOW">
                                                                                <span class="amount">Â£2,499.00</span>
                                                                        </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 3 out of 5">
                                                                        <span style="width:60%">
                                                                                <strong class="rating">3</strong> out of 5
                                                                        </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                            <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                    </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                    <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #2 -->

                                                <!-- Product #3 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_sale">
                                                                    SALE!
                                                            </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model3.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model3a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                        Natural brown fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                        <span class="amount">
                                                                            Â£2,499.00
                                                                        </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 4.5 out of 5">
                                                                        <span style="width:90%">
                                                                            <strong class="rating">4.5</strong> out of 5
                                                                        </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                    <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #3 -->

                                                <!-- Product #4 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">

                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural antracite fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                            Â£1,118.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                            <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                            <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                    </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                    <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #4 -->

                                                    <!-- Product #5 -->
                                                    <li>
                                                        <div class="product-list-item prod-layout-classic">
                                                            <!-- Badge container -->
                                                            <div class="hg_badge_container">

                                                            </div>
                                                            <!--/ Badge container -->

                                                            <!-- Product container link -->
                                                            <a href="product-page.html">
                                                                <!-- Image wrapper -->
                                                                <span class="image kw-prodimage">
                                                                        <!-- Primary image -->
                                                                        <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                        <!-- Secondary image -->
                                                                        <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                                </span>
                                                                <!--/ Image wrapper -->

                                                                <!-- Details -->
                                                                <div class="details kw-details fixclear">
                                                                        <!-- Title -->
                                                                        <h3 class="kw-details-title">
                                                                            Natural rose fox fur coat
                                                                        </h3>

                                                                        <!-- Price -->
                                                                        <span class="price">
                                                                            <span class="amount">
                                                                                Â£3,400.00
                                                                            </span>
                                                                        </span>
                                                                        <!--/ Price -->

                                                                        <!-- Star rating -->
                                                                        <div class="star-rating" title="Rated 0 out of 5">
                                                                            <span style="width:0%">
                                                                                <strong class="rating">0</strong> out of 5
                                                                            </span>
                                                                        </div>
                                                                </div>
                                                                <!--/ details fixclear -->
                                                            </a>
                                                            <!-- Product container link -->

                                                            <!-- Actions -->
                                                            <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                        <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                    </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                    <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                            </div>
                                                            <!--/ Actions -->
                                                        </div>
                                                        <!--/ product-list-item -->
                                                    </li>
                                                    <!--/ Product #5 -->
                                            </ul>
                                            <!--/ Featured products list -->

                                            <!-- Slick navigation -->
                                            <div class="hgSlickNav hgSlickNav_0 clearfix"></div>
                                        </div>
                                        <!--/ .shop-latest-carousel -->
                                    </div>
                                    <!--/ col-sm-12 -->
                                </div>
                                <!--/ row -->

                                <div class="row">
                                    <div class="col-sm-12">
                                            <!-- Title with default theme color  -->
                                            <h3 class="m_title tcolor spp-title">
                                                    LATEST PRODUCTS
                                            </h3>
                                    </div>
                                    
                                    <!--/ col-sm-12 -->
                                    <div class="col-sm-12">
                                        <!-- Shop latest carousel -->
                                        <div class="shop-latest-carousel spp-carousel sppCrs--c">
                                            <!-- Featured products list -->
                                            <ul class="featured_products spp-list js-slick" data-slick='{
                                                    "infinite": true,
                                                    "slidesToShow": 3,
                                                    "slidesToScroll": 1,
                                                    "swipeToSlide": true,
                                                    "autoplay": false,
                                                    "autoplaySpeed": 5000,
                                                    "speed": 500,
                                                    "cssEase": "ease-in-out",
                                                    "arrows": true,
                                                    "appendArrows": ".spp-carousel .hgSlickNav.hgSlickNav_1",
                                                    "responsive": [
                                                            {
                                                                "breakpoint": 1199,
                                                                "settings": {
                                                                        "slidesToShow": 3
                                                                }
                                                            },
                                                            {
                                                                "breakpoint": 992,
                                                                "settings": {
                                                                        "slidesToShow": 2
                                                                }
                                                            },
                                                            {
                                                                "breakpoint": 576,
                                                                "settings": {
                                                                        "slidesToShow": 1
                                                                }
                                                            }
                                                    ]
                                            }'>
                                                <!-- Product #1 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_new">
                                                                NEW!
                                                            </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                    <!-- Primary image -->
                                                                    <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model6.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                    <!-- Secondary image -->
                                                                    <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model6a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural gray fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                            Â£2,335.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                            <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #1 -->

                                                <!-- Product #2 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                                <span class="hg_badge_new">
                                                                        NEW!
                                                                </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural rose fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                            Â£3,400.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                            <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                        <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #2 -->

                                                <!-- Product #3 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_new">
                                                                NEW!
                                                            </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model7.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model7a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural gray fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                        <span class="amount">Â£2,499.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                        <span class="amount">Â£2,199.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 4 out of 5">
                                                                    <span style="width:80%">
                                                                        <strong class="rating">4</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                    <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #3 -->

                                                <!-- Product #4 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_new">
                                                                NEW!
                                                            </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural antracite fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                        Â£1,118.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                        <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #4 -->

                                                <!-- Product #5 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                                <span class="hg_badge_new">
                                                                        NEW!
                                                                </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                    <!-- Title -->
                                                                    <h3 class="kw-details-title">
                                                                            Natural grej fox fur coat
                                                                    </h3>

                                                                    <!-- Price -->
                                                                    <span class="price">
                                                                            <del data-was="WAS">
                                                                                    <span class="amount">Â£3,499.00</span>
                                                                            </del>
                                                                            <ins data-now="NOW">
                                                                                    <span class="amount">Â£2,499.00</span>
                                                                            </ins>
                                                                    </span>
                                                                    <!--/ Price -->

                                                                    <!-- Star rating -->
                                                                    <div class="star-rating" title="Rated 5 out of 5">
                                                                            <span style="width:100%">
                                                                                    <strong class="rating">5</strong> out of 5
                                                                            </span>
                                                                    </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #5 -->

                                                <!-- Product #6 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                                <span class="hg_badge_sale">
                                                                        SALE!
                                                                </span>
                                                                <span class="hg_badge_new">
                                                                        NEW!
                                                                </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural beige fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                        <span class="amount">Â£2,500.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                        <span class="amount">Â£1,999.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                        <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #6 -->
                                            </ul>
                                            <!--/ Featured products list -->

                                            <!-- Slick navigation -->
                                            <div class="hgSlickNav hgSlickNav_1 clearfix"></div>
                                        </div>
                                        <!--/ .shop-latest-carousel -->
                                    </div>
                                    <!--/ col-sm-12 -->
                                </div>
                                <!--/ row -->

                                <div class="row">
                                    <div class="col-sm-12">
                                            <!-- Title with default theme color  -->
                                            <h3 class="m_title spp-title">
                                                    BEST SELLING PRODUCTS
                                            </h3>
                                    </div>
                                    <!--/ col-sm-12 -->

                                    <div class="col-sm-12">
                                        <!-- Shop latest carousel -->
                                        <div class="shop-latest-carousel spp-carousel sppCrs--c">
                                            <!-- Featured products list -->
                                            <ul class="featured_products spp-list js-slick" data-slick='{
                                                    "infinite": true,
                                                    "slidesToShow": 3,
                                                    "slidesToScroll": 1,
                                                    "swipeToSlide": true,
                                                    "autoplay": false,
                                                    "autoplaySpeed": 5000,
                                                    "speed": 500,
                                                    "cssEase": "ease-in-out",
                                                    "arrows": true,
                                                    "appendArrows": ".spp-carousel .hgSlickNav.hgSlickNav_2",
                                                    "responsive": [
                                                            {
                                                                    "breakpoint": 1199,
                                                                    "settings": {
                                                                            "slidesToShow": 3
                                                                    }
                                                            },
                                                            {
                                                                    "breakpoint": 992,
                                                                    "settings": {
                                                                            "slidesToShow": 2
                                                                    }
                                                            },
                                                            {
                                                                    "breakpoint": 576,
                                                                    "settings": {
                                                                            "slidesToShow": 1
                                                                    }
                                                            }
                                                    ]
                                            }'>
                                                <!-- Product #1 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                            <span class="hg_badge_sale">
                                                                NEW!
                                                            </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                    <!-- Primary image -->
                                                                    <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                    <!-- Secondary image -->
                                                                    <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model2a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural grej fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                        <span class="amount">Â£3,499.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                        <span class="amount">Â£2,499.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 5 out of 5">
                                                                    <span style="width:100%">
                                                                        <strong class="rating">5</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                        <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #1 -->

                                                <!-- Product #2 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                                <span class="hg_badge_sale">
                                                                        NEW!
                                                                </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                        Natural beige fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                            <span class="amount">Â£2,500.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                            <span class="amount">Â£1,999.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 4 out of 5">
                                                                        <span style="width:80%">
                                                                                <strong class="rating">4</strong> out of 5
                                                                        </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #2 -->

                                                <!-- Product #3 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">

                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model3.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model3a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                        Natural brown fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                        <span class="amount">
                                                                                Â£2,499.00
                                                                        </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                        <span style="width:0%">
                                                                                <strong class="rating">0</strong> out of 5
                                                                        </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                    <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #3 -->

                                                <!-- Product #4 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">
                                                                <span class="hg_badge_sale">
                                                                        NEW!
                                                                </span>
                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model1a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                        Natural gray fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <del data-was="WAS">
                                                                        <span class="amount">Â£2,499.00</span>
                                                                    </del>
                                                                    <ins data-now="NOW">
                                                                        <span class="amount">Â£2,199.00</span>
                                                                    </ins>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 3 out of 5">
                                                                    <span style="width:60%">
                                                                        <strong class="rating">3</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                                <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                                <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                        </svg>
                                                                </a>
                                                                <a href="product-page.html">
                                                                        <span class="more-icon fas fa-compress"></span>
                                                                </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #4 -->

                                                <!-- Product #5 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">

                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model5a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                                <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural rose fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                        Â£3,400.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 0 out of 5">
                                                                    <span style="width:0%">
                                                                        <strong class="rating">0</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                    <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #5 -->

                                                <!-- Product #6 -->
                                                <li>
                                                    <div class="product-list-item prod-layout-classic">
                                                        <!-- Badge container -->
                                                        <div class="hg_badge_container">

                                                        </div>
                                                        <!--/ Badge container -->

                                                        <!-- Product container link -->
                                                        <a href="product-page.html">
                                                            <!-- Image wrapper -->
                                                            <span class="image kw-prodimage">
                                                                <!-- Primary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4.jpg" class="kw-prodimage-img"  alt="Kallyas Product" title="Kallyas Product" />

                                                                <!-- Secondary image -->
                                                                <img src="${pageContext.request.contextPath}/resources/client/images/_shop/model4a.jpg" class="kw-prodimage-img-secondary"  alt="Kallyas Product" title="Kallyas Product" />
                                                            </span>
                                                            <!--/ Image wrapper -->

                                                            <!-- Details -->
                                                            <div class="details kw-details fixclear">
                                                                <!-- Title -->
                                                                <h3 class="kw-details-title">
                                                                    Natural antracite fox fur coat
                                                                </h3>

                                                                <!-- Price -->
                                                                <span class="price">
                                                                    <span class="amount">
                                                                        Â£1,118.00
                                                                    </span>
                                                                </span>
                                                                <!--/ Price -->

                                                                <!-- Star rating -->
                                                                <div class="star-rating" title="Rated 3 out of 5">
                                                                    <span style="width:60%">
                                                                        <strong class="rating">3</strong> out of 5
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <!--/ details fixclear -->
                                                        </a>
                                                        <!-- Product container link -->

                                                        <!-- Actions -->
                                                        <div class="actions kw-actions">
                                                            <a href="#" class="shopping-cart" rel="nofollow" data-product_id="" data-product_sku="" data-quantity="1">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="32" viewBox="0 0 28 32">
                                                                    <path class="svg-cart-icon" d="M26,8.91A1,1,0,0,0,25,8H20V6A6,6,0,1,0,8,6V8H3A1,1,0,0,0,2,8.91l-2,22A1,1,0,0,0,1,32H27a1,1,0,0,0,1-1.089ZM10,6a4,4,0,0,1,8,0V8H10V6ZM2.1,30L3.913,10H8v2.277a2,2,0,1,0,2,0V10h8v2.277a2,2,0,1,0,2,0V10h4.087L25.9,30H2.1Z"></path>
                                                                </svg>
                                                            </a>
                                                            <a href="product-page.html">
                                                                <span class="more-icon fas fa-compress"></span>
                                                            </a>
                                                        </div>
                                                        <!--/ Actions -->
                                                    </div>
                                                    <!--/ product-list-item -->
                                                </li>
                                                <!--/ Product #6 -->
                                            </ul>
                                            <!--/ Featured products list -->

                                            <!-- Slick navigation -->
                                            <div class="hgSlickNav hgSlickNav_2 clearfix"></div>
                                        </div>
                                        <!--/ .shop-latest-carousel -->
                                    </div>
                                    <!--/ col-sm-12 -->
                                </div>
                                <!--/ row -->
                            </div>
                            <!--/ spp-products-rows -->
                        </div>
                        <!--/ shop latest -->
                    </div>
                    <!--/ col-sm-12 col-md-12 mb-30 -->

                    <div class="col-sm-12 col-md-12 mb-50">
                        <!-- Button element -->
                        <div class="text-center">
                            <!-- Button dark lined -->
                            <a href="#" class="btn-element btn btn-lined btn-md lined-dark btn-third">
                                <span>SEE ALL NEW PRODUCTS OF THIS YEAR</span>
                            </a>
                        </div>
                        <!--/ Button element -->
                    </div>
                    <!--/ col-sm-12 col-md-12 mb-50 -->
                </div>
                <!--/ row -->
            </div>
            <!--/ container -->
        </section>
        <!--/ FEATURED / LATEST / BEST SELLING Carousels section -->
        <%@include file="/WEB-INF/views/segment/newsletterbox.jsp" %>
        
        <!-- INCLUDE // These should be loaded in every page -->
        <%@include file="/WEB-INF/views/segment/everypagescript.jsp" %>
        
        <!-- JS FILES // Loaded on this page -->
        <!-- Required js script for animateme scroll effect for slideshow (uncoment script to use effect) -->
        <!-- <script type="text/javascript" src="js/plugins/scrollme/jquery.scrollme.js"></script> -->

        <!-- Required js script for iOS slider -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/plugins/_sliders/ios/jquery.iosslider.min.js"></script>

        <!-- Required js trigger for iOS Slider -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/trigger/slider/ios/kl-ios-slider.js"></script>

        <!-- Slick required js script for Partners Carousel & Products Carousel elements -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/plugins/_sliders/slick/slick.js"></script>

        <!-- Required js trigger for Partners Carousel & Products Carousel elements -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/trigger/kl-slick-slider.js"></script>

        <!-- Custom Kallyas JS codes -->
        <!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/kl-scripts.js"></script>-->

        <!-- Custom user JS codes -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/kl-custom.js"></script>
        
        
        <!----------------------------------no use---------------------------------------->
<!--        <h1>Buy & Sell Cars</h1>
        <div v-pre class="searchbar">
            <div v-pre class="search-container">
                <label><b><em>Search:</em></b></label>
                <input style="width:100%;" type="text" id="searchtext" name="search"/>
                <button id="search">Search</button>
            </div>
        </div>-->
        <div class="cargview" style="width: 70%; margin: 0 auto;">
            <c:forEach var="car" items="${carquery.result}">
                <div class="box-content">
                    <h4>${car.model.car.make} ${car.model.name} ${car.name}</h4>
                    <h5>${car.price}</h5>
                    <div>
                        <p>Year: ${car.year}</p>
                        <p>Location: ${car.branch.name} | ${car.branch.address}</p>
                    </div>
                    <cart-action v-if="contains(${car.id})"></cart-action>
                    <buy-action v-else carid="${car.id}" @cart-action="addToCart"></buy-action>

                </div>
            </c:forEach>
            
        </div>
        
<%--        <div class="pagination-box">
            <div class="pagination-content">
                <c:if test="${carquery.pageNumber gt 1}">
                    <c:choose>
                        <c:when test="${carquery.pageNumber - 1 eq 1}">
                            <span><a href="${pageContext.request.contextPath}"><<</a></span>
                        </c:when>
                        <c:otherwise>
                            <span><a href="${pageContext.request.contextPath}/?page=${carquery.pageNumber - 1}"><<</a></span>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:forEach begin="1" end="${carquery.maxPageSize}" varStatus="lp">
                    <a ${lp.index eq carquery.pageNumber?'class="active"':''}
                       href="${pageContext.request.contextPath}${lp.index eq 1?'':'/?page='+=lp.index}"
                    >
                        ${lp.index}
                    </a>
                </c:forEach>
                <c:if test="${carquery.pageNumber lt carquery.maxPageSize}">
                    <span><a href="${pageContext.request.contextPath}/?page=${carquery.pageNumber + 1}">>></a></span>
                </c:if>
            </div>
        </div>--%>
        
    </jsp:body>
</t:usertag>
