<cfcomponent>
    <cffunction  name="insertData" access="remote" returnType="">
    <cfargument  name="jobRole" required="true">
    <cfargument  name="relocation" required="true">
    <cfargument  name="month" required="true">
    <cfargument  name="day" required="true">
    <cfargument  name="year" required="true">
    <cfargument  name="portfolio" required="true">
    <cfargument  name="fileUpload" required="true">
    <cfargument  name="dollars" required="true">
    <cfargument  name="cents" required="true">
    <cfargument  name="firstName" required="true">
    <cfargument  name="lastName" required="true">
    <cfargument  name="email" required="true">
    <cfargument  name="firstPhn" required="true">
    <cfargument  name="midPhn" required="true">
    <cfargument  name="lastPhn" required="true">

    <!---<cfdump  var="#arguments.fileUpload#">--->

    <!---joining dates--->
    <cfset dateDay = insert("/", #arguments.day#, 0)>
    <cfset dateMonth = insert(#arguments.month#, dateDay, 0)>
    <cfset dateYear = insert("/", dateMonth, 0)>
    <cfset finalDate = insert(#arguments.year#, dateYear, 0)>
    
    <!---joining salary--->
    <cfset cent = insert(".", #arguments.cents#, 0)>
    <cfset dollar = insert(#arguments.dollars#, cent, 0)>

    <!---joining phone number--->
    <cfset firstPh = insert(#arguments.midPhn#, #arguments.lastPhn#, 0)>
    <cfset finalPhn = insert(#arguments.firstPhn#, firstPh, 0)>
    
    <!---file handling--->
    <cffile action="upload" filefield="fileUpload" destination="#ExpandPath("./assets/uploads/")#"  nameconflict="makeunique">
    <cfset uploadedFilePath = cffile.serverFile>
    <cfdump  var="#uploadedFilePath#" abort>
    <cfset uploadDirectory = ExpandPath("./assets/uploads/")>
    <cfset requiredFilePath = uploadDirectory&arguments.file>
    <cfdump  var="#requiredFilePath#" ><br>

    <!---<cfif len(trim(arguments.fileUpload))>
        <cffile action="upload"
            fileField="#arguments.fileUpload#"
            destination="C:/ColdFusion2023/cfusion/wwwroot/CF Task 10/ColdFusionTask/Q23/assets/uploads">
        <cfdump  var="#destination#" abort>
    </cfif>--->

    <!---<cfquery name="insertFormData" result="fetchTableData">
        INSERT INTO PageTable(PageName,Description)
        VALUES(
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.pageName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.desc#">
        );
    </cfquery>--->

    </cffunction>
</cfcomponent>