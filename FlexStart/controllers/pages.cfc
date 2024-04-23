<cfcomponent>
<!---only local scope needed in this page--->
    <cffunction  name="savePage" access="remote" returnformat="json">
        <cfargument  name="pageId" required="true" type="string"><!---specify correct type expected--->
        <cfargument  name="pageName" required="true" type="string">
        <cfargument  name="pageDes" required="true" type="string">

        <cfset alphabetsOnly = "/^[A-Za-z]+$/"><!---spelling mistake--->
        <cfset alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/">
        <cfset local.errors =''>
        <cfif arguments.pageName EQ ''><!---check for string length--->
            <cfset local.errors &= "page name field should not be empty"&"<br>">
        <cfelseif reFind("\d", arguments.pageName)>
            <cfset local.errors &= "page name should contain alphabets only"&"<br>">
        <cfelse>
            <cfset local.errors &= ''>
        </cfif>

        <cfif form.pageDes  EQ ''><!---use correct variable name--->
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
