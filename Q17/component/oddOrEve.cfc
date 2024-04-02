<cfcomponent>
    <cffunction  name="checkNumber" access="public" returnType="any">
        <cfargument  name="number" type="numeric" required="true">
        <cfset local.numberColor = []>
        <cfloop index="i" from="1" to="#arguments.number#" step="1">
            <cfif i mod 2 EQ 0 >
               <cfset arrayAppend(local.numberColor, { value=i,color = "red"})>
            <cfelse>
                <cfset arrayAppend(local.numberColor, { value=i,color = "green"})>
            </cfif>

        </cfloop>
        <cfreturn local.numberColor>
    </cffunction>
</cfcomponent>