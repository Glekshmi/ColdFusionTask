<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/page.css">
    <title>Document</title>
</head>
<body>

        <cfoutput>
        <cfset userRole = session.userRole>
        
        <cfset local.demo=createObject("component","controls/pages")>
        <cfset local.display=#local.demo.displayPage()#> 
       
        <h1>#userRole# page</h1>
        <div>
            <table border="1">
            <cfif userRole === 'user'>
                <tr>
                    <th>PageID</th>
                    <th>PageName</th>
                </tr>
                <cfloop query="#local.display#">
                    <tr>
                        <td>#pageId#</td>
                        <td><a href="userView.cfm?idPage=#pageId#">#pageName#</td>
                </cfloop> 
            <cfelse>
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
                        <td><a href="controls/pages.cfc?method=deleteRow&idPage=#pageId#">Delete</a></td>
                    </tr>     
                </cfloop> 
            </cfif>   
            </table>
        </div>
        <div class="footer">
            <form action="editPage.cfm?" method="post">
                <input type="submit" value="Add New Page" name="submit">
            </form>
            <button type="button" class="logoutBtn"><a href="controls/pages.cfc?method=logout">Logout</a></button>
        </div>
        
        </cfoutput>
        </div>


   

</body>
</html>