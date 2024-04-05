$(document).ready(function(){
    $("#checkEmail").click(function(event){
        event.preventDefault(); 
        var email = $("#email").val();
        $.ajax({
            url: "./components/subscribe_actions.cfc",
            method: "POST", 
            data: {
                method: "checkEmailExists",
                email: email
            },
            success: function(response){
                console.log(response);
                var count = parseInt(response); 
                if(count > 1){ 
                    $("#emailStatus").text("Email ID already exists.");
                    $("#subscribeButton").prop("disabled", true);
                } else  {
                    $("#emailStatus").text("Email ID is available.");
                    $("#subscribeButton").prop("disabled", false);
                }
            }
        });
    });

    $("#subscribeButton").click(function(event){
        event.preventDefault(); 
        var firstName = $("#firstName").val();
        var email = $("#email").val();
        $.ajax({
            url: "./components/subscribe_actions.cfc",
            method: "POST", 
            data: {
                method: "addSubscriber",
                firstName: firstName,
                email: email
            },
            success: function(response){
                console.log("Response from addSubscriber:", response); 

                if(response) {
                    alert("Subscription successful!");
                    $("#subscribeForm")[0].reset(); 
                    $("#subscribeButton").prop("disabled", true);
                } else {
                    alert("Subscription failed!");
                }
            }
        });
    });
});