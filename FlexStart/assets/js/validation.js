$(document).ready(function(){

	$('#addPageBtn').click(function(){
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        var pageId = $('#pageId').val();
		
		if (validate()){
			
			
			$.ajax({
				url:"../model/pages.cfc?method=savePage",
				type:'post',
				data: {pageName:pageName,pageDes:pageDes,pageId:pageId},
				dataType:'JSON',
				success: function(response) {
					var msg = response.msg;
					var success = response.success;
					console.log(msg);
					if(success=="true") {
						
						setTimeout(function(){
							$("#pageSuccess").html(msg);
							window.location.href="../view/adminPageView.cfm";
						},1000
					);
					}	
					else { 
						
						setTimeout(function(){
							$("#pageFailed").html(msg);
							window.location.href="../view/adminPageView.cfm";
						},1000
					);
					}
					
				},
				error: function(xhr, status, error) {
					alert("An error occurred in ajax:"+error);
				}
				
			});
			return false;
		}
        
    });



	function validate(){
		var errorMsg='';
        var Name = $('#pageName').val().trim();
        var Description = $('#pageDes').val().trim();
		
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
        
		if(errorMsg != ''){
			$("#nameError").html(errorMsg);
			return false;
		}
			return true;

	};

});



