<cfcomponent>
    <cffunction  name="deletePage" access="remote" retunType="any">
        <cfargument  name="pageId" type="string">
    
        <cfif arguments.pageId NEQ "">
        
            <cfquery name="deleteResult" result="delResult">
                DELETE FROM PageTable
                WHERE PageId = <cfqueryparam value="#arguments.pageId#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfif delResult.recordCount EQ 1>
                <cflocation  url="../adminPage.cfm">
            <cfelse>
                <cfoutput>
                    <p>kindly perform delete action</p>
                </cfoutput>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>