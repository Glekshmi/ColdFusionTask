<cfcomponent>
    <cffunction  name="visitCount" access="public" >
        <cfset local.count = 0>
        <cfif isDefined("cookie.visiterCount")>
            <cfset local.count = cookie.visiterCount>
        </cfif>
        <cfset local.count+=1>
        <cfcookie name="visiterCount" value="#local.count#">
        <cfreturn local.count>
    </cffunction>
</cfcomponent>
