<cfcomponent>
    <cffunction  name="checkCaptcha" access="public" returnType="any">
        <cfargument  name="captcha" type="string" required="true">
        <cfargument  name="email" type="string" required="true">
        <cfif arguments.captcha NEQ "" AND arguments.email NEQ "">
            <cfif arguments.captcha EQ "Ginger">
                    <cfset local.msg = "Email Address successfully subscribe our newsletter">
            <cfelse>
                    <cfset local.msg = "Please enter valid captcha">
            </cfif>
        </cfif>
        <cfreturn local.msg>
    </cffunction>
</cfcomponent>