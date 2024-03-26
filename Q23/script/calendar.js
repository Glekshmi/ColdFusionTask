$(document).ready(function() {
    console.log("calender.js is executing!");
    $("#month, #day, #year").datepicker({
        dateFormat: "mm/dd/yy",
        onSelect: function() {
            var date = $(this).datepicker("getDate");
            if (date) {
                $("#month").val($.datepicker.formatDate("mm", date));
                $("#day").val($.datepicker.formatDate("dd", date));
                $("#year").val($.datepicker.formatDate("yy", date));
            }
        }
    });

    
    $(document).on("click", "#calendar-icon", function() {
        $("#day").focus(); 
    });
});