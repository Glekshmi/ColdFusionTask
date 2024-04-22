<cfset variables.PageId=0>
<cfset variables.PageName=''>
<cfset variables.Description=''>
<cfset variables.errors =''>
<cfset variables.savePage = ''>


<cfif structKeyExists(url,"idPage") AND url.idPage GT 0>
    <cfset variables.editPage=createObject("component","CFC/pages").editPage(url.idPage)>
    <cfset variables.PageId=url.idPage>
    <cfset variables.PageName=editPage.pageName>
    <cfset variables.Description=editPage.Description>
</cfif>

<!----<cfif structKeyExists(form,"submit")>
    <cfif structKeyExists(form,"PageId") AND isNumeric(form.PageId)>
        <cfif structKeyExists(form,"pageName") AND structKeyExists(form,"pageDes")>

            <cfset variables.validatePageData=createObject("component","CFC_controllers/pages")>
            <cfset variables.result = variables.validatePageData.pageValidation()>--->
            <!---<cfdump  var="#variables.result#" abort>--->

            <!---<cfset aplabetsOnly = "/^[A-Za-z]+$/">
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
            </cfif>--->

            <!---<cfset nameList = []>
            <cfset symbols = "[,$,&,+,,,:,;,=,?,@,|,',<,>,.,-,^,*,(,),%,!,]">
            <cfset nameList = trim(form.pageName)>
            <cfset symbolList = symbols>
            <cfset pageNameArray = listToArray(nameList,"")>
            <cfif len(nameList) EQ 0>
                <cfset variables.errors &= "page name field should not be empty"> 
            <cfelse>
                <cfloop array="#pageNameArray#" index="i">
                    <cfif  IsValid("integer",i) OR listFind(symbols,i)>
                        <cfset variables.errors &= "page name should not contain digits">  
                        <cfbreak>
                    </cfif>
                </cfloop>
            </cfif>

             <cfif len(form.pageDes) EQ 0>
                <cfset variables.errors &= "page description field should not be empty"> 
            <cfelseif IsValid("integer",form.pageDes)>
                <cfset variables.errors &= "page name should not contain digits">  
            <cfelse>
                    <cfset variables.errors &= ''>
            </cfif>

        </cfif>
    </cfif>
    <cfif  variables.result EQ ''>
        <cfif structKeyExists(form,"pageName")>
            <cfset variables.savePage=createObject("component","CFC/pages").savePage(form.pageName,form.pageDes,form.PageId)>
        </cfif>
    </cfif>
</cfif>--->