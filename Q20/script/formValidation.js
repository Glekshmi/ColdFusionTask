function formValidation() {
	emailFormat=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    email = document.getElementById('email').value.trim();
	captcha=document.getElementById('captcha').value.trim();
	if(email===""||captcha===""){
		alert("fill all the fields");
        return false;
	}
	else if (!email.match(emailFormat)){
		alert("invalid email ");
        return false;
	}
	else{
		return true;
	}
}
