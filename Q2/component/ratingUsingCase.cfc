<cfcomponent>
    <cffunction  name="readNum" access="public" returnType="string">
        <cfargument  name="numInput" type="numeric" required="true">
        <cfswitch expression="#arguments.numInput#">
            <cfcase value="5">
                <cfreturn "Very Good">
            </cfcase>
            <cfcase value="4">
                <cfreturn "Good">
            </cfcase>
            <cfcase value="3">
                <cfreturn "Fair">
            </cfcase>
            <cfdefaultcase>
                <cfreturn "Ok">
            </cfdefaultcase>
        </cfswitch>
    </cffunction>
</cfcomponent>