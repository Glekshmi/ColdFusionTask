  <cfinclude  template="../controllers/action.cfm"> 
  <cfinclude  template="header.cfm">
  <cfinclude  template="navbar.cfm">
 
 

  <main id="main">

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">

      <div class="container" data-aos="fade-up" id="addPageContainer">
        <cfoutput>
          <!---<p class="savePage">#variables.savePage#</p>--->
          <p id="pageSuccess" style="color:green;"></p>
          <p id="pageFailed" style="color:red;"></p>
          <p id="nameError" style="color:red;"></p>
        </cfoutput>
        <div class="loginSection">
        <div class="loginHeader">
            <h2 class="loginText" style="color: #4154f1;">Save Page</h2>
        </div>
        
        <cfoutput>
          
          
          <div class="loginBody">
              <form action="" method="post" id="formName">
                  <input type="hidden" name="PageId" value="#variables.PageId#" id="pageId">
                  <label class="labelField">Enter Page Name</label><br>
                  <input type="text" name="pageName"  value="#variables.PageName#" class="inputField" id="pageName"><br><br>
                  <label class="labelField">Enter Description</label><br>
                  <textarea name="pageDes"  class="inputField" id="pageDes">#variables.Description#</textarea>
                  <div class="submitButton">
                    <br>
                    <button type="submit" name="submit" id="addPageBtn" class="addSubmitBtn">Submit</button>
                  </div>
              </form>
          </div>
        </cfoutput>
        
   

    </section><!-- End Pricing Section -->

    <cfinclude  template="footer.cfm">

  <cfinclude  template="jsStyle.cfm">