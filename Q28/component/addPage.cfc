<cfcomponent>
    <cffunction  name="addPage" access="public" retunType="any">
        <cfargument  name="pageName" type="string">
        <cfargument  name="desc" type="string">
        <cfdump  var="#arguments#" >
        <cfif arguments.pageName NEQ "" AND arguments.desc NEQ "">
            <cfquery name="addNewPAge">
                INSERT INTO PageTable(PageName,Description)
                VALUES(
                    <cfqueryparam  value="#arguments.pageName#" cfsqltype="CF_SQL_VARCHAR">
                    <cfqueryparam  value="#arguments.desc#" cfsqltype="CF_SQL_VARCHAR">
                );
            </cfquery>
            <cfdump  var="#addNewPAge#">
        </cfif>
    </cffunction>
</cfcomponent>