<!DOCTYPE html>
<html>
<head>
    <title>Q20</title>
    <script src="./script/formValidation.js"></script>
</head>
<body>

    <cfimage action="captcha" width="200" height="50" text="Ginger" difficulty="medium" fontSize="18" fonts="Comic Sans MS,Times New Roman">
    <form action="" method="post" onsubmit="return formValidation()">
        <label name="captcha">Enter the captcha</label><br>
        <input type="text" name="captcha" id="captcha"><br>
        <label>Enter the mailId</label><br>
        <input type="email" name="email" id="email"><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "captcha") AND structKeyExists(form, "email")>
        <cfinvoke  method="checkCaptcha" component="component/captcha" returnVariable="result">
            <cfinvokeargument  name="captcha"  value="#form.captcha#">
            <cfinvokeargument  name="email"  value="#form.email#">
        </cfinvoke>
        
        <cfoutput>
            <p>#result#</p>
        </cfoutput>
    </cfif>

</body>
</html>