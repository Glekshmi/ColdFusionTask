<cfcomponent>

    <cffunction  name="savePage" access="remote" returnformat="json">
        <cfargument  name="pageId" required="true">
        <cfargument  name="pageName" required="true">
        <cfargument  name="pageDes" required="true">

        <cfset aplabetsOnly = "/^[A-Za-z]+$/">
        <cfset alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/">
        <cfset local.errors =''>
        <cfif arguments.pageName EQ ''>
            <cfset local.errors &= "page name field should not be empty"&"<br>">
        <cfelseif reFind("\d", arguments.pageName)>
            <cfset local.errors &= "page name should contain alphabets only"&"<br>">
        <cfelse>
            <cfset local.errors &= ''>
        </cfif>

        <cfif form.pageDes  EQ ''>
            <cfset local.errors &= "page description field should not be empty"&"<br>">
        <cfelseif isNumeric(arguments.pageDes)>
            <cfset local.errors &= "page description should not contain digits only"&"<br>">
        <cfelse>
            <cfset local.errors &= ''>
        </cfif>

        <cfif len(arguments.pageName) GT 5>
            <cfset local.errors &= "Exceeded maximum length"&"<br>">
        <cfelse>
            <cfset local.errors &= ''>
        </cfif>        

        <cfif local.errors EQ ''>
            <cfset variables.savePage=createObject("component","CFC/pages").savePage(arguments.pageName,arguments.pageDes,arguments.PageId)>
            <cfreturn {"success":"true","msg":"#variables.savePage#"}>
        <cfelse>
            <cfreturn {"success":"false","msg":"#local.errors#"}>
        </cfif>
    </cffunction>
</cfcomponent>
