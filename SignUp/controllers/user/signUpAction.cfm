<cfset variables.failedResult = ''>
<cfset variables.successResult = ''>
<cfscript>

if(structKeyExists(form,"btnSubmit")){
    variables.objUser = createObject("component", "controllers/user/user");
    variables.validateUser = variables.objUser.validateUser(strPersonName,strUsername,strPassword,strConfirmPassword,strRole);
    if(variables.validateUser.success){
        variables.checkUser = variables.objUser.checkUserExist(strUsername,strRole);
        variables.checkUserResult=deserializeJSON(variables.checkUser);
        if(variables.checkUserResult.success){
            variables.failedResult = variables.checkUserResult.msg;
        }
        else{
            variables.addUser = variables.objUser.addUser(strPersonName,strUsername,strPassword,strConfirmPassword,strRole);
            variables.addUserResult=deserializeJSON(variables.addUser);
            if(variables.addUserResult.success){
                variables.successResult =  variables.addUserResult.msg;
            }
            else{
                variables.failedResult =  variables.addUserResult.msg;
            }
        }
    }
    else{
        variables.failedResult =  variables.validateUser.msg;
    }
}
</cfscript>