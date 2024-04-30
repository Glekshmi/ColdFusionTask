<cfset variables.failedResult = ''>
<cfset variables.successResult = ''>
<cfscript>
if(structKeyExists(form,"btnSubmit")){
    variables.objUser = createObject("component", "controllers/user/user");
    variables.validateUser = variables.objUser.validateUser(strPersonName=strPersonName,strUsername=strUsername,strPassword=strPassword,strConfirmPassword=strConfirmPassword,strRole=strRole);
    if(variables.validateUser.success){
        variables.checkUser = variables.objUser.checkUserExist(strUsername=strUsername,strRole=strRole);
        variables.checkUserResult=deserializeJSON(variables.checkUser);
        if(variables.checkUserResult.success){
            variables.failedResult = variables.checkUserResult.msg;
        }
        else{
            variables.addUser = variables.objUser.addUser(strPersonName=strPersonName,strUsername=strUsername,strPassword=strPassword,strConfirmPassword=strConfirmPassword,strRole=strRole);
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