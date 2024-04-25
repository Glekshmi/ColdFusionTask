<cfscript>
    cfparam(name="url.action", default="", pattern="");

    switch(lcase(url.action)){
        case "main":
            include "/controllers/main/mainAction.cfm";
            include "/views/main.cfm";
        break;

        // The provided event could not be matched.
        default:
           // throw( type="InvalidEvent" );
           include "/views/SignUp.cfm";
        break;
    }
</cfscript>