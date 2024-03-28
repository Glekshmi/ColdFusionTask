<cfcomponent>
    <cffunction  name="readText" access="public" >
        <cfargument  name="sentence" required="true">        
        <cfset words = listToArray(#arguments.sentence#, " ")>
        <cfdump  var="#words#">
        <cfloop array="#words#" index="word">
            <cfquery name="insertData" result="fetchData">
                insert into WordsList(words)
                VALUES (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#word#">)
            </cfquery>
        </cfloop>
        <cfif fetchData.recordCount EQ 1>
            <cfoutput>
                <p>words are Successfully inserted to database</p>
            </cfoutput>
        <cfelse>
            <cfoutput>
                <p>Duplicate words have found</p>
            </cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>