<cfcomponent>
    <cffunction  name="checkAge" access="public" returnType="any">
        <cfargument  name="sonAge" required="true">
        <cfargument  name="momAge" required="true">
        <cfif arguments.sonAge NEQ "" && arguments.momAge NEQ "">
            <cfset sonDate = #arguments.sonAge#>
            <cfset momDate = #arguments.momAge#>
            <cfset sonAge = dateDiff("yyyy",sonDate,now())>
            <cfset momAge = dateDiff("yyyy",momDate,now())>
            <cfset deliveryAge = momAge - sonAge>
            <cfset getSonYr = year( sonDate )>
            <cfset replaceSonYr = DateFormat(Now(), "yyyy")>
            <cfset sonDay= datePart("m",sonDate)>
            <cfset sonMonth = datePart("d",sonDate)>
            <cfset sonCurDate = createDate(replaceSonYr,sonDay,sonMonth)>
            <cfset daysLeftForSon = dateDiff("d",dateFormat(now(),"yyyy-mm-dd"),sonCurDate)>
            <cfset getMomYr = year( momDate )>
            <cfset replaceMomYr = DateFormat(Now(), "yyyy")>
            <cfdump  var="#replaceMomYr#"><br>
            <cfset momDay= datePart("m",momDate)>
            <cfset momMonth = datePart("d",momDate)>
            <cfset momCurDate = createDate(replaceMomYr,momDay,momMonth)>
            <cfset daysLeftForMom = dateDiff("d",dateFormat(now(),"yyyy-mm-dd"),momCurDate)>
        </cfif>
    </cffunction>
</cfcomponent>