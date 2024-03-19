<!DOCTYPE html>
<html>
<head>
    <title>Q8</title>
</head>
<body>

    <form method="post" action="">
            <label for="key">Enter key:</label><br><br>
            <input type="text" name="key" required>
            <br>
            <label for="value">Enter value:</label><br><br>
            <input type="text" name="value" required>
            <br>
            <input type="submit" value="Submit">
        </form>
    
    <cfif structKeyExists(form,"key")>
        <cfinvoke  component="component/structureq8" method="printStruct" returnVariable="result">
            <cfinvokeargument name="key" value="#form.key#"/>
            <cfinvokeargument name="value" value="#form.value#"/>
        </cfinvoke>
        <cfdump  var="#result#">
    </cfif>
    
</body>
</html>
