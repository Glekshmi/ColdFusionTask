<cfcomponent>
    <cffunction  name="uploadFile" access="public" returnType="any">
        <cfargument  name="textFile" type="any" required="true">
        <cfset uploadDirectory = ExpandPath("./assets/uploads/")>
        <cfset uploadedFilePath = uploadDirectory&arguments.textFile>
        <cffile action="read" file="#uploadedFilePath#" variable="Birds">
        
        <cfset count = 0>
        <cfset wordList = []>
        <cfset wordList = Birds>
        <cfset separateWord = listToArray(wordList," ")>
        <cfloop array="#separateWord#" index="index">
            <cfset count++>
        </cfloop>
        <cfreturn count>
    </cffunction>
</cfcomponent>