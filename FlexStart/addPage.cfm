<cfset variables.PageId=0>
<cfset variables.PageName=''>
<cfset variables.Description=''>
<cfset variables.errors =''>
<cfset variables.savePage = ''>
<cfif structKeyExists(url,"idPage") AND url.idPage GT 0>
    <cfset variables.editPage=createObject("component","controls/pages").editPage(url.idPage)>
    <cfset variables.PageId=url.idPage>
    <cfset variables.PageName=editPage.pageName>
    <cfset variables.Description=editPage.Description>
</cfif>

<cfif structKeyExists(form,"submit")>
    <cfif structKeyExists(form,"PageId") AND isNumeric(form.PageId)>
        <cfif structKeyExists(form,"pageName") AND structKeyExists(form,"pageDes")>

            <cfset aplabetsOnly = "/^[A-Za-z]+$/">
            <cfset alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/">
            <cfif form.pageName EQ ''>
                <cfset variables.errors &= "page name field should not be empty"&"<br>">
            <cfelseif reFind("\d", form.pageName)>
                <cfset variables.errors &= "page name should contain alphabets only"&"<br>">
            <cfelse>
                <cfset variables.errors &= ''>
            </cfif>
            
            <cfif form.pageDes  EQ ''>
                <cfset variables.errors &= "page description field should not be empty"&"<br>">
            <cfelseif isNumeric(form.pageDes)>
                <cfset variables.errors &= "page description should not contain digits only"&"<br>">
            <cfelse>
                <cfset variables.errors &= ''>
            </cfif>
            <!---<cfdump  var="#pageName#">

            <cfset nameList = []>
            <cfset symbols = "[,$,&,+,,,:,;,=,?,@,|,',<,>,.,-,^,*,(,),%,!,]">
            <cfset nameList = trim(form.pageName)>
            <cfset symbolList = symbols>
            <cfset pageNameArray = listToArray(nameList,"")>
            <cfif len(nameList) EQ 0>
                <cfset variables.errors &= "page name field should not be empty"> 
            <cfelse>
                <cfloop array="#pageNameArray#" index="i">
                    <cfif  IsValid("integer",i) OR listFind(symbols,i)>
                        <cfset variables.errors &= "page name should not contain digits">  
                        <cfbreak>
                    </cfif>
                </cfloop>
            </cfif>

             <cfif len(form.pageDes) EQ 0>
                <cfset variables.errors &= "page description field should not be empty"> 
            <cfelseif IsValid("integer",form.pageDes)>
                <cfset variables.errors &= "page name should not contain digits">  
            <cfelse>
                    <cfset variables.errors &= ''>
            </cfif>--->

        </cfif>
     </cfif>

        <cfif variables.errors EQ ''>
            <cfif structKeyExists(form,"pageName")>
                <cfset variables.savePage=createObject("component","controls/pages").savePage(form.pageName,form.pageDes,form.PageId)>
            </cfif>
        </cfif>
</cfif>


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
  <script src="./script/validation.js"></script>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: FlexStart
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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
          <li><a class="nav-link scrollto active" href="adminHome.cfm">Home</a></li>
          <li><a class="nav-link scrollto" href="adminPageView.cfm">View</a></li>
          <li><a class="nav-link scrollto" href="controls/pages.cfc?method=logout">Logout</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!-- .navbar -->

    </div>
  </header>
  <!-- End Header -->

 
 

  <main id="main">

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">

      <div class="container" data-aos="fade-up" id="addPageContainer">
        <cfoutput>
          <p class="savePage">#variables.savePage#</p>
        </cfoutput>
        <div class="loginSection">
        <div class="loginHeader">
            <h2 class="loginText" style="color: #4154f1;">Save Page</h2>
        </div>
        <cfoutput>
          <p id="nameError"style="color:red;">#variables.errors#</p>
          <div class="loginBody">
              <form action="" method="post" id="formName">
                  <input type="hidden" name="PageId" value="#variables.PageId#">
                  <label class="labelField">Enter Username</label><br>
                  <input type="text" name="pageName"  value="#variables.PageName#" class="inputField"><br><br>
                  <label class="labelField">Enter Password</label><br>
                  <textarea name="pageDes"  class="inputField">#variables.Description#</textarea>
                  <div class="submitButton">
                    <br><input type="submit" value="Submit"  name="submit" class="addSubmitBtn">
                  </div>
              </form>
          </div>
        </cfoutput>
        
   

    </section><!-- End Pricing Section -->

    

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