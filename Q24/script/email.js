$(document).ready(function() {
    $('#checkEmail').click(function() {
        var email = $('#email').val();
        if (email.trim() === '') {
            alert('Please enter your email.');
            return;
        }
        $.ajax({
            url: "component/subscribe.cfc?method=checkMail",
            type: 'post',
            data:  {email: email}, 
            dataType:"json",
            success: function(response) {
                if (response.message === "exists"){
                    alert('Email id is already there');
                    $('#submitButton').prop('disabled',true);
                } else {
                    $('#submitButton').prop('disabled',false);
                }
            },
            error: function(xhr, status, error) {
                $("#submitBtn").prop("disabled", false);
            }
        });
    });
});
