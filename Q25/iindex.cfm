<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <h1>Word count</h1>

    <form action=""  method="post">
        <label name="sentence">Enter a sentence</label>
        <input type="text" name="sentence"><br><br>
        <input type="submit" name="submit" value="Submit" >
    </form>

    <cfif structKeyExists(form, "sentence")>
    <cfinvoke  method="readText" component="component/iindex" returnVariable="">
        <cfinvokeargument  name="sentence"  value="#form.sentence#">
    </cfinvoke>
    </cfif>
</body>
</html>