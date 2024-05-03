<cfcomponent>
    <cffunction name="checkUserExist" access="remote" returntype="boolean">
        <cfargument name="strUsername" required="true" type="string">
        <cfargument name="strRole" required="true" type="string">
        <cfquery name="qryCheckUserExist" dataSource="coldFusionDb">
            select UserName,Role from UserTables
            where UserName = <cfqueryparam value="#arguments.strUsername#" cfsqltype="cf_sql_varchar"> 
        </cfquery>   
        <cfif qryCheckUserExist.recordCount>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
    <cffunction name="addUser" access="remote" returntype="string">
        <cfargument name="strPersonName" required="true" type="string">
        <cfargument name="strUsername" required="true" type="string">
        <cfargument name="strPassword" required="true" type="string">
        <cfargument name="strRole" required="true" type="string">  
        <cfset local.encryptedPassword = Hash(#arguments.strPassword#, 'SHA-512')> 
        <cfset local.success = ''>
        <cftry>
            <cfquery name="qryAddUser" dataSource="coldFusionDb" result="addNewUser">
            insert into UserTables (UserName,Password,Role,Name)
            values(
                <cfqueryparam value="#arguments.strUsername#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#local.encryptedPassword#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strRole#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strPersonName#" cfsqltype="cf_sql_varchar">
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
</cfcomponent>