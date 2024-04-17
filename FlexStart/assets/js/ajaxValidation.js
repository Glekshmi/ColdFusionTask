$(document).ready(function(){
    $('#loginSubmit').click(function(){
        var userName = $('#userName').val();
        var password = $('#password').val();
        if (userName.trim() === '' || password.trim() === '') {
            alert('fill all the fields!');
            return;
        }
       
        $.ajax({
            url:"../model/pages.cfc?method=doLogin",
            type:'post',
            data: {userName:userName,password:password},
            dataType:'JSON',
            success: function(response) {
                console.log(response);
                var msg = response.message;
                if (msg == "exists") {
                    setTimeout(function(){

                        window.location.href="../view/adminHome.cfm";
                    },1000
                );
                } else { 
                     alert("invalid username or password!");
                }
                
            },
            error: function(xhr, status, error) {
                alert("An error occurred:"+error);
            }
            
        });

    });
    return false;
});
