<cfcomponent>
    <cffunction  name="addPage" access="public" retunType="any">
        <cfargument  name="pageName" type="string">
        <cfargument  name="desc" type="string">
        <cfdump  var="#arguments#" >
        <cfif arguments.pageName NEQ "" AND arguments.desc NEQ "">
            <cfquery name="addNewPAge" result="insertResult">
                INSERT INTO PageTable(PageName,Description)
                VALUES(
                    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
                    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">
                );
            </cfquery>
            <cfif insertResult.recordCount EQ 1>
                <cflocation  url="adminPage.cfm">
            <cfelse>
                <cfoutput>
                    <p>Please perform insert action</p>
                </cfoutput>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>