<cfcomponent>
    <cffunction  name="showDate" access="public" returnType="any">
        <cfset dateStruct = {}>
        <cfset local.curDate = #DateFormat(Now(), "dd/mm/yyyy")#>
        <cfset dateStruct.curDate = curDate>
        <cfset local.curMonth = month(now())>
        <cfset dateStruct.curMonth = curMonth>
        <cfset local.monthName = DateFormat(Now(), "mmmm")>
        <cfset dateStruct.monthName = monthName>
        <cfset local.monthEndDate = daysInMonth(now())&"/"&dateFormat(now(),"mm/yyyy")>
        <cfset dateStruct.monthEndDate = monthEndDate>
        
        <cfset local.weekDay = dayOfWeek(now())>
        <cfswitch expression="#weekDay#">
            <cfcase value="1">
                <cfset local.curDay="Sunday">
            </cfcase>
            <cfcase value="2">
                <cfset local.curDay="Monday">
            </cfcase>
            <cfcase value="3">
                <cfset local.curDay="Tuesday">
            </cfcase>
            <cfcase value="4">
                <cfset local.curDay="Wednesday">
            </cfcase>
            <cfcase value="5">
                <cfset local.curDay="Thursday">
            </cfcase>
            <cfcase value="6">
                <cfset local.curDay="Friday">
            </cfcase>
            <cfcase value="7">
                <cfset local.curDay="Saturday">
            </cfcase>
            <cfdefaultcase>
                <cfset local.curDay="invalid month">
            </cfdefaultcase>
        </cfswitch>
        <cfset local.dayCount = DateFormat(monthEndDate, "dd")>
        
        <cfset local.friday=6>
        <cfloop index="i" from="#local.dayCount#" to="1" step="-1">
            <cfset local.lastFriCheck=i&"/"&DateFormat(now(),"mm/yyyy")>
            <cfif Dayofweek(local.lastFriCheck) Eq local.friday>
                <cfset local.lastFriday="#local.lastFriCheck#">
                <cfbreak>
            </cfif>
        </cfloop>
        <cfset dateStruct.lastFriday = lastFriday>
        <cfreturn dateStruct>
    </cffunction>
    <cffunction  name="retDaywithColor">
        <cfset local.lastDayCount = 0>
        <cfset local.dayColor=[]>
        <cfset local.monthEndDate = daysInMonth(now())&"/"&dateFormat(now(),"mm/yyyy")>
        <cfset local.copyCurDate = DateFormat(local.monthEndDate, "dd")>
        <cfloop index="i" from="#local.copyCurDate#" to="1" step="-1">
            <cfset local.curFiveDates=i&"/"&DateFormat(now(),"mm/yyyy")>
            <cfset local.weekDayName = Dayofweek(local.curFiveDates)>
            
            <cfif local.weekDayName EQ "1">
                <cfset local.colors="##ff0000">
                <cfset local.day="Sunday">
            <cfelseif local.weekDayName EQ "2">
                <cfset local.colors="##008000">
                <cfset local.day="Monday">
            <cfelseif local.weekDayName EQ "3">
                <cfset local.colors="##ffa500">
                <cfset local.day="Tuesday">
            <cfelseif local.weekDayName EQ "4">
                <cfset local.colors="##ffff00">
                <cfset local.day="Wednesday">
            <cfelseif local.weekDayName EQ "5">
                <cfset local.colors="##000000">
                <cfset local.day="Thursday">
            <cfelseif local.weekDayName EQ "6">
                <cfset local.colors="##0000ff">
                <cfset local.day="Friday ">
            <cfelseif local.weekDayName EQ "7">
                <cfset local.colors="##ff0000">
                    <cfset local.day="Saturday">
            </cfif>
            <cfset arrayAppend(local.dayColor, {date =local.curFiveDates, color = local.colors})>
            <cfif local.lastDayCount EQ 4>
                <cfbreak>
            <cfelse>
                <cfset local.lastDayCount++>
            </cfif>
        </cfloop>
        
        <cfreturn local.dayColor>
    </cffunction>
</cfcomponent>
