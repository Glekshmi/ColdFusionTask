<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/page.css">
    <title>Document</title>
</head>
<body>
    <div>
        <h1>Admin Page</h1>
    </div>
    <cfoutput>
        <div>
            <cfset local.demo=createObject("component","component/change")>
            <cfset local.display=#local.demo.display()#>
        </div>
        <div>
            <table border="1">
                <tr>
                    <th>PageID</th>
                    <th>PageName</th>
                    <th>PageDescription</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <cfloop query="#local.display#">
                    <tr>
                        <td>#pageId#</td>
                        <td>#pageName#</td>
                        <td>#Description#</td>
                        <td><a href="editPage.cfm?idPage=#pageId#">Edit</a></td>
                        <td><a href="component/change.cfc?method=deleteRow&idPage=#pageId#">Delete</a></td>
                    </tr>     
                </cfloop>      
            </table>
        </div>
        <div class="footer">
            <form action="addPage.cfm" method="post">
                <input type="submit" value="Add New Page" name="submit">
            </form>
            <button type="button" class="logoutBtn"><a href="login.cfm">logout</a></button>
        </div>
        
    </cfoutput>
    </div>

</body>
</html>