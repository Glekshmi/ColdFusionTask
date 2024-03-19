<cfcomponent>
    <cffunction  name="multiply" access="public" returnType="any">
        <cfargument  name="num" type="numeric[]" required="true">
        <cfset product = 1>
        <cfloop array="#arguments.num#" index="index">
            <cfset product *= index>
        </cfloop>
        <cfreturn product>
    </cffunction>
</cfcomponent>