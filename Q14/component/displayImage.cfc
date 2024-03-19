<cfcomponent>
    <cffunction  name="checkId" access="remote" returnType="any">
        <cfargument  name="imgId" type="numeric" required="true">

        <cfif arguments.imgId NEQ "">
            <cfquery name="fetchImage" datasource="coldfusionDb">
                SELECT imageName,imageDesc,imagePath
                FROM imageTable
                WHERE imageId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.imgId#">
            </cfquery>
            <cflocation  url="../displayImage.cfm?imgName=#URLEncodedFormat(fetchImage.imageName)#&imgDesc=#URLEncodedFormat(fetchImage.imageDesc)#&imgPath=#URLEncodedFormat(fetchImage.imagePath)#">
        <cfelse>
            <cfoutput>
                <p>file not found</p>
            </cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>