<cfcomponent>
    <cffunction name="checkUserLogin" access="remote" returntype="query">
        <cfargument  name="strUserName" required="true">
        <cfargument  name="strPassword" required="true">
        <cfquery name="qrycheckLogin">
            select UserId, UserName,Name, Password, Role from UserTables
            where UserName=<cfqueryparam value="#arguments.strUserName#" cfsqltype="cf_sql_varchar">
            AND Password=<cfqueryparam value="#arguments.strPassword#" cfsqltype="cf_sql_varchar"> 
        </cfquery>
        <cfreturn qrycheckLogin>
    </cffunction>

    <cffunction name="checkPageExist" access="remote" returntype="boolean">
        <cfargument name="strPageName" required="true">
        <cfargument name="intPageId" required="true">

        <cfquery name="qryCheckPageExist">
            select PageName from PageTable
            where PageName = <cfqueryparam value="#arguments.strPageName#" cfsqltype="cf_sql_varchar"> 
            AND PageId != <cfqueryparam value="#arguments.intPageId#" cfsqltype="cf_sql_integer"> 
        </cfquery>   
        <cfif qryCheckPageExist.recordCount>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

    <cffunction name="savePage" access="remote" returntype="string">
        <cfargument name="strPageName" required="true">
        <cfargument name="strPageDes" required="true">
        <cfargument name="intPageId" required="true">
        <cfif arguments.intPageId GT 0>
            <cfquery name="updatePage" result="up"> 
                update PageTable set PageName=<cfqueryparam value="#arguments.strPageName#" cfsqltype="cf_sql_varchar">,
                Description=<cfqueryparam value="#arguments.strPageDes#" cfsqltype="cf_sql_varchar">
                where PageId=<cfqueryparam value="#arguments.intPageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn "page is updated successfully">
        <cfelse>
            <cfquery name="insertPage" result="ins">
                insert into PageTable (PageName,Description)
                values(
                    <cfqueryparam value="#arguments.strPageName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.strPageDes#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfreturn "new page is inserted successfully">
        </cfif>
    </cffunction>

    <cffunction name="getPageDetails" access="remote" returntype="query">
        <cfargument name="intPageId" required="true" default="0">
        <cfquery name="qryGetPageDetails">
            select PageId,PageName,Description from PageTable
            <cfif arguments.intPageId GT 0>
                where PageId =<cfqueryparam value="#arguments.intPageId#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfreturn qryGetPageDetails>
    </cffunction>

    <cffunction name="deletePage" access="remote" returnformat="json">
        <cfargument name="intPageId" required="true">
        <cfquery name="delete" result="delResult">
            delete from PageTable
            where PageId=<cfqueryparam value="#arguments.intPageId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif delResult.recordCount>
            <cfreturn {"success":"true","msg":"page is deleted!"}>
        <cfelse>
            <cfreturn {"success":"false","msg":"page is unavailable!"}>
        </cfif>
    </cffunction>

    
</cfcomponent>
