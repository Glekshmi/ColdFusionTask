<!DOCTYPE html>
<html>
<head>
    <title>Q3</title>
</head>
<body>

    <p>Create a page with text box & submit button. Input for the text box is "3,8,9,11,12" While click on submit, result page should show numbers divided by 3. So the result must be 3,9,12. Should use cfcontinue in the appropriate place</p>

    <form action="divisibilityCheck.cfm" method="post">
        <label>Enter the numbers "3,8,9,11,12"</label><br><br>
        <input type="text" name="numInput" required><br><br>
        <input type="submit" name="submit" value="Submit">
    </form>
    <cfif structKeyExists(form, "submit")>
       <cfinvoke  method="readNum" component="component/divisibilityCheck" returnVariable="result">
        <cfinvokeargument  name="numInput"  value="#form.numInput#">
        </cfinvoke>
        <cfoutput>Numbers divisible by 3 are</cfoutput>
        <cfloop array="#result#" index="index">
            <cfoutput>#index#</cfoutput>
        </cfloop>
    </cfif>
    
</body>
</html>