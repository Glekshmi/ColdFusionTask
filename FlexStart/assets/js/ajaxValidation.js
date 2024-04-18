$(document).ready(function(){
    $('#loginSubmit').click(function(){
        var userName = $('#userName').val().trim();
        var password = $('#password').val().trim();
       
        if (userName === '' || password === '') {
            $("#errorDisplay").text("fill all the fields!");
           return false;

        }
       
        $.ajax({
            url:"../model/pages.cfc?method=doLogin",
            type:'post',
            data: {userName:userName,password:password},
            dataType:'JSON',
            success: function(response) {
                var msg = response.message;
                if (msg == "exists") {
                    $("#successDisplay").html("Succesfully logged in!");
                    setTimeout(function(){
                        
                        window.location.href="../view/adminHome.cfm";

                    },1000
                );

                } else { 
                     $("#errorDisplay").html("invalid username or password!");
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });
        return false;
    });
    
    

});
