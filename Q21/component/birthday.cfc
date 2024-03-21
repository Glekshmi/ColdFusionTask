<cfcomponent>
    <cffunction  name="getDetails" access="public" returnType="any">
        <cfargument  name="babyName" type="string" required="true">
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="wish" type="string" required="true">
        <cfargument  name="imageFile" type="string" required="true">
        <cfset uploadDirectory = ExpandPath("./assets/uploads/")>
        <cfset requiredFilePath = uploadDirectory&arguments.imageFile>
        <cfif requiredFilePath NEQ "">
            <cfmail to="#arguments.email#"
            from="abc@gmail.com"
            subject="Birthday wishes to #arguments.babyName#"
            mimeattach="#requiredFilePath#">
            Dear #arguments.babyName#<br>
            #arguments.wish#
            </cfmail>
            <cfoutput>
                <p>Sent Successfully</p>
            </cfoutput>
        <cfelse>
            <cfoutput>
                <p>Failed to sent your mail</p>
            </cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>