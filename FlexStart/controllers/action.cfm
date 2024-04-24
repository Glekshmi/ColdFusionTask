<cfset variables.PageId=0>
<cfset variables.PageName=''>
<cfset variables.Description=''>
<cfset variables.errors =''>
<cfset variables.savePage = ''>


<cfif structKeyExists(url,"pageId") AND url.pageId GT 0>
    <cfset variables.qryPageDetails=createObject("component","CFC/pages").getPageDetails(url.pageId)>
    <cfset variables.PageId=url.pageId>
    <cfset variables.PageName=variables.qryPageDetails.PageName>
    <cfset variables.Description=variables.qryPageDetails.Description>
</cfif>
