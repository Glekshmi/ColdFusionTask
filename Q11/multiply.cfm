<!DOCTYPE html>
<html>
<head>
    <title>Q10</title>
</head>
    <body>

            <cfset local.componenetObj = createObject("component", "component/multiply")>
            <cfoutput>
                multiply(2,3) = #local.componenetObj.multiply([2,3])#
                
            </cfoutput>
    </body>
</html>
