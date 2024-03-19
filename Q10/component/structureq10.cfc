<cfcomponent>
    <cffunction name="printStruct" access="public" returntype="any">
       <cfargument name="key" type="any" required="true">
        <cfargument name="value" type="any" required="true">
        
        <cfif structKeyExists(session.sessVariable, arguments.key)>
            <cfset session.sessVariable[arguments.key] = arguments.value>
        <cfelse>
            <cfset structInsert(session.sessVariable, arguments.key , arguments.value)>
        </cfif>
            <cfset local.result = session.sessVariable>
            <cfreturn local.result>
    </cffunction>
</cfcomponent>