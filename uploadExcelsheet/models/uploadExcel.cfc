<cffunction name="uploadFile" access="remote" returntype="string">
        <cfargument name="strPersonName" required="true" type="string">
        
        <cfset local.success = ''>
        <cftry>
            <cfquery name="qryAddUser" dataSource="coldFusionDb" result="addNewUser">
            insert into UserTables (UserName,Password,Role,Name)
            values(
                <cfqueryparam value="##" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="##" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="##" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="##" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfif addNewUser.recordCount>
            <cfset local.success = "true">
        </cfif>
        <cfcatch type="any"> 
            <cfset local.success = "false">
        </cfcatch>
        </cftry>
        <cfreturn local.success>
    </cffunction>