<cfcomponent>
    <cffunction  name="login" access="public">
        <cfif session.sessVar EQ true><!---what is this variable? correct the variable name for readability--->
            <cflocation  url="../view/adminHome.cfm">
        </cfif>
    </cffunction>

    <cffunction name="doLogin" access="remote" returnformat="JSON"><!---only one query needed, align code properly--->
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
            </cfif>
        <cfelse>
                <cfreturn {"message":"not exists"}>
        </cfif>
    </cffunction>

    <cffunction name="displayPage" access="remote"><!---code is confusing--->
        <cfquery name="forDisplay">
            select PageId, PageName,Description from PageTable;
        </cfquery>
        <cfset session.sessVar = true><!---line 37 checks for variable set in line 36--->
        <cfif session.sessVar>
            <cfreturn forDisplay>
        <cfelse>
            <cflocation  url="../view/newLogin.cfm"><!---convert redirect to login to a function and use everywhere--->
        </cfif>
    </cffunction>

    <cffunction name="logout" access="remote">
        <cfset structDelete(session, "sessVar")><!---?--->
        <cfset session.sessVar=false><!--- why delete and then set?--->
        <cflocation  url="../view/newLogin.cfm"><!---use common redirect function--->
    </cffunction>

    <cffunction name="editPage" access="remote">
        <cfargument name="idPage" required="true" type="string"><!---the name should be pageID--->
        <cfquery name="check">
            select PageName,Description from PageTable 
            where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <!---<cfset pageId = #arguments.idPage#>--->
        <cfif check.recordCount EQ 1>
            <cfreturn check>
        <cfelse>
            <cfreturn "">
        </cfif>
    </cffunction>

    <cffunction name="checkPageExist" access="remote" returntype="boolean">
        <cfargument name="pageName" required="true">
        <cfargument name="pageId" required="true">

        <cfquery name="qryCheckPageExist">
            select PageName from PageTable
            where
            <!--- 1 = 
                case when PageName = <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar"> 
                        AND PageId = <cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
                        then 0
                    when PageName = <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">  
                        then 1
                    else 0
                end--->
            PageName = <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar"> 
            AND PageId != <cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer"> 
        </cfquery>   
        <cfif qryCheckPageExist.recordCount>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

    <cffunction name="savePage" access="remote" returntype="string">
        <cfargument name="pageName" required="true">
        <cfargument name="pageDes" required="true">
        <cfargument name="pageId" required="true">
        <cfif arguments.pageId GT 0>
            <cfquery name="updatePage" result="up"> 
                update PageTable set PageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                Description=<cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                where pageId=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn "page is updated successfully">
        <cfelse>
            <cfquery name="insertPage" result="ins">
                insert into PageTable (PageName,Description)
                values(
                    <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.pageDes#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <!---<cfdump  var="#ins#">
            <cfreturn {"success":"true","msg":"page is not present!"}>--->
            <cfreturn "new page is inserted successfully">
        </cfif>
    </cffunction>

    <cffunction name="viewPageNameAndDescription" access="remote" returntype="query">
        <cfargument name="idPage">
        <cfquery name="forDisplay">
            select PageName,Description from PageTable
            where pageId =<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn forDisplay>
    </cffunction>

    <cffunction name="deletePage" access="remote" returnformat="json">
        <cfargument name="idPage" required="true">
        <cfquery name="delete" result="delResult">
            delete from PageTable
            where pageId=<cfqueryparam value="#arguments.idPage#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif delResult.recordCount>
            <cfreturn {"success":"true","msg":"page is deleted!"}>
        <cfelse>
            <cfreturn {"success":"false","msg":"page is unavailable!"}>
        </cfif>
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
