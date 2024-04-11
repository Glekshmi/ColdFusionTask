function validation() {
    pageName = document.getElementById('pageName').value.trim();
	pageDesc=document.getElementById('pageDes').value.trim();
	
    if(pageName===""||pageDesc===""){
		alert("fields cannot be empty");
        return false;
	}
	else if (!isNaN(pageName)){
		alert("PageName field should not contain digits!!!");
        return false;
	}
    else if (!isNaN(pageDesc)){
		alert("Page Description field should not contain digits!!!");
        return false;
	}
	else{
		return true;
	}
}