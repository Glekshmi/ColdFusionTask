$(document).ready(function() {
    console.log("phonenumber.js is executing!");
    $("#day, #month, #year").datepicker({
        dateFormat: "dd/mm/yy",
        onSelect: function() {
            var date = $(this).datepicker("getDate");
            if (date) {
                $("#day").val($.datepicker.formatDate("dd", date));
                $("#month").val($.datepicker.formatDate("mm", date));
                $("#year").val($.datepicker.formatDate("yy", date));
            }
        }
    });

    
    $(document).on("click", "#calendar-icon", function() {
        $("#day").focus(); 
    });
});