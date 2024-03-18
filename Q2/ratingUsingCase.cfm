<!DOCTYPE html>
<html>
<head>
    <title>Q2</title>
</head>
<body>

    <p>Create a page with text box & submit button. Input for the text box is any number between 1 to 5. Based upon the user input, you should show the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok. Use cfcase to do this functionality</p>

    <form action="ratingUsingCase.cfm" method="post">
        <label>Enter a number between 0 and 6 </label><br><br>
        <input type="text" name="numInput" required><br><br>
        <input type="submit" name="submit" value="Submit">
    </form>
    <cfif structKeyExists(form, "submit") && isNumeric(form.numInput) && form.numInput gte 0 && form.numInput lte 5>
       <cfinvoke  method="readNum" component="component/ratingUsingCase" returnVariable="result">
        <cfinvokeargument  name="numInput"  value="#form.numInput#">
       </cfinvoke>
       <cfdump  var="#result#">
    </cfif>
    
</body>
</html>