$(document).ready(function(){
	$('#regitrationForm').submit(function(){
        var personName = $('#personName').val().trim();
        var username = $('#username').val().trim();
        var password = $('#password').val().trim();
        var role = $('#role').val().trim();
		if (validate()){
			
			$.ajax({
				url:"./controllers/main/userAction.cfc?method=checkUserExist",
				type:'post',
				data: {username:username,role:role},
				dataType:'json',
				success: function(response) {
					var msg = response.msg;
					var success = response.success;
					if(success=="true") {
						$("#pageSuccess").html(msg).css("color","red");
					}	
					else { 
						$.ajax({
							url:"./controllers/main/userAction.cfc?method=addUser",
							type:'post',
							data: {personName:personName,username:username,password:password,role:role},
							dataType:'json',
							success: function(response) {
								var msg = response.msg;
								var success = response.success;
								if(success=="true") {
									$("#pageSuccess").html(msg).css("color","green");
								}	
								else { 
									$("#pageSuccess").html(msg).css("color","red");
								}
			
							},
							error: function(xhr, status, error) {
								alert("An error occurred in ajax:"+error);
							}
							
						});
						return false;
					}
				},
				error: function(xhr, status, error) {
					alert("An error occurred in ajax:"+error);
				}
				
			});
			return false;
		}
		return false;
    });

});

function validate(){
	var errorMsg='';
	var personName = $('#personName').val().trim();
	var username = $('#username').val().trim();
    var password = $('#password').val().trim();
	var confirmPassword = $('#confirmPassword').val().trim();
    var role = $('#role').val().trim();

	if (personName == '' || username == '' || password == '' || confirmPassword == '' || role == '' ) {
		errorMsg+='Please fill all the fields!'+"<br>";
		
	}

	else if (/\d/.test(personName)) {
		errorMsg+='please enter a valid name!'+"<br>";
	}
	
    else if (/\d/.test(username)) {
		errorMsg+='please enter a valid username!'+"<br>";
	}
    
	else if (!isNaN(password)) {
		errorMsg+='please enter a valid password!'+"<br>";
	}

	else if (confirmPassword != password){
        errorMsg+='Password isn\'t matching!'+"<br>";
    }
	
	if(errorMsg != ''){
		$("#pageSuccess").html(errorMsg).css("color","red");
		return false;
	}
	else{
		return true;
	}
}