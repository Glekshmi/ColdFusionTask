
<!DOCTYPE html>
<html>
<head>
    <title>coldfusion structure q1</title>
</head>
<body>
    <h1>coldfusion structure q1</h1>

    <form method="post" action="structureq7.cfm">
        <label for="key">Enter key:</label><br><br>
        <input type="text" name="key" required>
        <br>
        <label for="value">Enter value:</label><br><br>
        <input type="text" name="value" required>
        <br>
        <input type="submit" value="Submit">
    </form>
     
    <cfif structKeyExists(form,"key") >
        <cfinvoke  component="component/structureq7" method="printStruct">
            <cfinvokeargument name="key" value="#form.key#"/>
            <cfinvokeargument name="value" value="#form.value#"/>
        </cfinvoke>
        <cfdump  var="#session.sessVariable#">
    </cfif>
    
</body>
</html>
