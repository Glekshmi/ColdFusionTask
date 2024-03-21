<!DOCTYPE html>
<html>
<head>
    <title>Q18</title>
</head>
<body>

    <form action="" method="post">
        <input type="submit" name="Submit"><br>
    </form>

    <cfif structKeyExists(form, "submit")>
        <cfset componentObj = createObject("component","component/cookies")>
        <cfset result = componentObj.visitCount()>
        <cfoutput>
            <p>#result#</p>
        </cfoutput>
    </cfif>

</body>
</html>