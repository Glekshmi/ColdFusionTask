<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
</head>
<body>

    
    <cfif session.sessVar>
    <!---<cfdump  var="#session.sessVar#">--->
        <h1>Welcome to home Page</h1>
        <button><a href="login.cfm">Back</a></button>
        <cfset session.sessVar = false>
    <cfelse>
        <cflocation  url="login.cfm">
    </cfif>

</body>
</html>