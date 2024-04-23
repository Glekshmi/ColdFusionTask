component {
    
    remote string function checkPageExist(pageName,pageId) returnFormat="JSON" {
        local.pageName = arguments.pageName;
        local.pageId = arguments.pageId;
        local.checkPage = '';
        local.checkPage = createObject("component", "CFC/pages").checkPageExist(local.pageName,local.pageId);
        local.jsonResponse = {};
        

        if(local.checkPage) {
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "page is already exist";
        } else {
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "page is not exist";
        }
        return serializeJSON(local.jsonResponse);
    }

    remote any function savePage(pageName,pageDes,PageId) returnFormat="JSON" {
        local.pageName = arguments.pageName;
        local.pageDes = arguments.pageDes;
        local.PageId = arguments.PageId;
        
        local.aplabetsOnly = "/^[A-Za-z]+$/";
        local.alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/";

        local.errors ='';
        if (local.pageName EQ '')
            local.errors &= "page name field should not be empty"&"<br>";
        else if (reFind("\d", local.pageName))
            local.errors &= "page name should contain alphabets only"&"<br>";
        else
            local.errors &= '';

        if (local.pageDes EQ '')
            local.errors &= "page description field should not be empty"&"<br>";
        else if (isNumeric(local.pageDes))
            local.errors &= "page description should not contain digits only"&"<br>";
        else
            local.errors &= '';

        if (len(local.pageName) GT 20)
            local.errors &= "Exceeded maximum length"&"<br>";
        else
            local.errors &= '';

        local.jsonResponse = {};

        if (local.errors EQ ""){
            local.savePage=createObject("component","CFC/pages").savePage(local.pageName,local.pageDes,local.PageId);
            local.jsonResponse["success"] = "true";
            local.jsonResponse["msg"] = "#local.savePage#";
        }
        else{
            local.jsonResponse["success"] = "false";
            local.jsonResponse["msg"] = "#local.errors#";
        }
         return serializeJSON(local.jsonResponse);
    }
}
