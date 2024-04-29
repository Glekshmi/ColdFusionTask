<cfscript>
    cfparam(name="url.action", default="signUp", pattern="");

    switch(lcase(url.action)){
        case "signUp":
            include "/controllers/user/signUpAction.cfm";
            include "/views/signUp.cfm";
        break;

        // The provided event could not be matched.
        default:
           // throw( type="InvalidEvent" );
           //include "/views/signUp.cfm";
        break;
    }
</cfscript>