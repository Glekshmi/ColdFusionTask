<cfoutput>
<cfset myComponent = CreateObject("component", "CFC.pages")>
<cfset myComponent.login()>


<cfinclude  template="header.cfm">

  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <img src="../assets/img/32IpIkbEsT3uW.png!f305cw" alt="">
        <span>Wisdom Web</span>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="./index.cfm">Home</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
    </div>
  </header>


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
                      <input type="text" name="userName" id="userName">
                      <label for="userName" id="userName">Enter your username</label>
                    </div>
                    <div class="input-field">
                      <input type="password" name="password" id="password" >
                      <label for="password" name="password" id="password">Enter your password</label>
                    </div>
             
                    <input type="hidden" name="action"><br><br>
                    <button type="submit" id="loginSubmit">Log In</button>
                  </form>
                  <p id="successDisplay" style="color:green;"></p>
                  <p id="errorDisplay" style="color:red;"></p>
                </div>              
              </div>
            </div>

            <cfoutput>
                <cfif structKeyExists(form,"userName") AND structKeyExists(form,"password")>
                    <cfinvoke component="CFC/pages" method="doLogin" returnvariable="result">
                        <cfinvokeargument name="userName" value="#form.userName#">
                        <cfinvokeargument name="password" value="#form.password#">
                    </cfinvoke>
                    
                </cfif>
            </cfoutput>
  
            <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
              <img src="https://t3.ftcdn.net/jpg/03/39/70/90/360_F_339709048_ZITR4wrVsOXCKdjHncdtabSNWpIhiaR7.jpg" class="img-fluid" alt="">
            </div>
  
          </div>
        </div>
  
      </section>

      

      <footer>
        <nav id="navbar" class="navbar">
            <ul class="footerSection">
              <li><a class="nav-link scrollto active" href="">Home</a></li>
            </ul>
        </nav>
    <footer>
  
    <cfinclude  template="jsStyle.cfm">
    </cfoutput>