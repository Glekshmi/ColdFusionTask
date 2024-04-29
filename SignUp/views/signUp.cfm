<cfinclude  template="header.cfm">
    <div class="container">
      <div class="header">
        <h1 class="fontColor">Registration</h1>
        <cfoutput>
          <p id="pageSuccess" class="errorSection">#variables.result#</p>
          
        </cfoutput>
      </div>
      <div class="bodySection">
      <cfoutput></cfoutput>
        <form action="?action=signUp" method="post">
            <label class="fontColor" >Enter your name</label>
            <input type="text" name="strPersonName" id="personName"><br><br>
            <label class="fontColor">Enter username  </label>
            <input type="text" name="strUsername" id="username" class="usernameField"><br><br>
            <label class="fontColor">Enter password</label>
            <input type="password" name="strPassword" id="password" class="passwordField"><br><br>
            <label class="fontColor">Confirm password</label>
            <input type="password" name="strConfirmPassword" id="confirmPassword" class="strConfirmPassword"><br><br>
            <label for="strRole" class="fontColor">Choose a role</label>
            <select name="strRole" id="role" class="roleField">
              <option value=""></option>
              <option value="Admin">Admin</option>
              <option value="Editor">Editor</option>
              <option value="User">User</option> 
            </select><br><br>
            <input type="submit" value="Submit" id="Submit" name="btnSubmit" class="submitBtn">
        </form>
      </div>
    </div>
</body>
</html> 