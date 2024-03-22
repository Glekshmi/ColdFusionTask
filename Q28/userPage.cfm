<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./style/user.css">
</head>
<body>

    <h1>Page List</h1>

    <cfquery name="fetchPageTable">
        SELECT PageName, Description
        FROM PageTable
    </cfquery>
    
    <cfoutput>
        <cfloop query="fetchPageTable">
            <p><h3 class="name"><a href="descriptionPage.cfm?pageName=#URLEncodedFormat(fetchPageTable.PageName)#&desc=#URLEncodedFormat(fetchPageTable.Description)#">#fetchPageTable.PageName#</a></h3></p>
        </cfloop>
    </cfoutput>

</body>
</html>