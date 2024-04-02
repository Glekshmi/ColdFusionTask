<!DOCTYPE html>
<html>
<head>
    <title>Q5</title>
</head>
<body>

    <p>Get user & his mother date of birth. show users age & At what age his mother delivered him. Tell him how many days are remaining for his & his mother's birthday</p>

    <form action="age.cfm" method="post">
        <label name="sonDate">Enter your age</label>
        <input type="date" name="sonDate" required><br><br>
        <label name="momDate">Enter mother's age</label>
        <input type="date" name="momDate" required><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "sonDate") && structkeyExists(form, "momDate")>
        <cfinvoke  method="checkAge" component="component/age" returnVariable="result">
            <cfinvokeargument  name="sonAge"  value="#form.sonDate#">
            <cfinvokeargument  name="momAge"  value="#form.momDate#">
        </cfinvoke>
        <cfoutput>
            <p>Users age : #result.sonAge#</p>
            <p>Age his mother delivered him : #result.deliveryAge#</p>
            <p>Days remaining for users birthday : #result.daysLeftForSon#</p>
            <p>Days remaining for mother's birthday : #result.daysLeftForMom#</p>
        </cfoutput>
    </cfif>

</body>
</html>