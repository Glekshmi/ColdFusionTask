<cfscript>
variables.failedResult = '';
variables.successResult = '';
variables.strPersonName = '';
variables.strUsername = '';
variables.strRole = '';

if(structKeyExists(form,"btnSubmit")){
    variables.strPersonName = form.strPersonName;
    variables.strUsername = form.strUsername;
    variables.strPassword = form.strPassword;
    variables.strConfirmPassword = form.strConfirmPassword;
    variables.strRole = form.strRole;
    
    variables.objUser = createObject("component", "controllers/user/user");
    variables.validateUser = variables.objUser.validateUser(strPersonName=variables.strPersonName, strUsername=variables.strUsername, strPassword=variables.strPassword, strConfirmPassword=variables.strConfirmPassword, strRole=variables.strRole);
    if(variables.validateUser.success){
        variables.checkUser = variables.objUser.checkUserExist(strUsername=variables.strUsername, strRole=variables.strRole);
        
        if(variables.checkUser.success){
            variables.failedResult = variables.checkUser.msg;
        }
        else{
            variables.addUser = variables.objUser.addUser(strPersonName=variables.strPersonName, strUsername=variables.strUsername, strPassword=variables.strPassword, strRole=variables.strRole);
            if(variables.addUser.success){
                variables.strPersonName = '';
                variables.strUsername = '';
                variables.strRole = '';
                variables.successResult = variables.addUser.msg;
            }
            else{
                variables.failedResult = variables.addUser.msg;
            }
        }
    }
    else{
        variables.failedResult = variables.validateUser.msg;
    }
    
}

</cfscript>