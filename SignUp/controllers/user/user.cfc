component{
    remote any function validateUser(strPersonName,strUsername,strPassword,strConfirmPassword,strRole) returnFormat="json"{
        local.strPersonName = strPersonName;
        local.strUsername = strUsername;
        local.strPassword = strPassword;
        local.strConfirmPassword = strConfirmPassword;
        local.strRole = strRole;
        local.errorMsg ='';
        if(len(local.strPersonName) EQ 0 || len(local.strUsername) EQ 0 || len(local.strPassword) EQ 0 || len(local.strConfirmPassword) EQ 0 || len(local.strRole) EQ 0){
            local.errorMsg &= "All fields are required!!!";
        }
        else if(reFind("\d", local.strPersonName)){
            local.errorMsg &= "Person name should contain alphabets only!!!";
        }
        else if(reFind("\d", local.strUsername)){
            local.errorMsg &= "USername should contain alphabets only!!!";
        }
        else if(isNumeric(local.strPassword)){
            local.errorMsg &= "Password should be a combination of digits and alphabets!!!";
        }
        else if(isNumeric(local.strConfirmPassword)){
            local.errorMsg &= "Password should be a combination of digits and alphabets!!!";
        }
        else if(local.strConfirmPassword NEQ local.strPassword){
            local.errorMsg &= "Password isn't matching!!!";
        }
        local.response = {};
        if(len(local.errorMsg) EQ 0) {
            local.response["success"] = true;
        } else {
            local.response["success"] = false;
            local.response["msg"] = local.errorMsg;
        }
        return local.response;
    }
    remote string function checkUserExist(strUsername,strRole){
        local.strUsername = strUsername;
        local.strRole = strRole;
        local.checkUser = createObject("component", "models/user").checkUserExist(local.strUsername,local.strRole);
        local.response = {};
        if(local.checkUser) {
            local.response["success"] = true;
            local.response["msg"] = "User with this username already exist!!!";
        } else {
            local.response["success"] = false;
            local.response["msg"] = "User with this username doesn't exist!!!";
        }
        return serializeJSON(local.response);
    }
    remote string function addUser(strPersonName,strUsername,strPassword,strConfirmPassword,strRole){
        local.strPersonName = strPersonName;
        local.strUsername = strUsername;
        local.strPassword = strPassword;
        local.strConfirmPassword = strConfirmPassword;
        local.strRole = strRole;
        local.addUser = createObject("component", "models/user").addUser(local.strPersonName,local.strUsername,local.strPassword,local.strConfirmPassword,local.strRole);
        local.response = {};
        if(local.addUser) {
            local.response["success"] = true;
            local.response["msg"] = "Successfully completed registration!!!";
        } else {
            local.response["success"] = false;
            local.response["msg"] = "Failed to complete registration!!!";
        }
        return serializeJSON(local.response);
    }
}