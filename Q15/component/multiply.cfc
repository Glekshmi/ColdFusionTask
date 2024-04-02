<cfcomponent>
    <cffunction  name="multiply" access="public" returnType="any">
        <cfargument  name="firstValue" type="numeric" required="true">
        <cfargument  name="secondValue" type="numeric" required="true">
        <cfargument  name="thirdValue" type="numeric" required="false" default="1">
        <cfargument  name="fourthValue" type="numeric" required="false" default="1">
        <cfset local.product = 1>
          <cfset local.product = #arguments.firstValue#* #arguments.secondValue#*#arguments.thirdValue#* #arguments.fourthValue#>  
        <cfreturn local.product>
    </cffunction>
</cfcomponent>
