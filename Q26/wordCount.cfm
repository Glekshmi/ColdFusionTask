<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
</head>
<body>

    <h1>File Upload</h1>

    <form action="" method="post" enctype="multipart/form-data">
        <label>Select a text file to upload</label><br><br>
        <input type="file" name="textFile"><br><br><br>
        <input type="submit" value="Submit"><br>
    </form>

    <cfif structKeyExists(form, "textFile")>
        <cfinvoke  method="uploadFile" component="component/wordCount" returnVariable="result">
            <cffile action="upload" filefield="textFile"  destination="#ExpandPath("./assets/uploads")#"  nameconflict="makeunique">
            <cfset uploadedFilePath = cffile.serverFile>
            <cfinvokeargument  name="textFile"  value="#uploadedFilePath#">
        </cfinvoke>
       <cfoutput>
            <p>Total word count is #result#</p>
       </cfoutput>
    </cfif>

</body>
</html>