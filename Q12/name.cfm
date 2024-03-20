<!DOCTYPE html>
<html>
<head>
    <title>Q12</title>
</head>
<body>
    <form action="" method="post">
        <label name="numInput">Enter a number less than 10</label><br>
        <input type="text" name="numInput"><br>
        <input type="submit" value="Submit"><br>
    </form>

    <cfif structKeyExists(form, "numInput")>
        <cfinvoke  method="checkInput" component="component/name" returnVariable="fetchNames">
            <cfinvokeargument  name="numInput"  value="#form.numInput#">
        </cfinvoke>
        <cfinvoke  method="getFirstName" component="component/name" returnVariable="getSpecificName">
            <cfinvokeargument  name="rowNum"  value="#form.numInput#">
        </cfinvoke>
        <cfoutput>
            <table border="1">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
                <cfloop query="fetchNames">
                    <tr>
                        <td>#fetchNames.firstName#</td>
                        <td>#fetchNames.lastName#</td>
                    </tr>
                </cfloop>
            </table>
            <cfloop query="getSpecificName">
                <p>Nth row first name : #getSpecificName.firstName#</p>
            </cfloop>
        </cfoutput>
   
    </cfif>
</body>
</html>
