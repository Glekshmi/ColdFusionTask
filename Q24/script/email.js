$(document).ready(function(){
    $("#checkEmail").click(function() {
        var email = $("#email").val();

        $.ajax({
            type: "POST",
            url: "component/subscribe.cfc",
            data: { email: email },
            dataType: "json",
            success: function(response) {
                if (response.message === "exists") {
                    $("#errorMessage").text("Email id is already there");
                    $("#submitBtn").prop("disabled", true);
                } else {
                    $("#errorMessage").text("");
                    $("#submitBtn").prop("disabled", false);
                }
            }
        });
    });
});