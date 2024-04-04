<cfcomponent>
        <cffunction name="login" access="public">
            <cfargument name="userName" required="true">
            <cfargument name="password" required="true">
            
            <cfquery name="checkLogin" result="loginCheck">
                select * from UserTables
                where userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
                AND password=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"> 
            </cfquery>

            <cfset local.id = checkLogin.userId>
            <cfif checkLogin.recordCount>
                <cfquery name="checkRole">
                    select role from UserTables
                    where userId=<cfqueryparam value="#local.id#" cfsqltype="cf_sql_integer">
                </cfquery>

                <cfif checkRole.role EQ "admin" || checkRole.role EQ "editor">
                    <cflocation url="adminPage.cfm">
                <cfelseif checkRole.role EQ "user">
                    <cflocation url="userPage.cfm">
                <cfelse>
                    <cfreturn "Role doesn't exists">
                </cfif>
            <cfelse>
                    <cfreturn "Username or password doesn't exists">
            </cfif>
        </cffunction>


        <cffunction name="display" access="remote">
            <cfquery name="forDisplay">
                select * from PageTable;
            </cfquery>
            <cfreturn forDisplay>
        </cffunction>

       
        <cffunction name="addRow" access="remote">
            <cfargument name="pageName" required="true">
            <cfargument name="pageDes" required="true">
            <cfquery name="insertRow" result="insertResult">
                insert into PageTable (pageName,Description)
                values(
                    <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
        
            <cfif insertResult.recordCount EQ 1>
                <cflocation  url="adminPage.cfm">
            <cfelse>
                <cfreturn "Please perform insert action">
            </cfif>
        </cffunction>

       
        <cffunction name="viewData" access="remote">
            <cfargument name="idPage">
            <cfquery name="forDisplay">
                select * from PageTable
                where pageId =<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn forDisplay>
        </cffunction>

        
        <cffunction name="editRow" access="remote">
            <cfargument name="pageName" required="true">
            <cfargument name="pageDes" required="true">
            <cfargument name="idPage" required="true">
            <cfquery name="check">
                select * from PageTable 
                where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfif check.recordCount>
                <cfquery name="updatePage">
                    update PageTable set pageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                    Description=<cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                    where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cflocation  url="adminPage.cfm">
            <cfelse>
            </cfif>
        </cffunction>

        
        <cffunction name="deleteRow" access="remote">
            <cfargument name="idPage" required="true">
            <cfquery name="delete">
                delete from PageTable
                where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cflocation url="../adminPAge.cfm">
        </cffunction>
</cfcomponent>