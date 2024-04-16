$(document).ready(function(){
	var count=0;
	var errorMsg='';
    $('#formName').submit(function(){
        var Name = $('#pageName').val();
		alert(Name);
		return;
        if (Name.trim() === '') {
			errorMsg+='Please enter page name!';
			
        }
		else if (aplabetsOnly.test(Name) === '') {
            errorMsg+='page name should contain alphabets only!';
            count++;
        }
		else
			$("#nameError").html();
	
        var Description = $('#pageDesc').val();
        if (Description.trim() === '') {
            errorMsg+='Please enter page description!';
            count++;
        }
		else if (alphaNumeric.test(Description) === '') {
            errorMsg+='page description should not contain digits only!';
            count++;
        }
		else
		errorMsg+='';
        
		if(errorMsg == '')
			return true;
		else
			$("#nameError").html(erroMsg);

	});


});