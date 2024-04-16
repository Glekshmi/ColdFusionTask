<cfset myComponent = CreateObject("component", "controls/pages")>
<cfset myComponent.login()>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FlexStart Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="./assets/css/login.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/32IpIkbEsT3uW.png!f305cw" alt="">
        <span>Wisdom Web</span>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="index.html">Home</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

 
    <!-- Login Section-->

    <main id="main" style="margin-top:100px;">

      <section id="login" class="login">
  
        <div class="container" data-aos="fade-up">
          <div class="row gx-0">
  
            <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
              <div class="content">
                
                <div class="wrapper">
                  <form action="" method="post">
                    <h2>Login</h2>
                      <div class="input-field">
                      <input type="text" name="userName" required>
                      <label for="email">Enter your username</label>
                    </div>
                    <div class="input-field">
                      <input type="password" name="password"  required>
                      <label for="password" name="password">Enter your password</label>
                    </div>
             
                    <input type="hidden" name="action" value="alogin"><br><br>
                    <button type="submit">Log In</button>
                  </form>
                </div>              
              </div>
            </div>

            <cfoutput>
                <cfif structKeyExists(form,"userName") AND structKeyExists(form,"password")>
                    <cfinvoke component="controls/pages" method="doLogin" returnvariable="result">
                        <cfinvokeargument name="userName" value="#form.userName#">
                        <cfinvokeargument name="password" value="#form.password#">
                    </cfinvoke>
                    <div class="errorDisplay">#result#!</div>
                </cfif>
            </cfoutput>
  
            <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
              <img src="https://t3.ftcdn.net/jpg/03/39/70/90/360_F_339709048_ZITR4wrVsOXCKdjHncdtabSNWpIhiaR7.jpg" class="img-fluid" alt="">
            </div>
  
          </div>
        </div>
  
      </section>

    <!-- End Login Section-->
	
  <!-- ======= Footer ======= -->
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>