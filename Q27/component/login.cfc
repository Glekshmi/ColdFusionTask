<cfcomponent>
    <cffunction  name="checkLogin" access="public" returnType="any">
        <cfargument  name="userName" type="string">
        <cfargument  name="password" type="string">
        <cfif arguments.userName EQ "admin" AND arguments.password EQ "admin123">
            <cfset session.sessVar = true>
            <cfif session.sessVar>
                <cflocation  url="welcome.cfm?sessionVar=#session.sessVar#">
            <cfelse>
                <cflocation  url="login.cfm">
            </cfif>
        <cfelse>
            <cfoutput>
                <p>Invalid username or password</p>
            </cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>