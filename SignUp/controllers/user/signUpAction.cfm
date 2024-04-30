<cfscript>
variables.failedResult = '';
variables.successResult = '';
if(structKeyExists(form,"btnSubmit")){
    variables.objUser = createObject("component", "controllers/user/user");
    variables.validateUser = variables.objUser.validateUser(strPersonName=form.strPersonName, strUsername=form.strUsername, strPassword=form.strPassword, strConfirmPassword=form.strConfirmPassword, strRole=form.strRole);
    if(variables.validateUser.success){
        variables.checkUser = variables.objUser.checkUserExist(strUsername=form.strUsername, strRole=form.strRole);
        if(variables.checkUser.success){
            variables.failedResult = variables.checkUser.msg;
        }
        else{
            variables.addUser = variables.objUser.addUser(strPersonName=form.strPersonName, strUsername=form.strUsername, strPassword=form.strPassword, strConfirmPassword=form.strConfirmPassword, strRole=form.strRole);
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