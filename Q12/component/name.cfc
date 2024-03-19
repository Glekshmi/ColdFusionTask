<cfcomponent>
    <cffunction  name="checkInput" access="public" returnType="any">
        <cfargument  name="numInput" type="numeric" required="true">
        <cfif arguments.numInput NEQ "">
            <cfquery name="fetchNames">
                SELECT * FROM nameTable;
            </cfquery>
        </cfif>
    </cffunction>
</cfcomponent>