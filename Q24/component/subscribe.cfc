<cfcomponent>
    <cffunction  name="checkMail" access="remote" returnFormat="JSON">
        <cfargument  name="email" type="string" >
            <cfquery name="checkEmailQuery">
                SELECT COUNT(1) AS emailCount
                FROM SubscribeTable
                WHERE Email = <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfif checkEmailQuery.recordCount>
                <cfreturn {"message":"exists"}>
            <cfelse>
                <cfreturn {"message":"not_exists"}>
            </cfif>
    </cffunction>

    <cffunction  name="insertData" access="public" returnType="any">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">
        <cfquery name="insertQuery" result="insertNewData">
            INSERT INTO SubscribeTable (firstName, email)
            VALUES (
                <cfqueryparam value="#form.firstName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
   
        <cfif result.recordCount>
            <cfreturn {"message":"success"}>
        <cfelse>
            <cfreturn {"message":"failed to insert data"}>
        </cfif>
    </cffunction>
</cfcomponent>