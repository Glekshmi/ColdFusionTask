<cfset myComponent = CreateObject("component", "component/pages")>
<cfset result=myComponent.getRecord()>
<cfdump  var="#result#">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/user.css">
    <title>Document</title>
</head>
<body>
    <div>
        <h3>ADD/EDIT PAGE</h3>
    </div>
    <cfoutput>
        <cfset pageId = url.pageId>
        <div>
            <cfif StructKeyExists(form,"pageName")>
                <cfinvoke method="editRow" component="component/pages" returnvariable="result">
                    <cfinvokeargument name="pageName" value="#form.pageName#">
                    <cfinvokeargument name="pageDes" value="#form.pageDes#">
                    <cfinvokeargument name="idPage" value="#url.pageId#">
                </cfinvoke>
                 #result#
            </cfif>
        </div>
        <div>
            <form action="" method="post">
            
            <cfif structKeyExists(url, "pageId")>
                <lable>Enter Page Name : </labe>
                <input type="text" name="pageName" value=""></br><br>
                <label>Enter Description : </label>
                <textarea name="pageDes"></textarea><br> <br>
            <cfelse>
                <lable>Enter Page Name : </labe>
                <input type="text" name="pageName"></br><br>
                <label>Enter Description : </label>
                <textarea name="pageDes"></textarea><br> <br>
            </cfif>
                <input type="submit" value="Submit" name="submit">
            </form>
            <button type="button"><a href="adminPage.cfm">Back</a></button>
        </div>
    </cfoutput>
</body>
</html>