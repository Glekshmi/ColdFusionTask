<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/styleQn28.css">
    <title>Document</title>
</head>
<body>
    <h2>Login</h2>
    <div>
        <form action="" method="post" >
            <label>Enter Username : </label>
            <input type="text" name="userName"><br><br>
            <label>Enter Password : </label>
            <input type="password" name="password"><br><br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </div>
    <div>
        <cfoutput>
            <cfif structKeyExists(form,"userName") AND structKeyExists(form,"password")>
                <cfinvoke component="component/change" method="login" returnvariable="loginMsg">
                    <cfinvokeargument name="userName" value="#form.userName#">
                    <cfinvokeargument name="password" value="#form.password#">
                </cfinvoke>
                #loginMsg#
            </cfif>
        </cfoutput>
    </div>
</body>
</html>