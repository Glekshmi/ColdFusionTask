<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <h1>Login Page</h1>
    <form action="" method="post">
        <label>Enter Username</label>
        <input type="text" name="userName"><br><br>
        <label>Enter Password</label>
        <input type="password" name="password"><br><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "userName") AND structKeyExists(form, "password")>
        <cfinvoke  method="checkLogin" component="component/login" returnVariable="">
            <cfinvokeargument  name="userName"  value="#form.userName#">
            <cfinvokeargument  name="password"  value="#form.password#">
        </cfinvoke>
    </cfif>

</body>
</html>