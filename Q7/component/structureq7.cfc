<cfcomponent>
    <cffunction name="printStruct" access="public" returntype="any">
       <cfargument name="key" type="any" required="true">
        <cfargument name="value" type="any" required="true">
        <cfset values = structInsert(session.sessVariable, arguments.key, arguments.value)>
        <cfset local.result = session.sessVariable>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>