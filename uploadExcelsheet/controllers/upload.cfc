<cfcomponent>
    <cffunction name="validateUploadFile" access="remote" returntype="any">
        <cfargument name="excelFile" required="true" type="string">
        <cfset local.uploadDirectory = ExpandPath("./assets/uploads/")>
        <cffile action="upload"  destination="#local.uploadDirectory#" nameconflict="makeunique">
        <cfset local.uploadedFilePath = cffile.serverFile>
        <cfset local.path = local.uploadDirectory&cffile.serverFile>
        <cfspreadsheet action="read" src="#local.path#" query="spreadsheetData" headerrow="1">
        <!---<cfset local.errors = ''>--->

        <!---<cfloop query="spreadsheetData">--->
            <cfif structKeyExists(spreadsheetData, Name) AND structKeyExists(spreadsheetData, Place) AND structKeyExists(spreadsheetData, Age) AND structKeyExists(spreadsheetData, Address)>
                <cfreturn "The spreadsheet contain all the required fields">   
            <cfelse>
                 <cfreturn "The spreadsheet doesn't contain required fields">  
            </cfif>
                <!---<cfset local.errors &= "Expecting Name field">
            <cfelseif not isDefined(Place)>
                <cfset local.errors = "Expecting Place field">
            <cfelseif not isDefined(Age)>
                <cfset local.errors = "Expecting Age field">
            <cfelseif not isDefined(Address)>
                <cfset local.errors = "Expecting Address field">
            <cfelseif trim(Name) eq "">
                <cfset local.errors &=  "Name cannot be empty">
            <cfelseif trim(Place) eq "">
                <cfset local.errors &=  "Place cannot be empty">
            <cfelseif trim(Age) eq "">
                <cfset local.errors &=  "Age cannot be empty">
            <cfelseif trim(Address) eq "">
                <cfset local.errors &=  "Address cannot be empty">
            </cfif>--->
        
        <!---</cfloop>
        <cfif len(local.errors) EQ 0>
            <cfset local.errors = "true">
        <cfelse>
            <cfreturn local.errors>
        </cfif>
    </cffunction>
    <cffunction name="readUploadFile" access="remote" returntype="any">
        <cfargument name="excelFile" required="true" type="string">
        <cfset local.uploadDirectory = ExpandPath("./assets/uploads/")>
        <cffile action="upload"  destination="#local.uploadDirectory#" nameconflict="makeunique">
        <cfset local.uploadedFilePath = cffile.serverFile>
        <cfset local.path = local.uploadDirectory&cffile.serverFile>
        <cfspreadsheet action="read" src="#local.path#" name="spreadsheetData" format="html">
        <cfreturn spreadsheetData>--->
    </cffunction>
</cfcomponent>
