$(document).ready(function() {
    $('#myForm').submit(function (event) { 
    function validateForm()
    {
        
    }
    function validateJob() {
       
        var selectedJobRole = $(".selectJobRole").val();
        if (selectedJobRole === "") {
            alert("This field is required. Please enter a value.");
            return false; 
        }
        return true;
    }

    function validateRelocation() {
        
        var selectedRelocation = $("input[name='relocation']:checked").val();
        if (!selectedRelocation) {
            alert("Please select your willingness to relocate.");
            return false; 
        }
        return true;
    }

    function validateDate() {
       
        var day = $("#day").val();
        var month = $("#month").val();
        var year = $("#year").val();

       
        if (!day || !month || !year || isNaN(day) || isNaN(month) || isNaN(year)) {
            alert("Please enter a valid date.");
            return false; 
        }
        return true;
    }

    function validateURL() {
        
        var portfolioURL = $("input[name='portfolio']").val();

        if (portfolioURL && !isValidURL(portfolioURL)) {
            alert("Please enter a valid Portfolio Web Site URL.");
            return false; 
        }
        return true;
    }

    function validateName() {
        
        var firstName = $("#fname").val();
        if (!firstName || !isValidName(firstName)) {
            alert("Please enter a valid First Name.");
            return false; 
        }

        
        var lastName = $("#lname").val();
        if (!lastName || !isValidName(lastName)) {
            alert("Please enter a valid Last Name.");
            return false; 
        }
        return true;
    }

    function isValidName(name) {
        var namePattern = /^[a-zA-Z]+$/;
        return namePattern.test(name);
    }

    function validateEmail() {
        
        var email = $("#email").val();       
        if (!isValidEmail(email)) {
            alert("Please enter a valid Email Address.");
            return false; on
        }
        return true;
    }

    function isValidEmail(email) {
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailPattern.test(email);
    }

    function validateForm() {
       
        var part1 = $("#part1").val();
        var part2 = $("#part2").val();
        var part3 = $("#part3").val();

       
        if (!isValidNumber(part1) || !isValidNumber(part2) || !isValidNumber(part3)) {
            alert("Please enter a valid phone number.");
            return false; 
        }

        var phoneNumber = part1 + part2 + part3;
        return true;
    }
    function isValidNumber(number) {
        return /^\d+$/.test(number);
    }

    $("form").submit(function() {
        return validateForm();
    });
})
});
