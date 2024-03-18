<cfcomponent>
    <cffunction  name="showDate" access="public" returnType="any">
        <cfset curDate = #DateFormat(Now(), "dd/mm/yyyy")#>
        <cfset curMonth = month(curDate)>
        <cfset monthName = DateFormat(Now(), "mmmm")>
        <cfset monthEndDate = daysInMonth(curDate)&"/"&dateFormat(now(),"mm/yyyy")>
        <cfset weekDay = dayOfWeek(monthEndDate)>
        
        <cfswitch expression="#weekDay#">
            <cfcase value="1">
                <cfset curDay="Sunday">
            </cfcase>
            <cfcase value="2">
                <cfset curDay="Monday">
            </cfcase>
            <cfcase value="3">
                <cfset curDay="Tuesday">
            </cfcase>
            <cfcase value="4">
                <cfset curDay="Wednesday">
            </cfcase>
            <cfcase value="5">
                <cfset curDay="Thursday">
            </cfcase>
            <cfcase value="6">
                <cfset curDay="Friday">
            </cfcase>
            <cfcase value="7">
                <cfset curDay="Saturday">
            </cfcase>
            <cfdefaultcase>
                <cfset curDay="invalid month">
            </cfdefaultcase>
        </cfswitch>
        <cfoutput>
            <p>Today's date : #curDate#</p>
            <p>Current Month in numeric: #curMonth#</p>
            <p>Current month in word: #monthName#</p>
            <p>Last friday date: </p>
            <p>Last day of month: #curDay#</p>
        </cfoutput>
        <cfset dayCount = DateFormat(monthEndDate, "dd")>
        <!---<cfloop inde="i" from="1" to="dayCount">

        </cfloop>--->
    </cffunction>
</cfcomponent>