<cfset variables.PageId=0>
<cfset variables.PageName=''>
<cfset variables.Description=''>
<cfset variables.errors =''>
<cfif structKeyExists(url,"idPage") AND url.idPage GT 0>
    <cfset variables.editPage=createObject("component","controls/pages").editPage(url.idPage)>
    <cfset variables.PageId=url.idPage>
    <cfset variables.PageName=editPage.pageName>
    <cfset variables.Description=editPage.Description>
</cfif>

<cfif structKeyExists(form,"submit")>
    <cfif structKeyExists(form,"PageId") AND isNumeric(form.PageId)>
        <cfif structKeyExists(form,"pageName") AND structKeyExists(form,"pageDes")>
           
            <cfset specialChars = "[]{}<>()!@|%&;:,.?/*-_+=">
            <cfif form.pageName EQ " ">
                <cfset variables.errors &= "page name field should not be empty"><br>
            <cfelseif IsValid("string",form.pageName)>
                <cfset variables.errors &= "page name should contain alphabets only"><br>
                <cfdump  var="#variables.errors#" >
            <cfelse>
                <cfset variables.errors &= ''>
            </cfif>

            <!---<cfif form.pageName eq "">
                <cfset variables.errors &= "Page name field should not be empty"><br>
            <cfelseif NOT isValid("regex", form.pageName, "^[a-zA-Z]+$")>
                <cfset variables.errors &= "Page name should contain alphabets only"><br>
            <cfelseif reFind("[#specialChars#]", form.pageName)>
                <cfset variables.errors &= "Page name should not contain any special characters"><br>
            <cfelse>
                <cfset variables.errors &= "">
            </cfif>--->


            <!---</cfloop>--->
            <cfif form.pageDes  EQ ''>
                <cfset variables.errors &= "page description field should not be empty"&"<br>">
            <cfelseif NOT isValid("regex",form.pageDes,alphaNumeric)>
                <cfset variables.errors &= "page description should not contain digits only"&"<br>">
            <cfelse>
                <cfset variables.errors &= ''>
            </cfif>
            <!---<cfdump  var="#pageName#">

            <cfset nameList = []>
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
            </cfif>--->

        </cfif>
     </cfif>

        <cfif variables.errors EQ ''>
            <cfif structKeyExists(form,"pageName")>
                <cfset variables.savePage=createObject("component","controls/pages").savePage(form.pageName,form.pageDes,form.PageId)>
                <cfoutput>
                    <p>#variables.savePage#</p>
                </cfoutput>
            </cfif>
        </cfif>
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/user.css">
    <link rel="stylesheet" href="./style/login.css">
    <title>Document</title>
    <!--<script src="./script/validation.js"></script>-->
</head>
<body>
    <div class="adminSection">
        <div class="adminHeader">
            <h3>ADD/EDIT PAGE</h3>
        </div>
        
        <cfoutput>
        <p id="nameError"style="color:red;">#variables.errors#</p>
            <div class="adminBody">
                <form action="" method="post" onsubmit="return validation()">
                    <lable>Enter Page Name : </label>
                    <input type="hidden" name="PageId" value="#variables.PageId#">
                    <input type="text" name="pageName" id="pageName" value="#variables.PageName#"></br><br>
                    <!---<p id="nameError"style="color:red;">#variables.errors#</p>--->
                    <label>Enter Description : </label>
                    <textarea name="pageDes" id="pageDes">#variables.Description#</textarea><br> <br>
                    <!---<p id="descriptionError"style="color:red;">#variables.errors#</p>--->
                    <input type="submit" value="Submit" name="submit">
                </form>
                <button type="button"><a href="adminPage.cfm">Back</a></button>
            </div>
        </cfoutput>
    </div>
</body>
</html>