$(document).ready(function(){
	var errorMsg='';
	
    $('form').submit(function(){

        var Name = $('#pageName').val().trim();
        var Description = $('#pageDes').val().trim();
    	var alphaNumeric = "/^(?![0-9]*$)[a-zA-Z0-9]+$/";
		
        if (Name == '') {
			
			errorMsg+='Please enter page name!'+"<br>";
        }
		else if (/\d/.test(Name)) {
            errorMsg+='page name should contain alphabets only!'+"<br>";
        }
		else
			errorMsg+='';
		
        if (Description == '') {
            errorMsg+='Please enter page description!'+"<br>";
			
        }
		else if (!isNaN(Description)) {
            errorMsg+='page description should not contain digits only!'+"<br>";
        }
		else
			errorMsg+='';
        
		if(errorMsg == '')
			return true;
		else{
			$("#nameError").html(errorMsg);
			return false;
		}
	});
});