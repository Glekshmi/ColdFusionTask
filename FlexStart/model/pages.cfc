<cfcomponent>
    <cffunction  name="login" access="public">
        <cfif session.sessVar EQ true>
            <cflocation  url="../view/adminHome.cfm">
        </cfif>
    </cffunction>

    <cffunction name="doLogin" access="remote" returntype="JSON" returnformat="JSON">
        <cfargument name="userName" required="true">
        <cfargument name="password" required="true">
        <cfquery name="checkLogin" result="loginCheck">
            select UserId, UserName, Password from UserTables
            where UserName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
            AND Password=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"> 
        </cfquery>
        <cfset local.id = checkLogin.UserId>
        <cfif checkLogin.recordCount>
            <cfquery name="checkRole">
                select Role from UserTables
                where UserId=<cfqueryparam value="#local.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset session.userRole = checkRole.Role>
            <cfif checkRole.Role EQ "admin" OR checkRole.Role EQ "editor" OR checkRole.Role EQ "user">
                <!---<cfset session.sessVar = true>--->
                <cfreturn {"message":"exists"}>
            <cfelse>
                <cfreturn {"message":"not exists"}>
            </cfif>
        </cfif>
    </cffunction>

    <cffunction name="displayPage" access="remote">
        <cfquery name="forDisplay">
            select PageId, PageName,Description from PageTable;
        </cfquery>
        <cfset session.sessVar = true>
        <cfif session.sessVar>
            <cfreturn forDisplay>
        <cfelse>
            <cflocation  url="../view/newLogin.cfm">
        </cfif>
    </cffunction>

    <cffunction  name="logout" access="remote">
        <cfset structDelete(session, "sessVar")>
        <cfset session.sessVar=false>
        <cflocation  url="../view/newLogin.cfm">
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

    <cffunction name="viewData" access="remote">
        <cfargument name="idPage">
        <cfquery name="forDisplay">
            select * from PageTable
            where pageId =<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn forDisplay>
    </cffunction>

    <cffunction name="deleteRow" access="remote">
        <cfargument name="idPage" required="true">
        <cfquery name="delete">
            delete from PageTable
            where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cflocation url="../view/adminPageView.cfm">
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
