<cfcomponent>
    <cffunction  name="checkMail" access="remote" >
        <cfargument  name="email" type="string">
            <cfquery name="checkEmailQuery">
                SELECT COUNT(*) AS emailCount
                FROM SubscribeTable
                WHERE Email = <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>

            <cfif checkEmailQuery.recordCount>
                <cfoutput>{"message": "exists"}</cfoutput>
            <cfelse>
                <cfoutput>{"message": "not_exists"}</cfoutput>
            </cfif>
    </cffunction>
    <cffunction  name="insertData" access="public" returnType="any">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">

        <cfquery name="insertQuery" datasource="coldfusionDb" >
            INSERT INTO SubscribeTable (firstName, email)
            VALUES (
                <cfqueryparam value="#form.firstName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfoutput>Subscription successful!</cfoutput>
    </cffunction>
</cfcomponent>