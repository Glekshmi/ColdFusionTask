<cfset variables.failedResult = ''>
<cfset variables.successResult = ''>
<cfscript>
if(structKeyExists(form,"btnSubmit")){
    variables.objUser = createObject("component", "controllers/user/user");
    variables.validateUser = variables.objUser.validateUser(strPersonName=strPersonName,strUsername=strUsername,strPassword=strPassword,strConfirmPassword=strConfirmPassword,strRole=strRole);
    if(variables.validateUser.success){
        variables.checkUser = variables.objUser.checkUserExist(strUsername=strUsername,strRole=strRole);
        if(variables.checkUser.success){
            variables.failedResult = variables.checkUser.msg;
        }
        else{
            variables.addUser = variables.objUser.addUser(strPersonName=strPersonName,strUsername=strUsername,strPassword=strPassword,strConfirmPassword=strConfirmPassword,strRole=strRole);
            if(variables.addUser.success){
                variables.successResult =  variables.addUser.msg;
            }
            else{
                variables.failedResult =  variables.addUser.msg;
            }
        }
    }
    else{
        variables.failedResult =  variables.validateUser.msg;
    }
}
</cfscript>