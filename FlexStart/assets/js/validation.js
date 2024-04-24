$(document).ready(function(){

	$('#formName').submit(function(){
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        var pageId = $('#pageId').val();
		if (validate()){
			
			$.ajax({
				url:"../controllers/pages.cfc?method=checkPageExist",
				type:'post',
				data: {pageName:pageName,pageId:pageId},
				dataType:'json',
				success: function(response) {
					var msg = response.msg;
					var success = response.success;
					if(success=="true") {
						$("#pageSuccess").html(msg);
						setTimeout(function(){
							window.location.href="../view/listPage.cfm";
						},1000
						);
					}	
					else { 
						$.ajax({
							url:"../controllers/pages.cfc?method=savePage",
							type:'post',
							data: {pageId:pageId,pageName:pageName,pageDes:pageDes},
							dataType:'json',
							success: function(response) {
								
								var msg = response.msg;
								var success = response.success;
								if(success=="true") {
									$("#pageSuccess").html(msg);
									setTimeout(function(){
										window.location.href="../view/listPage.cfm";
									},1000
								);
								}	
								else { 
									$("#pageFailed").html(msg);
									setTimeout(function(){
										window.location.href="../view/listPage.cfm";
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
				},
				error: function(xhr, status, error) {
					alert("An error occurred in ajax:"+error);
				}
				
			});
			return false;
		}
		return false;
    });


	$('.deleteId').click(function(){
		var pageId = $(this).attr('data-pageId');
		var delPage = $(this);
		if(confirmDelete())
		{
			$.ajax({
				url:"../model/pages.cfc?method=deletePage",
				type:'post',
				data: {pageId:pageId},
				dataType:'json',
				success: function(response) {
					var success = response.success;
					if(success=="true") {
						$(delPage).closest('tr').remove();
					}	
					else { 
						alert("failed to remove the page");
					}
				},
				error: function(xhr, status, error) {
					alert("An error occurred in ajax:"+error);
				}
			});
			return false;
		}
		
    });

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
		//alert(errorMsg);
	}

	if (Description == '') {
		errorMsg+='Please enter page description!'+"<br>";
		//alert(errorMsg);
	}
	else if (!isNaN(Description)) {
		errorMsg+='page description should not contain digits only!'+"<br>";
		//alert(errorMsg);
	}
	
	if(errorMsg != ''){
		$("#nameError").html(errorMsg);
		return false;
	}
	else{
		return true;
	}
}
function confirmDelete() {
	if (confirm("Are you sure want to delete this article?")) {
		return true;
	} else {
		return false;
	}
}