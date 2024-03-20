<!DOCTYPE html>
<html>
<head>
    <title>Q13</title>
</head>
<body>

    <form action="" method="post">
        <label name="keyword">Enter a word<label><br>
        <input type="text" name="keyword"><br><br>
        <input type="submit" value="Submit"><br><br>
    </form>

    <cfif structKeyExists(form, "keyword")>
        <cfinvoke  method="getWord" component="component/highlight" returnVariable="count">
            <cfinvokeargument  name="keyword"  value="#form.keyword#">
        </cfinvoke>
        <cfoutput>
            <p>Found the key word in #count# time(s) - the quick brown fox jumps over the lazy dog</p>
        </cfoutput>
    </cfif>

</body>
</html>