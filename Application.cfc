<cfcomponent>    
    <cfset this.name = "Task"> 
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 0, 60)> 
    <cfset this.sessionManagement = true> 
    <cfset this.sessionTimeout = createTimeSpan(0, 2, 0, 0)> 
    <cfset this.datasource = "coldfusionDb">

    <cffunction name="onApplicationStart" returnType="void">
    </cffunction>

    <cffunction name="onSessionStart" returnType="boolean" output="false">
        <cfset session.sessVar = {}>
       
        <cfset session.userLoggedIn = false>
        <cfreturn true>
    </cffunction> 
</cfcomponent>
