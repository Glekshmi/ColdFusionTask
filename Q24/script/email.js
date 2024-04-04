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
                console.log(response.message)
                if (response.message === "exists") {
                    alert("Email id is already there");
                    $("#submitBtn").prop("disabled", true);
                } else { 
                    $("#submitBtn").prop("disabled", false);
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });
    })

    $('#checkEmail').click(function(){
        var email = $('#email').val();
        var name= $('#firstName').val();
        if (email.trim() === '') {
            alert('Please enter your email.');
            return;
        }
        $.ajax({
            url:"component/subscribe.cfc?method=insertData",
            type:'post',
            data: {email:email,firstName:firstName},
            dataType:'json',
            success: function(response) {
                console.log(response.message)
                if (response.message === "exists") {
                    alert("Email id is already there");
                    $("#submitBtn").prop("disabled", true);
                } else { 
                    $("#submitBtn").prop("disabled", false);
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });
    })
});
