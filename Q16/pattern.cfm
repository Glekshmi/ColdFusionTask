<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

</head>
<body>

    <cfset local.componentObj = createObject("component", "component/pattern")>
    <cfset local.result = local.componentObj.pattern()>   
        <cfoutput>
            <cfloop array="#local.result#" index="index">
                #index#
            </cfloop>
        </cfoutput>
        <cfdump  var="#local.result#">
</body>
</html>