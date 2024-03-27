
function validateForm() {
    
    var count=0;
    //Job role validation
    var selectedJobRole = document.getElementById("selectJobRole").value;
    var lblError;
    var positionSection;
    if (selectedJobRole.trim() === "") {
        document.getElementById("JobRoleError").innerHTML = "This field is required. Please select an option.";
        document.getElementById('lblError').style.color = "red";
        document.getElementById('positionSection').style.background = "#FFDFDF";
        count++;
        validateError();
    }else{
        document.getElementById("JobRoleError").innerHTML = "";
        validateError();
    }
        
    //Date validation
    var lblError1;
    var dateSection;
    var Mnth = document.getElementById("month").value;
    var Dy = document.getElementById("day").value;
    var Yr = document.getElementById("year").value;
   
    var dayMnth = Mnth.concat("/",Dy);
    var resultDate = dayMnth.concat("/",Yr);
    let dateformat = /^(0?[1-9]|1[0-2])[\/](0?[1-9]|[1-2][0-9]|3[01])[\/]\d{4}$/;

    if (Mnth === "" || Dy === "" || Yr === "") {
        document.getElementById("DateError").innerHTML = "This field is required. Please select a date.";
        document.getElementById('lblError1').style.color = "red";
        document.getElementById('dateSection').style.background = "#FFDFDF";
        count++;
        validateError();
    } 
    else if (resultDate.match(dateformat)) {
        let operator = resultDate.split('/');
        let datepart = [];
        if (operator.length > 1) {
            datepart = resultDate.split('/');
        }
        let month = parseInt(datepart[0]);
        let day = parseInt(datepart[1]);
        let year = parseInt(datepart[2]);

        let ListofDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        if (month == 1 || month > 2) {
            if (day > ListofDays[month - 1]) {
                return false;
            }
        } else if (month == 2) {
            let leapYear = false;
            if ((!(year % 4) && year % 100) || !(year % 400)) leapYear = true;
            if ((leapYear == false) && (day >= 29)) 
                return false;
            else
                if ((leapYear == true) && (day > 29)) {
                    document.getElementById("DateError").innerHTML = "check the date format!";
                    document.getElementById('lblError1').style.color = "red";
                    count++;
                    validateError();
                }
        }
    } else {
        document.getElementById("DateError").innerHTML = "Invalid date format!";
        document.getElementById('lblError1').style.color = "red";
        count++;
        validateError();
    }

    //Portfolio validation
    var websiteUrl = document.getElementById("portfolio").value;
    var lblError2;
    var portfolioSection;
    const pattern = new RegExp(
        '^(https?:\\/\\/)?' + 
          '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + 
          '((\\d{1,3}\\.){3}\\d{1,3}))' +
          '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' +
          '(\\?[;&a-z\\d%_.~+=-]*)?' + 
          '(\\#[-a-z\\d_]*)?$', 
        'i'
      );

    if(websiteUrl === ""){
        document.getElementById("PortfolioError").innerHTML = "This field is required.Please enter website url.";
        document.getElementById('lblError2').style.color = "red";
        document.getElementById('portfolioSection').style.background = "#FFDFDF";
        count++;
        validateError();
    }
    else if (pattern.test(websiteUrl)) {
        document.getElementById("PortfolioError").innerHTML = "";
        validateError();
    } 
    else {
        document.getElementById("PortfolioError").innerHTML = "Invalid URL";
        document.getElementById('lblError2').style.color = "red";
        count++;
        validateError();
    }
    
    //First Name validation
    var lblError3;
    var NameSection;
    var regexName = /^[a-zA-Z ]{2,30}$/;
    var firstName =  document.getElementById('firstName').value;
    var lastName =  document.getElementById('lastName').value;

    if(firstName.trim() === "" || lastName.trim() === ""){
        document.getElementById("NameError").innerHTML = "This is a required field. Please enter name";
        document.getElementById('lblError3').style.color = "red";
        document.getElementById('NameSection').style.background = "#FFDFDF";
        count++;
        validateError();
    }
    else if(regexName.test(firstName) ||  regexName.test(lastName)){
        document.getElementById("NameError").innerHTML = "";
        validateError();
    }
    else{
        document.getElementById("NameError").innerHTML = "Name should contain alphabets only";
        document.getElementById('lblError3').style.color = "red";
        count++;
        validateError();
    }

    
    //Email validation
    var lblError4;
    var mailSection;
    const mailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var mail =  document.getElementById('email').value;
    if(mail.trim() === ""){
        document.getElementById("MailError").innerHTML = "This is a required field. Please enter email name";
        document.getElementById('lblError4').style.color = "red";
        document.getElementById('mailSection').style.background = "#FFDFDF";
        count++;
        validateError();
    }
    else if(mailRegex.test(mail)){
        document.getElementById("MailError").innerHTML = "";
        validateError();
    }
    else{
        document.getElementById("MailError").innerHTML = "Invalid email";
        document.getElementById('lblError4').style.color = "red";
        count++;
        validateError();
    }
    
    //phone validation
    var lblError5;
    var phoneSection;
    var firstPhn = document.getElementById('firstPhn').value;
    var midPhn = document.getElementById('midPhn').value;
    var lastPhn = document.getElementById('lastPhn').value;
        
    var phnFirst = firstPhn.concat(midPhn);
    var phoneNo = phnFirst.concat(lastPhn);
    let maxLen = phoneNo.length;

    if(firstPhn === "" || midPhn === "" || lastPhn === ""){
        document.getElementById("PhoneError").innerHTML = "This field cannot be empty. Please enter phone number";
        document.getElementById('lblError5').style.color = "red";
        document.getElementById('phoneSection').style.background = "#FFDFDF";
        count++;
        validateError();
    }
    else if (isNaN(phoneNo)) {
        document.getElementById("PhoneError").innerHTML = "This field should contain digits only";
        document.getElementById('lblError5').style.color = "red";
        count++;
        validateError();
    } else if (maxLen < 10 || maxLength > 10) {
        document.getElementById("PhoneError").innerHTML = "Number should contain 10 digits only";
        document.getElementById('lblError5').style.color = "red";
        count++;
        validateError();
    } else {
        document.getElementById("PhoneError").innerHTML = "";
        validateError();
    }
    
    if(count==0)
        return true;
    else
        return false;
}

function validateError()
{   
    var errMsg = document.getElementById("errorMessage");
    if(errMsg.style.display === "none") {
        errMsg.style.display = "block";
    } else {
        errMsg.style.display = "none";
    }
}
    


