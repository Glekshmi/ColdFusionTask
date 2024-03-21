<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    <h1>Page List</h1>

    <cfquery name="fetchPageTable">
        SELECT PageName
        FROM PageTable
    </cfquery>
    
    <cfoutput>
        <cfloop query="fetchPageTable">
            <p>#fetchPageTable.PageName#</p>
        </cfloop>
    </cfoutput>

</body>
</html>