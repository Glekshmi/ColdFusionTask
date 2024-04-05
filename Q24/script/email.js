$(document).ready(function(){
    $('#checkEmail').click(function(){
        var email = $('#email').val();
        if (email.trim() === '') {
            alert('Please enter your email.');
            return;
        }
        $.ajax({
            url:"component/subscribe.cfc?method=checkMail",
            type:'post',
            data: {email:email},
            dataType:'json',
            success: function(response) {
                
                var count = response;
                /*console.log(count)*/
                if (count>=1) {
                    alert("Email id is already there");
                    $("#submitBtn").prop("disabled", true);
                } else { 
                     alert("Email id is not present");
                    $("#submitBtn").prop("disabled", false);
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });
    });

    $('#submitBtn').click(function(){
        var email = $('#email').val();
        var firstName= $('#firstName').val();
        $.ajax({
            url:"component/subscribe.cfc?method=insertData",
            type:'post',
            data: {email:email,firstName:firstName},
            dataType:'json',
            success: function(response) {
                console.log(response)
                var count = response;
                if (count === 1) {
                    alert("success");
                  
                } else { 
                    alert("failed");
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });
    });
});
