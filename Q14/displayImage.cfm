<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    <cfset nwList = []>
    <cfset nwList = url.imgPath>
    <cfset imgFilePath = listToArray(nwList,"\")>
    <cfset imgSourcePath = arrayLast(imgFilePath)>

    <cfoutput>
        <p>#url.imgName#</p>
        <p>#url.imgDesc#</p>
        <img src="../Q14/assets/uploads/#imgSourcePath#" alt="Thumbnail Image">
    </cfoutput>

</body>
</html>