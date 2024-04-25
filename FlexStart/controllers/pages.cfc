component {
    remote string function checkPageExist(pageName,pageId) returnFormat="JSON" {
        local.strPageName = arguments.pageName;
        local.intPageId = arguments.pageId;
        local.checkPage = '';
        local.checkPage = createObject("component", "CFC/pages").checkPageExist(local.strPageName,local.intPageId);
        local.jsonResponse = {};

        if(local.checkPage) {
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "Page with this name already exist";
        } else {
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "Page does not exist";
        }
        return serializeJSON(local.jsonResponse);
    }

    remote string function savePage(pageName,pageDes,PageId) returnFormat="JSON" {
        local.strPageName = arguments.pageName;
        local.strPageDes = arguments.pageDes;
        local.intPageId = arguments.PageId;

        local.errors ='';
        if (len(local.strPageName) EQ 0)
            local.errors &= "page name field should not be empty"&"<br>";
        else if (reFind("\d", local.strPageName))
            local.errors &= "page name should contain alphabets only"&"<br>";
        else
            local.errors &= '';

        if (len(local.strPageDes) EQ 0)
            local.errors &= "page description field should not be empty"&"<br>";
        else if (isNumeric(local.strPageDes))
            local.errors &= "page description should not contain digits only"&"<br>";
        else
            local.errors &= '';

        if (len(local.strPageName) GT 20)
            local.errors &= "Exceeded maximum length"&"<br>";
        else
            local.errors &= '';

        local.jsonResponse = {};

        if (local.errors EQ ""){
            local.savePage=createObject("component","CFC/pages").savePage(local.strPageName,local.strPageDes,local.intPageId);
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "#local.savePage#";
        }
        else{
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "#local.errors#";
        }
         return serializeJSON(local.jsonResponse);
    }

    public function login() {
        if (session.userLoggedIn)
            location("../view/adminHome.cfm");
    }

    remote any function logout() {
        if (session.userLoggedIn)
            structDelete(session, "userLoggedIn");
            session.userLoggedIn=false;
            location("../view/newLogin.cfm");
    }

    remote string function doLogin(userName,password) returnFormat="JSON"{
        local.strUserName = arguments.userName;
        local.strPassword = arguments.password;

        local.encryptedPassword = Hash(#local.strPassword#, 'SHA-512');
        local.qryUserExist = createObject("component","CFC/pages").checkUserLogin(strUserName=local.strUserName,strPassword=local.encryptedPassword);
        if (qryUserExist.recordCount){
            session.userRole = qryUserExist.Role;
            session.personName = qryUserExist.Name;
            session.userLoggedIn = true;
            local.jsonResponse = {};
            if (qryUserExist.Role EQ "admin" OR qryUserExist.Role EQ "editor" OR qryUserExist.Role EQ "user"){
                local.jsonResponse["success"] = "true";
                local.jsonResponse["message"] = "exists";
            }
            else{
                local.jsonResponse["success"] = "false";
                local.jsonResponse["message"] = "not exists";
            }
        }
            return serializeJSON(local.jsonResponse);
    }

}
