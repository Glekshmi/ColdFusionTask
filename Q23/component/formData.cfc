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

    <!---joining dates--->
    <cfset DOB = year&"/"&month&"/"&day>

    <!---joining salary--->
    <cfset salary = dollars&"."&cents>
    
    <!---joining phone number--->
    <cfset phone = firstPhn&midPhn&lastPhn>
    
    <!---file handling--->
    <cffile action="upload" filefield="fileUpload" destination="#ExpandPath("../assets/uploads/")#"  nameconflict="makeunique">
    <cfset uploadedFilePath = cffile.serverFile>
    

    <cfquery name="insertFormData" result="fetchTableData">
        INSERT INTO Employee(JobRole,Relocation,Dates,Portfolio,UploadedFileName,Salary,FirstName,LastName,Email,PhoneNumber)
        VALUES(
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#jobRole#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#relocation#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#DOB#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#portfolio#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#uploadedFilePath#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#salary#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#firstName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#lastName#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#email#">,
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#phone#">
        );
    </cfquery>


    
    <cfif fetchTableData.recordCount EQ 1>
        <cflocation  url="../success.cfm">
    </cfif>
    
    </cffunction>
</cfcomponent>