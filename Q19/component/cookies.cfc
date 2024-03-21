<cfcomponent>
    <cffunction  name="visitCount" access="public" >
        <cfset count = 0>
        <cfif isDefined("cookie.visiterCount")>
            <cfset count = cookie.visiterCount>
        </cfif>
        <cfset count++>
        <cfcookie name="visiterCount" value="#count#" expires="30">
        <cfreturn count>
    </cffunction>
</cfcomponent>