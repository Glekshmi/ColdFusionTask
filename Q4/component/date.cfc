<cfcomponent>
    <cffunction  name="showDate" access="public" returnType="any">
        <cfset curDate = #DateFormat(Now(), "dd/mm/yyyy")#>
        <cfset curMonth = month(curDate)>
        <cfset monthName = DateFormat(Now(), "mmmm")>
        <cfset monthEndDate = daysInMonth(curDate)&"/"&dateFormat(now(),"mm/yyyy")>
        <!---<cfdump  var="#monthEndDate#">--->
        <cfset weekDay = dayOfWeek(monthEndDate)>
        <!---<cfdump  var="#weekDay#">--->
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
        
        <cfset dayCount = DateFormat(monthEndDate, "dd")>
        <!---<cfset copyDayCount = DateFormat(monthEndDate, "dd")>--->
        
        <cfset friday=6>
        <cfloop index="i" from="#dayCount#" to="1" step="-1">
            <cfset lastFriCheck=i&"/"&DateFormat(now(),"mm/yyyy")>
            <cfif Dayofweek(lastFriCheck) Eq friday>
                <cfset lastFriday="#lastFriCheck#">
                <cfbreak>
            </cfif>
        </cfloop>
        
        <cfoutput>
            <p>Today's date : #curDate#</p>
            <p>Current Month in numeric: #curMonth#</p>
            <p>Current month in word: #monthName#</p>
            <p>Last friday date: #lastFriday#</p>
            <p>Last day of month: #curDay#</p>
        </cfoutput>

        <cfset lastDayCount = 0>
        <cfset copyCurDate = DateFormat(monthEndDate, "dd")>
        <cfloop index="i" from="#copyCurDate#" to="1" step="-1">
            <cfset curFiveDates=i&"/"&DateFormat(now(),"mm/yyyy")>
            <cfset printLastDates = DateFormat(#curFiveDates#,"dd-mmm-yyyy")>
            <cfset weekDayName = Dayofweek(curFiveDates)>
            
            <cfif weekDayName EQ "1">
                <cfoutput>
                    <p style="color:red;">#printLastDates #Sunday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "2">
                <cfoutput>
                    <p style="color:green;">#printLastDates #Monday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "3">
                <cfoutput>
                    <p style="color:orange;">#printLastDates #Tuesday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "4">
                <cfoutput>
                    <p style="color:yellow;">#printLastDates #Wednesday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "5">
                <cfoutput>
                    <p style="color:black;">#printLastDates #Thursday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "6">
                <cfoutput>
                    <p style="color:blue;">#printLastDates #Friday</p>
                </cfoutput>
            <cfelseif weekDayName EQ "7">
                <cfoutput>
                    <p style="color:rgb(92, 3, 3);">#printLastDates #Saturday</p>
                </cfoutput>
            </cfif>
            
            <cfif lastDayCount EQ 4>
                <cfbreak>
            <cfelse>
                <cfset lastDayCount++>
            </cfif>
        </cfloop>

    </cffunction>
</cfcomponent>
