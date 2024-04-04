<cfcomponent>
    <cffunction  name="checkMail" access="remote" returnFormat="JSON">
        <cfargument  name="email" type="string" >
        <cfquery name="checkEmailQuery">
            SELECT 1 AS emailCount
            FROM SubscribeTable
            WHERE Email = <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfset count = checkEmailQuery.recordCount >
        <cfreturn count>   
    </cffunction>

    <cffunction  name="insertData" access="remote" returnFormat="JSON">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">
        <cfquery name="insertQuery" result="insertNewData">
            INSERT INTO SubscribeTable (firstName, email)
            VALUES (
                <cfqueryparam value="#arguments.firstName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfset insertCount = insertNewData.recordCount>
        <cfreturn insertCount>
    </cffunction>
</cfcomponent>