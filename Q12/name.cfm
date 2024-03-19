<!DOCTYPE html>
<html>
<head>
    <title>Q12</title>
</head>
<body>
    <form action="" method="post">
        <label name="numInput">Enter a number less than 10</label>
        <input type="text" name="numInput"><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "numInput")>
        <cfinvoke  method="checkInput" component="component/name" returnType="">
        <cfinvokeargument  name="numInput"  value="#form.numInput#">
        </cfinvoke>
        <cfloop query="#fetchNames#">
            <cfoutput>
                
            </cfoutput>
        </cfloop>
    </cfif>
</body>
</html>
