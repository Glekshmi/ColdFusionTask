<!DOCTYPE html>
<html>
<head>
    <title>Q5</title>
</head>
<body>

    <p>Get user & his mother date of birth. show users age & At what age his mother delivered him. Tell him how many days are remaining for his & his mother’s birthday</p>

    <form action="age.cfm" method="post">
        <label name="sonAge">Enter your age</label>
        <input type="date" name="sonAge" required><br><br>
        <label name="momAge">Enter mother's age</label>
        <input type="date" name="momAge" required><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "sonAge") && structkeyExists(form, "momAge")>
        <cfinvoke  method="checkAge" component="component/age" returnVariable="result">
            <cfinvokeargument  name="sonAge"  value="#form.sonAge#">
            <cfinvokeargument  name="momAge"  value="#form.momAge#">
        </cfinvoke>
    </cfif>

</body>
</html>