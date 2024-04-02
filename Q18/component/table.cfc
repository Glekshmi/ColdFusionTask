<cfcomponent>
    <cffunction  name="createTable" access="public" returnType="query">
        <cfset local.personTable = queryNew("Id,Name,Email","integer,varchar,varchar")>
        <cfset local.insertData = queryAddRow(personTable, [{"Id"=1,"Name"="John","Email"="john@123"},{"Id"=2,"Name"="Emila","Email"="emila@123"},{"Id"=3,"Name"="Roy","Email"="roy@123"}])>
        <cfreturn local.personTable>
    </cffunction>
</cfcomponent>