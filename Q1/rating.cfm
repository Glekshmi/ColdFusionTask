<!DOCTYPE html>
<html>
<head>
    <title>Q1</title>
</head>
<body>

    <p>Create a page with text box & submit button. Input for the text box is any number    between 1 to 5. Based upon the user input, you should show the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok. Use cfif, cfelseif,cfelse to do this functionality</p>

    <form action="rating.cfm" method="post">
        <label>Enter a number between 0 and 6 </label><br><br>
        <input type="text" name="numInput" required><br><br>
        <input type="submit" name="submit" value="Submit">
    </form>
    <cfif structKeyExists(form, "submit") && isNumeric(form.numInput) && form.numInput gte 0 && form.numInput lte 5>
       <cfinvoke  method="readNum" component="component/rating" returnVariable="result">
        <cfinvokeargument  name="numInput"  value="#form.numInput#">
       </cfinvoke>
       <cfoutput>
            <p>#result#</p>
       </cfoutput>
    </cfif>
    
</body>
</html>