<cfcomponent>
    
    <cffunction name="readText" access="public" returnType="string">
        <cfargument name="sentence" type="string" required="true">
        
        <cfquery>
            DELETE FROM wordList
        </cfquery>
        
        <cfif len(trim(arguments.sentence))>
            <cfset var word = listToArray(arguments.sentence, " ")>
            
            <cfloop array="#word#" index="word">
                <cfquery name="fetchData" >
                    SELECT word FROM wordList WHERE word = <cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">
                </cfquery>
                
                <cfif not fetchData.recordCount>
                    <cfquery>
                        INSERT INTO wordList (word) VALUES (<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">)
                    </cfquery>
                </cfif>
            </cfloop>
            
            <cfreturn "sentence has been successfully inserted">
        </cfif>
        
        <cfreturn "some error has occurred.">
    </cffunction>
    
    
    <cffunction name="checkWordsForCount" access="public" >
        <cfargument name="sentence" required="true">
        <cfset var wordCounts = {}>
        <cfset var words = reMatch("[a-zA-Z]+", arguments.sentence)>
        <cfloop array="#words#" index="word">
            <cfif len(trim(word)) GT 2 AND NOT isNumeric(word)>
                <cfset word = lcase(trim(word))>
                <cfif structKeyExists(wordCounts, word)>
                    <cfset wordCounts[word] = wordCounts[word] + 1>
                <cfelse>
                    <cfset wordCounts[word] = 1>
                </cfif>
            </cfif>
        </cfloop>
        
        <cfset var sortedData = structSort(wordCounts, "numeric", "desc")>
        
        <cfquery>
            DELETE FROM wordList
        </cfquery>
        
        <cfloop array="#sortedData#" index="word">
            <cfquery >
                INSERT INTO wordList (word) VALUES (
                    <cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
        </cfloop>
        
        <cfquery name="forDisplay">
            SELECT * FROM wordList ORDER BY len(word) DESC
        </cfquery>
        
        <cfset var result = []>
        <cfloop query="forDisplay">
            <cfset arrayAppend(result, {count = wordCounts[word], word = word})>
        </cfloop>
        <cfreturn result>
    </cffunction>
    
    
    <cffunction name="setColorToWords" access="public" returnType="array">
        <cfargument name="sentence" type="string" required="true">
        
        <cfset var wordCounts = {}>
        <cfset var words = reMatch("[a-zA-Z]+", arguments.sentence)>
        <cfloop array="#words#" index="word">
            <cfif len(trim(word)) GT 2 AND NOT isNumeric(word)>
                <cfset word = lcase(trim(word))>
                <cfif structKeyExists(wordCounts, word)>
                    <cfset wordCounts[word] = wordCounts[word] + 1>
                <cfelse>
                    <cfset wordCounts[word] = 1>
                </cfif>
            </cfif>
        </cfloop>
        
        <cfset var sortedData = structSort(wordCounts, "numeric", "desc")>
        
        <cfquery>
            DELETE FROM wordList
        </cfquery>
        
        <cfloop array="#sortedData#" index="word">
            <cfquery >
                INSERT INTO wordList (word) VALUES (
                    <cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
        </cfloop>
        
        <cfquery name="forDisplay">
            SELECT * FROM wordList ORDER BY len(word) DESC
        </cfquery>
        


        <cfset var result = []>
        <cfset var colors = ["blue", "green", "red", "cyan", "pink", "yellow"]>
        <cfset var minFontSize = 14>
        <cfset var colorIndex = 1>
        
        
        <cfloop query="displayResult">
            <cfif colorIndex gt arrayLen(colors)>
                <cfset colorIndex = 1>
            </cfif>
            <cfset var fontSize = minFontSize + (wordCounts[word] * 2)>
            <cfset arrayAppend(result, {word = word, fontSize = fontSize, color = colors[colorIndex]})>
            <cfset colorIndex = colorIndex + 1> 
        </cfloop>
        <cfdump var="#result#">
        <cfreturn result>

    </cffunction>

</cfcomponent>
