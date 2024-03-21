<!DOCTYPE html>
<html>
<head>
    <title>Q18</title>
</head>
<body>

    <cfset componentObj = createObject("component", "component/table")>
    <cfset result = componentObj.createTable()>
    <cfoutput>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <cfloop query="result">
            <tr>
                <td>#Id#</td>
                <td>#Name#</td>
                <td>#Email#</td>
            </tr>
        </cfloop>
        </table>
    </cfoutput>

</body>
</html>