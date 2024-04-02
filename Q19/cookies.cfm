<!DOCTYPE html>
<html>
<head>
    <title>Q19</title>
</head>
<body>

    <form action="" method="post">
        <input type="submit" name="Submit"><br>
    </form>

    <cfif structKeyExists(form, "submit")>
        <cfset local.componentObj = createObject("component","component/cookies")>
        <cfset local.result = local.componentObj.visitCount()>
        <cfoutput>
            <p>#result#</p>
        </cfoutput>
    </cfif>

</body>
</html>