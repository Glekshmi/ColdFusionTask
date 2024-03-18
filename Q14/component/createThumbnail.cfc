<cfcomponent>
    <cffunction  name="uploadImageFile" access="" returnType="any">
        <cfargument  name="imageName" type="any" required="true">
        <cfargument  name="description" type="any" required="true">
        <cfargument  name="fileInput" type="any" required="true">
        <!---<cfset fileName = #arguments.fileInput#>--->
        <cfdump  var="#arguments.fileInput#"><br>

        <cfif fileInput NEQ "">
            <cfset uploadDirectory = ExpandPath("./assets/uploads/")>
            <!---<cfdump  var="#uploadDirectory#"><br>--->
            <cfset thumbnailDirectory = ExpandPath("./assets/thumbnails/")>
            <!---<cfdump  var="#thumbnailDirectory#"><br>--->
            <cfset requiredFilePath = uploadDirectory&arguments.fileInput>
            <!---<cfdump  var="#requiredFilePath#"><br>--->
            <cfset thumbnailName = "thumbnail_"&arguments.fileInput>
            <!---<cfdump  var="#thumbnailName#"><br>--->
            <cfset thumbnailPath = thumbnailDirectory&thumbnailName>
            <!---<cfdump  var="#thumbnailPath#"><br>--->
            <cfimage action="resize" source="#requiredFilePath#" destination="#thumbnailPath#" width="20" height="20">

            <cfset requiredThumbnail = thumbnailPath>
            <cfquery datasource="coldfusionDb" name="insertData" result="insertedData">
                INSERT INTO imageTable (imageName, imageDesc, thumbnailPath, imagePath)
                VALUES (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.imageName#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.description#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#requiredThumbnail#">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#requiredFilePath#">
                )
            </cfquery>
            <cfset id = insertedData.generatedKey>
            <!---<cfdump  var="#id#">--->
            <cfquery datasource="coldfusionDb" name="selectData" result="selectedData">
                SELECT imageName, imageDesc, thumbnailPath, imagePath
                FROM imageTable
                WHERE imageId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#id#">
            </cfquery>
            <!---<cfdump  var="#selectedData#" abort>--->
            <!---<cfif selectData.recordCount GT 0>--->
                <!---<cflocation  url="imageList.cfm?thumbnailPathName=#URLEncodedFormat(selectedData.thumbnailPath)#">--->
           <!---<cfelse>
                <cfoutput>Record not found</cfoutput>
            </cfif>--->

        </cfif>
        
    </cffunction>
</cfcomponent>