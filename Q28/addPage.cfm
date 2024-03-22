<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./style/page.css">
</head>
<body>
    <h1>Login Page</h1>
    <form action="" method="post">
        <label>Enter Your Page Name</label>
        <input type="text" name="pageName"><br><br>
        <label>Enter Page Description</label>
        <input type="text" name="desc"><br><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "pageName") AND structKeyExists(form, "desc")>
        <cfinvoke  method="addPage" component="component/addPage" returnVariable="">
            <cfinvokeargument  name="pageName"  value="#form.pageName#">
            <cfinvokeargument  name="desc"  value="#form.desc#"> 
        </cfinvoke>
    </cfif>

</body>
</html>