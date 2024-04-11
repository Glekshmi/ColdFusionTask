<cfcomponent>
    <cffunction  name="login" access="public">
        <cfif session.sessVar EQ true>
            <cflocation  url="adminPage.cfm">
        </cfif>
    </cffunction>

    <cffunction name="doLogin" access="public">
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
            <cfif checkRole.role NEQ "">
                <cfset session.userRole = checkRole.role>
                <cflocation url="adminPage.cfm">
            <cfelse>
                <cfreturn "Role doesn't exists">
            </cfif>
        <cfelse>
            <cfreturn "Username or password doesn't match">
        </cfif>
    </cffunction>

    <cffunction name="displayPage" access="remote">
        <cfquery name="forDisplay">
            select * from PageTable;
        </cfquery>
        <cfset session.sessVar = true>
        <cfif session.sessVar>
            <cfreturn forDisplay>
        <cfelse>
            <cflocation  url="login.cfm">
        </cfif>
    </cffunction>

    <cffunction  name="logout" access="remote">
        <cfset structDelete(session, "sessVar")>
        <cfset session.sessVar=false>
        <cflocation  url="../login.cfm">
    </cffunction>

    <!---add/edit begins--->
    <cffunction name="editPage" access="remote">
        <cfargument name="idPage" required="true">
        <cfquery name="check">
            select PageName,Description from PageTable 
            where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset pageId = #arguments.idPage#>
        <cfif check.recordCount EQ 1>
            <cfreturn check>
        <cfelse>
            <cfreturn "">
        </cfif>
    </cffunction>

    <cffunction name="savePage" access="remote" retrunType="string">
            <cfargument name="pageName" required="true">
            <cfargument name="pageDes" required="true">
            <cfargument name="pageId" required="true">
            <cfif arguments.pageId GT 0>
                <cfquery name="updatePage">
                    update PageTable set PageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                    Description=<cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                    where pageId=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfreturn "page is updated"> 
            <cfelse>
                <cfquery name="pageCheck">
                    select 1 from PageTable
                    where PageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">
                </cfquery>
                <cfif pageCheck.recordCount>
                    <cfreturn "page is already present" >
                <cfelse>
                    <cfquery name="insertPage">
                        insert into PageTable (PageName,Description)
                        values(
                            <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                        )
                    </cfquery>
                    <cfreturn "inserted new page">
                </cfif>
            </cfif>
        </cffunction>
    
    <!---add/edit ends--->

    <cffunction name="deleteRow" access="remote">
        <cfargument name="idPage" required="true">
        <cfquery name="delete">
            delete from PageTable
            where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cflocation url="../adminPAge.cfm">
    </cffunction>

    <!---<cffunction name="containsSpecialChars" returntype="boolean" output="false">
    <cfargument name="string" type="string" required="true">
    <cfargument name="specialChars" type="string" required="true">
    
    <cfset var i = "">
    
    <cfloop index="i" from="1" to="#len(string)#">
        <cfif listFind(specialChars, mid(string, i, 1))>
            <cfreturn true>
        </cfif>
    </cfloop>
    
    <cfreturn false>
</cffunction>--->

</cfcomponent>
