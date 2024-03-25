<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscribe Form</title>
     <script src="./script/jqueryFunction.js"></script>
    <script src="./script/email.js"></script>
</head>

<body>
    <form action="" method="post" >
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>
        <br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        <button type="button" id="checkEmail" >Check</button><br><br>
        <button type="submit" id="submitBtn" disabled>Submit</button>
        <p id="errorMessage" style="color: red;"></p>
    </form>

    <cfif structKeyExists(form, "firstName") AND structKeyExists(form, "email")>
        <cfinvoke  method="checkMail" component="component/subscribe" returnVariable="">
            <cfinvokeargument  name="email"  value="#form.email#">
        </cfinvoke>
        <cfinvoke  method="insertData" component="component/subscribe" returnVariable="">
            <cfinvokeargument  name="firstName"  value="#form.firstName#">
            <cfinvokeargument  name="email"  value="#form.email#">
        </cfinvoke>
    </cfif>

</body>
</html>
