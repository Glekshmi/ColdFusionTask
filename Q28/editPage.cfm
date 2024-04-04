<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/styleQn28.css">
    <title>Document</title>
</head>
<body>
    <div>
        <h3>EDIT PAGE</h3>
    </div>
    <cfoutput>
        <div>
            <cfif StructKeyExists(form,"pageName")>
                <cfinvoke method="editRow" component="component/change" returnvariable="editMsg">
                    <cfinvokeargument name="pageName" value="#form.pageName#">
                    <cfinvokeargument name="pageDes" value="#form.pageDes#">
                    <cfinvokeargument name="idPage" value="#url.idPage#">
                </cfinvoke>
                 #editMsg#
            </cfif>
        </div>
        <div>
            <form action="" method="post">
                <lable>Enter Page Name : </labe>
                <input type="text" name="pageName"></br><br>
                <label>Enter Description : </label>
                <textarea name="pageDes"></textarea><br>
                <br>
                <input type="submit" value="Submit" name="submit">
            </form>
        </div>
    </cfoutput>
</body>
</html>