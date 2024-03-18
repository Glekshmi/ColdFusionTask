<cfcomponent>
    <cffunction name="readNum" access="public" returntype="string">
        <cfargument name="numInput" type="numeric" required="true">
        <cfif arguments.numInput EQ 5>
            <cfreturn "very good">
        <cfelseif arguments.numInput EQ 4>
            <cfreturn "good">
        <cfelseif arguments.numInput EQ 3>
            <cfreturn "fair">
        <cfelseif arguments.numInput EQ 2>
            <cfreturn "Ok">
        <cfelse>
            <cfreturn "Ok">
        </cfif>
    </cffunction>
</cfcomponent>