$(document).ready(function() {
    console.log("Document is ready!");
    $("#firstPhn, #midPhn, #lastPhn").on("keydown", function(e) {
        var maxLength = parseInt($(this).attr("maxlength"));
        console.log("max"+ maxLength);
        var currentLength = $(this).val().length;
        console.log("len"+ currentLength);

        if (currentLength === maxLength && e.which !== 8) {
            $(this).next("input").focus();
        }
    });
});

