<cfcomponent>
    <cffunction  name="checkLogin" access="public">
        <cfargument  name="userName" type="string">
        <cfargument  name="password" type="string">
        <cfif arguments.userName NEQ "" AND arguments.password NEQ "">
            <cfquery name="fetchLog">
                SELECT Username, Password, Role
                FROM UserTables
                WHERE UserName = <cfqueryparam value="#arguments.userName#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfquery name="fetchPage">
                SELECT * FROM PageTable;
            </cfquery>
            <!---<cfdump  var="#fetchLog#">--->
            <cfif fetchLog.recordCount GT 0>
                <!---<cfdump  var="#fetchLog.recordCount#">--->
                <cfset userRole = fetchLog.Role>
                <!---<cfdump  var="#userRole#">--->
                <cfswitch expression="#userRole#">
                <cfcase value="admin">
                    <cflocation  url="adminPage.cfm?">
                </cfcase>
                <cfcase value="editor">
                    <cflocation  url="adminPage.cfm?">
                </cfcase>
                <cfcase value="user">
                    <cflocation  url="userPage.cfm?">
                </cfcase>
                </cfswitch>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>