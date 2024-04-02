<cfcomponent>
    <cffunction  name="uploadFile" access="public" returnType="any">
        <cfargument  name="textFile" type="any" required="true">
        <cfset local.uploadDirectory = ExpandPath("./assets/uploads/")>
        <cfset local.uploadedFilePath = uploadDirectory&arguments.textFile>
        <cffile action="read" file="#uploadedFilePath#" variable="Birds">
        
        <cfset local.count = 0>
        <cfset local.wordList = []>
        <cfset local.wordList = Birds>
        <cfset local.separateWord = listToArray(wordList," ")>
        <cfloop array="#local.separateWord#" index="index">
            <cfset local.count++>
        </cfloop>
        <cfreturn local.count>
    </cffunction>
</cfcomponent>