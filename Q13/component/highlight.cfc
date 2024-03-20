<cfcomponent>
    <cffunction  name="getWord" access="public" returnType="any">
        <cfargument  name="keyword" type="string" required="true">
        <cfset checkWord = "the quick brown fox jumps over the lazy dog">
        <cfif arguments.keyword NEQ "">
            <cfset count = 0>
            <cfset result = []>
            <cfset wordList = []>
            <cfset wordList = checkWord>
            <cfset separateWord = listToArray(wordList," ")>
            <cfloop array="#separateWord#" index="index">
                <cfif index EQ arguments.keyword>
                    <cfset arrayAppend(result, index)>
                    <cfset count++>
                </cfif>
            </cfloop>
        </cfif>
        <cfreturn count>
    </cffunction>
</cfcomponent>
