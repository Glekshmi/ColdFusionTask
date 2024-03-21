<cfcomponent>
    <cffunction  name="checkNumber" access="public" returnType="any">
        <cfargument  name="number" type="numeric" required="true">

        <cfset var result = "">
        <cfloop index="i" from="1" to="#arguments.number#" step="1">
            <cfif i mod 2 EQ 0 >
                <cfoutput>
                    <p style="color:red;">#i#</p>
                </cfoutput>
            <cfelse>
                <cfoutput>
                    <p style="color:green;">#i#</p>
                </cfoutput>
            </cfif>
        </cfloop>

    </cffunction>
</cfcomponent>