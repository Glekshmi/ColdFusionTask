<cfset myComponent = CreateObject("component", "controls/pages")>
<cfset myComponent.login()>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/login.css">
    <title>Document</title>
</head>
<body>
    <div class="loginSection">
        <div class="loginHeader">
            <h2 class="loginText">Login</h2>
        </div>
        <div class="loginBody">
            <form action="" method="post">
                <label class="labelField">Enter Username : </label>
                <input type="text" name="userName" class="inputField"><br><br>
                <label class="labelField">Enter Password : </label>
                <input type="password" name="password" class="inputField"><br><br>
                <div class="submitButton">
                    <input type="submit" name="submit" value="Submit">
                </div>
            </form>
        </div>
        <div>
            <cfoutput>
                <cfif structKeyExists(form,"userName") AND structKeyExists(form,"password")>
                    <cfinvoke component="controls/pages" method="doLogin" returnvariable="result">
                        <cfinvokeargument name="userName" value="#form.userName#">
                        <cfinvokeargument name="password" value="#form.password#">
                    </cfinvoke>
                    <div class="errorDisplay">#result#!</div>
                </cfif>
            </cfoutput>
        </div> 
    </div>   
</body>
</html>