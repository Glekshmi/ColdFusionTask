function validation() {
    pageName = document.getElementById('pageName').value.trim();
	pageDesc=document.getElementById('pageDes').value.trim();
	var count=0;
	var aplabetsOnly = "/^[A-Za-z]+$/";
    var alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/";
    if(pageName===""){
		document.getElementById("nameError").innerHTML = "This field is required. Please enter Value!";
		count++;
	}
	else if (aplabetsOnly.test(pageName)){
		document.getElementById("nameError").innerHTML = "PageName field should contain alphabets only!";
		count++;
	}
	else{
		document.getElementById("nameError").innerHTML = "";
	}

	if (pageDesc===""){
		document.getElementById("descriptionError").innerHTML = "This field is required. Please enter Value!";
		count++;
	}
    else if (!alphaNumeric.test(pageDesc)){
		document.getElementById("descriptionError").innerHTML = "Page Description field should not contain digits only!";
        count++;
	}
	else{
		document.getElementById("descriptionError").innerHTML = "";
	}

	if(count==0)
        return true;
    else
        return false;
}