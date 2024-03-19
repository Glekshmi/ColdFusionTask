<cfcomponent>
    <cffunction name="printStruct" access="public" returntype="struct">
    <cfargument name="key" type="any" required="true">
        <cfargument name="value" type="any" required="true">
        <cfset myStruct = {}>
        <cfset myStruct[arguments.key] = arguments.value>
        <cfreturn myStruct>
    </cffunction>
</cfcomponent>
