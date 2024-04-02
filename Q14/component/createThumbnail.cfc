<cfcomponent>
    <cffunction  name="uploadImageFile" access="" returnType="any">
        <cfargument  name="imageName" type="any" required="true">
        <cfargument  name="description" type="any" required="true">
        <cfargument  name="fileInput" type="any" required="true">

        <cfif fileInput NEQ "">
            <cfset local.uploadDirectory = ExpandPath("./assets/uploads/")>
            <cfset local.thumbnailDirectory = ExpandPath("./assets/thumbnails/")>
            <cfset local.requiredFilePath = uploadDirectory&arguments.fileInput>
            <cfset local.thumbnailName = "thumbnail_"&arguments.fileInput>
            <cfset local.thumbnailPath = thumbnailDirectory&thumbnailName>
            <cfimage action="resize" source="#requiredFilePath#" destination="#thumbnailPath#" width="20" height="20">

            <cfset local.requiredThumbnail = thumbnailPath>
            <cfquery datasource="coldfusionDb" name="insertData" result="insertedData">
                INSERT INTO imageTable (imageName, imageDesc, thumbnailPath, imagePath)
                VALUES (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.imageName#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.description#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#requiredThumbnail#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#requiredFilePath#">
                )
            </cfquery>
            <cfset local.id = insertedData.generatedKey>
            <cfquery datasource="coldfusionDb" name="selectData">
                SELECT imageName, imageDesc, thumbnailPath, imagePath
                FROM imageTable
                WHERE imageId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#id#">
            </cfquery>
            <cflocation  url="imageList.cfm?thumbnailPathName=#URLEncodedFormat(selectData.thumbnailPath)#&imgName=#URLEncodedFormat(selectData.imageName)#&Id=#id#">
        </cfif>
        
    </cffunction>
</cfcomponent>