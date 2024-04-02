<cfcomponent>
    <cffunction  name="getDetails" access="public" returnType="any">
        <cfargument  name="babyName" type="string" required="true">
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="wish" type="string" required="true">
        <cfargument  name="imageFile" type="string" required="true">
        <cfset local.uploadDirectory = ExpandPath("./assets/uploads/")>
        <cfset local.requiredFilePath = uploadDirectory&arguments.imageFile>
        <!---<cfset msg = #arguments.wish#>--->
        <cfif local.requiredFilePath NEQ "">
            <cfmail to="#arguments.email#" from="abc@gmail.com" subject="Birthday wishes to #arguments.babyName#" mimeattach="#requiredFilePath#">Dear #arguments.babyName#<br>
            <!---<cfsavecontent  variable="msg">
            </cfsavecontent>--->
            #arguments.wish#
            </cfmail>
            <cfset local.msg = "Sent Successfully">
        <cfelse>
            <cfset local.msg = "Failed to sent your mail">
        </cfif>
        <cfreturn local.msg>
    </cffunction>
</cfcomponent>