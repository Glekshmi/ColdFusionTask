<cfset variables.PageId=0>
<cfset variables.PageName=''>
<cfset variables.Description=''>

<cfif structKeyExists(url,"idPage")>
    <cfset variables.getPage=createObject("component","controls/pages").getPage(url.idPage)>
    <cfset variables.PageName=variables.getPage.PageName>
    <cfset variables.Description=variables.getPage.Description>
</cfif>

<cfif StructKeyExists(form,"pageName")>
    <cfif IsNumeric(form.pageId) AND form.pageId GT 0>
        <cfset variables.setPage=createObject("component","controls/pages").editPage(form.pageId,form.pageName,form.pageDes)>
    <cfelse> 
        <cfset variables.getRow=createObject("component","controls/pages").addPage(form.pageName,form.pageDes)>
    </cfif>  
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/user.css">
    <link rel="stylesheet" href="./style/login.css">
    <title>Document</title>
</head>
<body>
    <div class="adminSection">
        <div class="adminHeader">
            <h3>ADD/EDIT PAGE</h3>
        </div>
        <cfoutput>
            <div class="adminBody">
                <form action="" method="post">
                    <lable>Enter Page Name : </label>
                    <input type="hidden" name="pageId" value="#variables.pageId#">
                    <input type="text" name="pageName" value="#variables.PageName#"></br><br>
                    <label>Enter Description : </label>
                    <textarea name="pageDes">#variables.Description#</textarea><br> <br>
                    <input type="submit" value="Submit" name="submit">
                </form>
                <button type="button"><a href="adminPage.cfm">Back</a></button>
            </div>
        </cfoutput>
    </div>
</body>
</html>