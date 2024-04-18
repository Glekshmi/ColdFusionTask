
<cfinclude  template="header.cfm">

  
  <!-- ======= Hero Section ======= -->
  <cfinclude  template="navbar.cfm">

  <main id="main">

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <!---<p>Check our Pricing</p>--->
        </header>

        <cfif session.userRole === 'admin' or session.userRole === 'editor'>

        <div class="row gy-4" data-aos="fade-left">

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <h3 style="color: #07d5c0;">Can add books</h3>
             
              <img src="../assets/img/Add_to_reading_list-512.webp" class="img-fluid" alt="">
              <ul>
                <li>You can add the name of books and its description</li>
              </ul>
              
            </div>
          </div>

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <h3 style="color: #07d5c0;">Can read books</h3>
              <img src="../assets/img/content-front-page-open-book.png" class="img-fluid" alt="">
              <ul>
                <li>You can read the books and its description</li>
              </ul>
            </div>
          </div>

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <h3 style="color: #07d5c0;">Can edit books</h3>
              <img src="../assets/img/images (1).png" class="img-fluid" alt="">
              <ul>
                <li>You can edit the book names and its description</li>
              </ul>
            </div>
          </div>

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="box ">
              <h3 style="color: #07d5c0;">Can remove books</h3>
              <img src="../assets/img/50665230-remove-book-icon.jpg" class="img-fluid" alt="">
              <ul>
                <li>you can remove the book from your list</li>
              </ul>
            </div>
          </div>

        <cfelse>

            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="box userHomeBox">
              <h3 style="color: #07d5c0;">Can read books</h3>
              <img src="assets/img/content-front-page-open-book.png" class="img-fluid" alt="">
              <ul>
                <li>You can read the books and its description</li>
              </ul>
            </div>
          </div>
        </cfif>


        </div>

      </div>

    </section><!-- End Pricing Section -->
     <cfinclude  template="footer.cfm">
    

  <cfinclude  template="jsStyle.cfm">