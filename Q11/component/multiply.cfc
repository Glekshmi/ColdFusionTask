<cfcomponent>
    <cffunction  name="multiply" access="public" returnType="any">
        <cfargument  name="num" type="numeric[]" required="true">
        <cfset local.product = 1>
        <cfloop array="#arguments.num#" index="index">
            <cfset local.product *= index>
        </cfloop>
        <cfreturn local.product>
    </cffunction>
</cfcomponent>