<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    
        <cfinvoke component="component/multiply" method="multiply" returnVariable="result1">
            <cfinvokeargument name="firstValue" value="1">
            <cfinvokeargument name="secondValue" value="2">
        </cfinvoke>
        <cfinvoke component="component/multiply" method="multiply" returnVariable="result2">
            <cfinvokeargument name="firstValue" value="1">
            <cfinvokeargument name="secondValue" value="2">
            <cfinvokeargument name="thirdValue" value="3">
        </cfinvoke>
        <cfinvoke component="component/multiply" method="multiply" returnVariable="result3">
            <cfinvokeargument name="firstValue" value="1">
            <cfinvokeargument name="secondValue" value="2">
            <cfinvokeargument name="thirdValue" value="3">
            <cfinvokeargument name="fourthValue" value="4">
        </cfinvoke>
        <cfset local.componenetObj = createObject("component", "component/multiply")>
        <cfobject name="multiplyObj" type="component" component="component/multiply">
        <cfoutput>
            <p>using cfinvoke</p>
            <p>multiply(1,2) = #result1#</p>
            <p>multiply(1,2,3) = #result2#</p>
            <p>multiply(1,2,3,4) = #result3#</p>
            <p>using createObject</p>
            multiply(2,3) = #local.componenetObj.multiply(2,3)#<br>   
            <p>using cfobject</p>
            <p>multiply(1,2) = #multiplyObj.multiply(1,2)#</p>

        </cfoutput>
</body>
</html>