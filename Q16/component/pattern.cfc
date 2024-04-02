<cfcomponent>
<cffunction  name="pattern" access="public" returnType="any">

    <cfset local.rows = 3>
    <cfset local.cols = 3>
    <cfset pattern = []>
    <cfloop from="1" to="#rows#" index="row">
        <cfloop from="1" to="#cols#" index="col">
           <cfset arrayAppend(pattern,((col-1)*rows)+row)>
        </cfloop>
        <cfset arrayAppend(pattern,"<br>")>
    </cfloop>
    <cfreturn pattern> 
</cffunction>
</cfcomponent>