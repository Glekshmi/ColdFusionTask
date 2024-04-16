<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/user.css">
    <title>Document</title>
</head>
<body>

    <cfoutput>
        <cfset local.idPage=url.idPage>
        
        <cfset local.demo=createObject("component","controls/pages")>
        <cfset local.display=#local.demo.viewData(local.idPage)#>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Page Name</th>
                    <th scope="col">Description</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="#local.display#">
                    <tr>
                        <td>#pageName#</td>
                        <td>#Description#</td>
                    </tr>
                </cfloop> 
            </tbody>
        </table>
        <button type="button"><a href="adminPage.cfm">Back</a></button>
        <button type="button"><a href="login.cfm">logout</a></button>
    </cfoutput>

</body>
</html>