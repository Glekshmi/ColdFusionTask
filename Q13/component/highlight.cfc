<cfcomponent>
    <cffunction  name="getWord" access="public" returnType="any">
        <cfargument  name="keyword" type="string" required="true">
        <cfset local.checkWord = "the quick brown fox jumps over the lazy dog">
        <cfif arguments.keyword NEQ "">
            <cfset local.count = 0>
            <cfset local.result = []>
            <cfset local.wordList = []>
            <cfset local.wordList = checkWord>
            <cfset local.separateWord = listToArray(local.wordList," ")>
            <cfloop array="#local.separateWord#" index="index">
                <cfif index EQ arguments.keyword>
                    <cfset arrayAppend(local.result, index)>
                    <cfset local.count++>
                </cfif>
            </cfloop>
        </cfif>
        <cfreturn local.count>
    </cffunction>
</cfcomponent>
