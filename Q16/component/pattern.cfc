<cfcomponent>
<cffunction  name="pattern" access="public" returnType="any">

     <cfset rows = 3>
    <cfset cols = 3>
    <cfoutput>
        <cfloop from="1" to="#rows#" index="row">
                <cfloop from="1" to="#cols#" index="col">
                    #((col-1)*rows)+row#
                </cfloop><br>
        </cfloop>
    </cfoutput>
</cffunction>
</cfcomponent>