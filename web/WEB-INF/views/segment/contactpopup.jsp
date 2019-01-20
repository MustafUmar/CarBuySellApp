<!-- Contact form pop-up element content -->
<div id="contact_panel" class="mfp-hide contact-popup">
    <div class="contact-popup-panel">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    
                    <!-- Contact form pop-up element -->
                    <div class="contactForm pop-up-form">
                        <!-- Google reCaptcha required javascript file -->
                        <!-- <script src='https://www.google.com/recaptcha/api.js'></script> -->

                        <!-- Title -->
                        <h3 class="m_title m_title_ext text-custom contact-popup-title tcolor">
                                SELL A CAR NOW
                        </h3>
                        <h4 class="tbk__subtitle fw-thin">
                                Enter your car details and receive an inspection date.
                        </h4>

                        <form action="php_helpers/_contact-process.php" method="post" class="contact_form row mt-40" enctype="multipart/form-data">
                            <div class="cf_response"></div>

                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="name" id="cf_name-pop-up" class="form-control" placeholder="Please enter your first name" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        FIRSTNAME
                                </label>
                            </div>

                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="lastname" id="cf_lastname-pop-up" class="form-control" placeholder="Please enter your first last name" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        LASTNAME
                                </label>
                            </div>

                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="email" id="cf_email-pop-up" class="form-control h5-email" placeholder="Please enter your email address" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        EMAIL
                                </label>
                            </div>

                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="phoneno" id="cf_phoneno-pop-up" class="form-control" placeholder="Please enter your phone number" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        PHONE NUMBER
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="make" id="cf_carmake-pop-up" class="form-control" placeholder="Please enter car make" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        MAKE
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="model" id="cf_model-pop-up" class="form-control" placeholder="Please enter car model" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        MODEL
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="series" id="cf_series-pop-up" class="form-control" placeholder="Please enter car series" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        SERIES
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="year" id="cf_year-pop-up" class="form-control" placeholder="Please enter year" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        YEAR
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="mileage" id="cf_mileage-pop-up" class="form-control" placeholder="Enter mileage in Km" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        MILEAGE
                                </label>
                            </div>
                            <div class="col-sm-6 kl-fancy-form">
                                <input type="text" name="condition" id="cf_condition-pop-up" class="form-control" placeholder="Fairly used, worn or uk used?" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        CONDITION
                                </label>
                            </div>
                            <div class="col-sm-12 kl-fancy-form">
                                <input type="text" name="location" id="cf_location-pop-up" class="form-control" placeholder="Please enter the vehicle's present location" value="" tabindex="1" maxlength="35" required>
                                <label class="control-label">
                                        LOCATION
                                </label>
                            </div>
                            <div class="col-sm-12 kl-fancy-form">
                                <textarea name="message" id="cf_message-pop-up" class="form-control" cols="30" rows="4" placeholder="Enter additional details if needed." tabindex="4" required></textarea>
                                <label class="control-label">
                                        MORE DETAILS
                                </label>
                            </div>

                            <!-- Google recaptcha required site-key (change with yours => https://www.google.com/recaptcha/admin#list) -->
                            <!-- <div class="g-recaptcha" data-sitekey="SITE-KEY"></div> -->
                            <!--/ Google recaptcha required site-key -->

                            <div class="col-sm-6">
                                <!-- Contact form send button -->
                                <button class="btn btn-fullcolor " type="submit">
                                        Send
                                </button>						

                            </div>
                            <div class="col-sm-6">
                                <h4 class="tbk__subtitle fw-thin">
                                        <a href="index.html" style="color: #CD2122;"><i class="fa fa-home"> Go Home</i></a>
                                </h4>
                            </div>
                            <div class="col-sm-6">
                                <h5 class="tbk__subtitle fw-thin">
                                        <a href="process.html" style="color: grey;" target="_blank"> How it works?</a>
                                </h5>
                            </div>
                        </form>
                    </div>
                    <!--/ Contact form pop-up element -->
                </div>
                <!--/ col-md-12 col-sm-12 -->
            </div>
            <!--/ .row -->
        </div>
        <!--/ .container -->
    </div>
    <!--/ .contact-popup-panel -->
    <button title="Close (Esc)" type="button" class="mfp-close">×</button>
</div>
<!--/ Contact form pop-up element content -->