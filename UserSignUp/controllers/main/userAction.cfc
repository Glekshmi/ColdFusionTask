component {
    remote string function checkUserExist(username,role) returnFormat="JSON" {
        local.strUsername = arguments.username;
        local.strRole = arguments.role;
        local.checkUser = '';
        local.checkUser = createObject("component", "models/user").checkUserExist(local.strUsername,local.strRole);
        local.jsonResponse = {};
 
        if(local.checkUser) {
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "User with this username already exist";
        } else {
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "Username does not exist";
        }
        return serializeJSON(local.jsonResponse);
    }
    
    remote string function addUser(personName,username,password,role) returnFormat="JSON" {
        local.strPersonName = arguments.personName;
        local.strUsername = arguments.username;
        local.strPassword = arguments.password;
        local.strRole = arguments.role;

        local.addUser = '';   
        local.addUser = createObject("component", "models/user").addUser(strPersonName=local.strPersonName,strUsername=local.strUsername,strPassword=local.strPassword,strRole=local.strRole);
        local.jsonResponse = {};

        if(local.addUser) {
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "Successfully completed registration!!!";
        } else {
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "Failed to complete registration!!!";
        }
        return serializeJSON(local.jsonResponse);
    }
}