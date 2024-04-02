<!DOCTYPE html>
<html>
<head>
    <title>Q4</title>
    <link href="../Q4/style/dayStyle.css">
</head>
<body>

    <p>Show below details in a page
Today's date, current Month in numeric, current month in word, Last friday date, Last day of month. Show Last 5 days date & day like below. 
Sunday should be red, 
Monday - green, 
Tuesday - orange, 
Wednesday - yellow, 
Thursday - bold black, 
Friday - blue, 
Saturday - bold red

02-Dec-2010 - Thursday
01-Dec-2010 - Wednesday
30-Nov-2010 - Tuesday
29-Dec-2010 - Monday
28-Dec-2010 - Sunday
</p>

    <form action="date.cfm" method="post">
        <input type="submit" name="submit" value="Show Date">
    </form>
    <cfif structKeyExists(form, "submit")>
        <cfset componentObject = createObject("component", "component/date")>
        <cfset result = componentObject.showDate()>
        <cfset lastFiveDays = componentObject.retDaywithColor()>
        <cfdump  var="#lastFiveDays#">
        <cfoutput>
            <p>Today's date : #result.curDate#</p>
            <p>Current Month in numeric : #result.curMonth#</p>
            <p>Current month in words : #result.monthName#</p>
            <p>Last friday date : #result.lastFriday#</p>
            <p>Last day of month : #result.monthEndDate#</p>
            <cfloop array="#lastFiveDays#" index="index">
                <p style="color:#index.color#;">#index.date#</p>
            </cfloop>
        </cfoutput>
    </cfif>
    
</body>
</html>