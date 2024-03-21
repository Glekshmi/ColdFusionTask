<!DOCTYPE html>
<html>
<head>
    <title>Q17</title>
    <script src="./script/numberValidation.js"></script>
</head>
<body>

    <form action="" method="post" onsubmit="return numberValidation()">
        <label name="number">Enter a number</label><br>
        <input type="text" name="number"><br><br>
        <input type="submit" value="Submit"><br>
    </form>

    <cfif structKeyExists(form, "number") AND isNumeric(form.number)>
        <cfinvoke  method="checkNumber" component="component/oddOrEve" returnvariable="">
            <cfinvokeargument  name="number"  value="#form.number#">
        </cfinvoke>
    </cfif>

</body>
</html>