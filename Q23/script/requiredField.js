
function validateForm() {
    
    var count=0;
    //Job role validation
    var selectedJobRole = document.getElementById("selectJobRole").value;
    var lblError;
    if (selectedJobRole.trim() === "") {
        document.getElementById("JobRoleError").innerHTML = "This field is required. Please select an option.";
        //document.getElementById('lblError1').style.color = "red";
        count++;
        //validateError();
    } 
    else{
        document.getElementById("JobRoleError").innerHTML = "";
    }
        
    
    //Date validation
    var Mnth = document.getElementById("month").value;
    var Dy = document.getElementById("day").value;
    var Yr = document.getElementById("year").value;
   
    var dayMnth = Mnth.concat("/",Dy);
    var resultDate = dayMnth.concat("/",Yr);
    let dateformat = /^(0?[1-9]|1[0-2])[\/](0?[1-9]|[1-2][0-9]|3[01])[\/]\d{4}$/;

    if (Mnth === "" || Dy === "" || Yr === "") {
        document.getElementById("DateError").innerHTML = "This field is required. Please select a date.";
        count++;
        //validateError();
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
                    count++;
                    //validateError();
                }
        }
    } else {
        document.getElementById("DateError").innerHTML = "Invalid date format!";
        count++;
        //validateError();
    }

    //Portfolio validation
    var websiteUrl = document.getElementById("portfolio").value;
    
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
        count++;
        //validateError();
    }
    else if (pattern.test(websiteUrl)) {
        document.getElementById("PortfolioError").innerHTML = "";
        count++;
    } 
    else {
        document.getElementById("PortfolioError").innerHTML = "Invalid URL";
        count++;
        //validateError();
    }
    
    //First Name validation
    var regexName = /^[a-zA-Z ]{2,30}$/;
    var firstName =  document.getElementById('firstName').value;
    var lastName =  document.getElementById('lastName').value;

    if(firstName.trim() === "" || lastName.trim() === ""){
        document.getElementById("NameError").innerHTML = "This is a required field. Please enter name";
        count++;
        //validateError();
    }
    else if(regexName.test(firstName) ||  regexName.test(lastName))
        document.getElementById("NameError").innerHTML = "";
    else
        document.getElementById("NameError").innerHTML = "Name should contain alphabets only";
        count++;
        //validateError();

    
    //Email validation
    const mailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var mail =  document.getElementById('email').value;
    if(mail.trim() === ""){
        document.getElementById("MailError").innerHTML = "This is a required field. Please enter email name";
        count++;
        //validateError();
    }
    else if(mailRegex.test(mail))
        document.getElementById("MailError").innerHTML = "";
    else
    document.getElementById("MailError").innerHTML = "Invalid email";
    count++;
    //validateError();

    //phone validation
    var firstPhn = document.getElementById('firstPhn').value;
    var midPhn = document.getElementById('midPhn').value;
    var lastPhn = document.getElementById('lastPhn').value;
        
    var phnFirst = firstPhn.concat(midPhn);
    var phoneNo = phnFirst.concat(lastPhn);
    let maxLen = phoneNo.length;

    if(firstPhn === "" || midPhn === "" || lastPhn === ""){
        document.getElementById("PhoneError").innerHTML = "This field cannot be empty. Please enter phone number";
        count++;
        //validateError();
    }
    else if (isNaN(phoneNo)) {
        document.getElementById("PhoneError").innerHTML = "This field should contain digits only";
        count++;
        //validateError();
    } else if (maxLen < 10 || maxLength > 10) {
        document.getElementById("PhoneError").innerHTML = "Number should contain 10 digits only";
        count++;
        //validateError();
    } else {
        document.getElementById("PhoneError").innerHTML = "";
    }
    
    if(count==0)
        return true;
    else
        return false;
}

/*function validateError()
{
    var errMsg = document.getElementByClass("errorMsg");
    if (errMsg.style.display === "none") {
        document.getElementById('errorMsg').style.display = "block";
    } else {
        document.getElementById('errorMsg').style.display = "none";
    } onsubmit="return  validateError()"
}*/ 

     
    


