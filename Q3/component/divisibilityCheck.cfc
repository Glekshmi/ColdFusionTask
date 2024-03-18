<cfcomponent>
    <cffunction  name="readNum" access="public" returnType="any">
        <cfargument  name="numInput" type="string" reqired="true">
        <cfif arguments.numInput NEQ "">
            <cfset numList = listToArray(arguments.numInput)>
            <cfset result = []>
            <cfloop index="i" from="1" to="#arrayLen(numList)#">
                <cfif numList[i] mod 3 EQ 0>
                    <cfset arrayAppend(result, numList[i])>
                </cfif>
            </cfloop>
            <cfset resultList = arrayToList(result)>
            <cfreturn resultList>
        </cfif>
    </cffunction>
</cfcomponent>
 