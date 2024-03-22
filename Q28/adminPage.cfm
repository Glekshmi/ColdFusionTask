<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./style/page.css">
</head>
<body>

    <h1>Admin Page</h1>

    <cfquery name="fetchPageTable">
        SELECT pageId,PageName,Description
        FROM PageTable
    </cfquery>
    
    <cfoutput>
        <table border="">
            <tr>
                <th>Page Id</th>
                <th>Page Name</th>
                <th>Page Decription</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <cfloop query="fetchPageTable">
                <tr>
                    <td>#PageId#</td>
                    <td>#PageName#</td>
                    <td>#Description#</td>
                    <td><a href="editPage.cfm?pageId=#PageId#">Edit</a></td>
                    <td><a href="component/deletePage.cfc?method=deletePage&pageId=#pageId#">Delete</a></td>
                </tr>
            </cfloop>
        </table>
    </cfoutput>

    <div class="footer">
        <div>
            <button><a href="addPage.cfm">Add New Page</a></button>
        </div>
        <div>
            <button><a href="login.cfm">Logout</a></button>
        </div>
    </div>

</body>
</html>