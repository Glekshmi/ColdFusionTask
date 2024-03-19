
<!DOCTYPE html>
<html>
<head>
    <title>coldfusion structure q1</title>
</head>
<body>
    <h1>coldfusion structure q1</h1>

    <form method="post" action="">
        <label for="key">Enter key:</label><br><br>
        <input type="text" name="key" required>
        <br>
        <label for="value">Enter value:</label><br><br>
        <input type="text" name="value" required>
        <br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "key") and structKeyExists(form, "value")>
        <cfset componentObj = createObject("component", "component/structureq6")>
        <cfset valAccept = componentObj.printStruct(form.key,form.value)> 
        <cfdump  var="#valAccept#">
        <cfset structClear(form)>
    </cfif>

</body>
</html>
