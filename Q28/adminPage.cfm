<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    <h1>Admin Page</h1>

    <cfquery name="fetchPageTable">
        SELECT pageId,PageName,Description
        FROM PageTable
    </cfquery>
    
    <cfoutput>
        <table border="1">
    <tr>
        <th>Page Id</th>
        <th>Page Name</th>
        <th>Page Decription</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <cfloop query="fetchPageTable">
        <tr>
        <td>#fetchPageTable.PageId#</td>
        <td>#fetchPageTable.PageName#</td>
        <td>#fetchPageTable.Description#</td>
        <td><a href="editPage.cfc">Edit</a></td>
        <td><a href="deletePage.cfc">Delete</a></td>
    </tr>
    </cfloop>
    </table>
    </cfoutput>

    <div>
        <button><a href="addPage.cfm">Add New Page</a></button>
    </div>

</body>
</html>