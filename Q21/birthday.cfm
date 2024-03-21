<!DOCTYPE html>
<html>
<head>
    <title>Q21</title>
    <script src="./script/formValidation.js"></script>
</head>
<body>

    <form action="" method="post" enctype="multipart/form-data">
        <label>Birthday Baby Name</label>
        <input type="text" name="babyName"><br><br>
        <label>Email id</label>
        <input type="email" name="email"><br><br>
        <label>Birthday Wish</label>
        <input type="text" name="wish"><br><br>
        <label>Greetings Image</label>
        <input type="file" name="imageFile"><br><br>
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "imageFile")>
        <cfinvoke  method="getDetails" component="component/birthday" returnVariable="">
            <cfinvokeargument  name="babyName"  value="#form.babyName#">
            <cfinvokeargument  name="email"  value="#form.email#">
            <cfinvokeargument  name="wish"  value="#form.wish#">
            <cffile action="upload" filefield="imageFile"  destination="#ExpandPath("./assets/uploads")#"  nameconflict="makeunique">
            <cfset uploadedFilePath = cffile.serverFile>
            <cfinvokeargument  name="imageFile"  value="#uploadedFilePath#">
        </cfinvoke>
    </cfif>

</body>
</html>