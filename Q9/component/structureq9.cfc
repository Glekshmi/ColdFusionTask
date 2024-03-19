<cfcomponent>
    <cffunction name="printStruct" access="public" returntype="any">
       <cfargument name="key" type="any" required="true">
        <cfargument name="value" type="any" required="true">
        
        <cfif structKeyExists(session.sessVariable, arguments.key)>
            <cfreturn "#arguments.key# already exist so you cannot add again">
        <cfelse>
            <cfset structInsert(session.sessVariable, arguments.key , arguments.value)>
            <cfdump  var="#session.sessVariable#" abort>
        </cfif>
            <cfset local.result = session.sessVariable>
            <cfreturn local.result>
    </cffunction>
</cfcomponent>


