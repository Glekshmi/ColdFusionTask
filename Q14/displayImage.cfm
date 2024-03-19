<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    <cfset imgName = url.imgName>
    <cfset imageDesc = url.imgDesc>
    <cfset imagePath = url.imgPath>
    <cfset nwList = []>
    <cfset nwList = imagePath>
    <cfset imgFilePath = listToArray(nwList,"\")>
    <cfset imgSourcePath = arrayLast(imgFilePath)>

    <cfoutput>
        <p>#imgName#</p>
        <p>#imgDesc#</p>
        <img src="../Q14/assets/uploads/#imgSourcePath#" alt="Thumbnail Image">
    </cfoutput>

</body>
</html>