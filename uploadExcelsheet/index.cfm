<cfscript>
    cfparam(name="url.action", default="upload", pattern="");

    switch(lcase(url.action)){
        case "upload":
            include "/controllers/uploadAction.cfm";
            include "/views/uploadExcel.cfm";
        break;

        // The provided event could not be matched.
        default:
           // throw( type="InvalidEvent" );
           //include "/views/signUp.cfm";
        break;
    }
</cfscript>