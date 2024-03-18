<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <script src="./script/uploadImgQ14.js"></script>
</head>
<body>
    <form action="createThumbnail.cfm" method="post" enctype="multipart/form-data" onsubmit="return checkFileSize()">
        <label for="imageName">Image Name:</label><br>
        <input type="text" name="imageName" required><br><br>
        
        <label for="description">Description:</label><br>
        <textarea name="description" required></textarea><br><br>
        
        <label for="fileInput">Choose Image (JPG/PNG/GIF, Max 1MB):</label><br>
        <input type="file" id="fileInput" name="fileInput" accept=".jpg, .jpeg, .png, .gif" required><br><br>
        <input type="submit" value="Upload">
    </form>

    <cfif structKeyExists(form, "imageName") && structKeyExists(form, "description") && structKeyExists(form, "fileInput")>
        <cfinvoke component="component/createThumbnail" method="uploadImageFile" returnVariable="result">
            <cfinvokeargument name="imageName" value="#form.imageName#">
            <cfinvokeargument name="description" value="#form.description#">
            <cffile action="upload" filefield="fileInput"  destination="#ExpandPath("./assets/uploads")#"  nameconflict="makeunique">
            <cfset uploadedFilePath = cffile.serverFile>
            <cfinvokeargument  name="fileInput"  value="#uploadedFilePath#">
        </cfinvoke>
    </cfif>

</body>
</html>