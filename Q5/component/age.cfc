<cfcomponent>
    <cffunction  name="checkAge" access="public" returnType="struct">
        <cfargument  name="sonAge" required="true">
        <cfargument  name="momAge" required="true">
        <cfif arguments.sonAge NEQ "" && arguments.momAge NEQ "">
            <cfset dateStruct = {}>
            <cfset local.sonDate = #arguments.sonAge#>
            <cfset local.momDate = #arguments.momAge#>
            <cfset local.sonAge = dateDiff("yyyy",sonDate,now())>
            <cfset dateStruct.sonAge=sonAge>
            <cfset local.momAge = dateDiff("yyyy",momDate,now())>
            <cfset local.deliveryAge = momAge - sonAge>
            <cfset dateStruct.deliveryAge=deliveryAge>
            <cfset local.getSonYr = year( sonDate )>
            <cfset local.replaceSonYr = DateFormat(Now(), "yyyy")>
            <cfset local.sonDay= datePart("m",sonDate)>
            <cfset local.sonMonth = datePart("d",sonDate)>
            <cfset local.sonCurDate = createDate(replaceSonYr,sonDay,sonMonth)>
            <cfset local.daysLeftForSon = dateDiff("d",dateFormat(now(),"yyyy-mm-dd"),sonCurDate)>
            <cfset dateStruct.daysLeftForSon=daysLeftForSon>
            <cfset local.getMomYr = year( momDate )>
            <cfset local.replaceMomYr = DateFormat(Now(), "yyyy")>
            <cfset local.momDay= datePart("m",momDate)>
            <cfset local.momMonth = datePart("d",momDate)>
            <cfset local.momCurDate = createDate(replaceMomYr,momDay,momMonth)>
            <cfset local.daysLeftForMom = dateDiff("d",dateFormat(now(),"yyyy-mm-dd"),momCurDate)>
            <cfset dateStruct.daysLeftForMom=daysLeftForMom>
        </cfif>
        <cfreturn dateStruct>
    </cffunction>
</cfcomponent>