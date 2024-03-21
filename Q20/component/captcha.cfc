<cfcomponent>
    <cffunction  name="checkCaptcha" access="public" returnType="any">
        <cfargument  name="captcha" type="string" required="true">
        <cfargument  name="email" type="string" required="true">
        <cfif arguments.captcha NEQ "" AND arguments.email NEQ "">
            <cfif arguments.captcha EQ "Ginger">
                <cfoutput>
                    <p>Email Address successfully subscribe our newsletter</p>
                </cfoutput>
            <cfelse>
                <cfoutput>
                    <p>Please enter valid captcha</p>
                </cfoutput>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>