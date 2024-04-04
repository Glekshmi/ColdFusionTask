<cfcomponent>
    <cffunction name="jsonToTable" access="public" returntype="array">
        <cfset local.jsonData = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]'>
        <cfreturn deserializeJSON(jsonData)>
    </cffunction>
</cfcomponent>
