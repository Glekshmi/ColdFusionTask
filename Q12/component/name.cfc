<cfcomponent>
    
    <cffunction  name="checkInput" access="public" returnType="query">
        <cfargument  name="numInput" type="numeric" required="true">
        <cfif arguments.numInput NEQ "">
            <cfquery name="fetchNames">
                SELECT firstName, lastName
                FROM nameTable;
            </cfquery>
        </cfif>
        <cfreturn fetchNames>
    </cffunction>

    <cffunction  name="getFirstName" access="public" returnType="query">
        <cfargument  name="rowNum" type="numeric" required="true">
        <cfif arguments.rowNum NEQ "">
            <cfquery name="getSpecificName">
                SELECT firstName
                FROM nameTable
                ORDER BY (SELECT NULL)
                OFFSET  <cfqueryparam value = "#arguments.rowNum - 1#" cfsqltype = "CF_SQL_INTEGER"> ROWS
                FETCH NEXT 1 ROW ONLY;
            </cfquery>
        </cfif>
        <cfreturn getSpecificName>
    </cffunction>

</cfcomponent>