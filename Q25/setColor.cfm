<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <h1>Word count</h1>

    <form action=""  method="post">
        <label name="sentence">Enter a sentence</label>
        <input type="text" name="sentence"><br><br>
        <input type="submit" name="submit" value="Submit" >
    </form>

    <cfif structKeyExists(form, "sentence")>
    <cfinvoke  method="setColorToWords" component="component/tagCloud" returnVariable="result">
        <cfinvokeargument  name="sentence"  value="#form.sentence#">
    </cfinvoke>
    <cfoutput>
        <cfif arrayLen(result)>
            <ul>
                <cfloop array="#result#" index="wordStruct">
                    <p style="font-size:#wordStruct.fontSize#px; color:#wordStruct.color#;">#wordStruct.word#</p>
                </cfloop>
            </ul>            
        </cfif>
    </cfoutput>
    
    </cfif>
</body>
</html>