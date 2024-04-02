<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

    <cfset imgId = url.Id>
    <cfset imageName = url.imgName>
    <cfset nwList = []>
    <cfset nwList = url.thumbnailPathName>
    <cfset thumbnailName = listToArray(nwList,"\")>
    <cfset imgSourcePath = arrayLast(thumbnailName)>

    <cfoutput>
        <p><a href="component/displayImage.cfc?method=checkId&imgId=#imgId#" class="detailsLink">#imageName#</a></p>
        <img src="../Q14/assets/thumbnails/#imgSourcePath#" alt="Thumbnail Image">
    </cfoutput>

</body>
</html>