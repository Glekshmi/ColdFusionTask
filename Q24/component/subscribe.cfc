<cfcomponent>
    <cffunction  name="checkData" access="public" returnType="any">
        <cfargument  name="email" type="string">
            <cfquery name="checkEmailQuery">
                SELECT COUNT(*) AS emailCount
                FROM SubscribeTable
                WHERE Email = <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>

            <cfif checkEmailQuery.emailCount gt 0>
                <cfoutput>{"message": "exists"}</cfoutput>
            <cfelse>
                <cfoutput>{"message": "not_exists"}</cfoutput>
            </cfif>
    </cffunction>
    <cffunction  name="insertEmail" access="public" returnType="any">
        <cfargument  name="firstName" type="string">
        <cfargument  name="email" type="string">

        <cfquery name="insertQuery" datasource="coldfusionDb" >
            INSERT INTO validationTbl (firstName, email)
            VALUES (
                <cfqueryparam value="#form.firstName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfoutput>Subscription successful!</cfoutput>

    </cffunction>

</cfcomponent>