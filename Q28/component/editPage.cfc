<cfcomponent>
    <cffunction  name="editPage" access="public" retunType="any">
        <cfargument  name="pageName" type="string">
        <cfargument  name="desc" type="string">
        <cfargument  name="pageId" type="string">
    
        <cfif arguments.pageId NEQ "">
        
            <cfquery name="updateResult" result="upResult">
                UPDATE PageTable SET 
                PageName=<cfqueryparam value="#arguments.pageName#" cfsqltype="CF_SQL_VARCHAR">,
                Description=<cfqueryparam value="#arguments.desc#" cfsqltype="CF_SQL_VARCHAR">
                WHERE PageId = <cfqueryparam value="#arguments.pageId#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfif upResult.recordCount EQ 1>
                <cflocation  url="adminPage.cfm">
            <cfelse>
                <cfoutput>
                    <p>kindly perform update action</p>
                </cfoutput>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>