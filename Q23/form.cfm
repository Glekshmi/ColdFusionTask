<!DOCTYPE html>
<html>
<head>
    <title>Employment Application</title>
    <link rel="stylesheet" href="./style/form.css">
    <link rel="stylesheet" href="./style/field.css">
    <script src="./script/jqueryFunction.js"></script>
    <script src="./script/validation.js"></script>
    <script src="./script/phone.js"></script>
    <script src="./script/calendar.js"></script>
    <script src="./script/requiredField.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo" >
                <img src="./assets/wflogo-padding.png" alt="Logo">
            </div>
        </header>
        <div class="formSection">
            <form method="post" action="component/formData.cfc?method=insertData" enctype="multipart/form-data" onsubmit="return validateForm()" id="myForm">
                <div class="formHeader borderBtm">
                    <p class="formName">Employment Application</p>
                    <p class="subTitle">Infinity Box Inc.</p>
                </div>
                <div class="jobQuerySection">
                    <div id="errorMessage">
                        <div class="errorHeaderText">
                            <h3 class="errorTextMain">There was a problem with your submission.</h3>
                            <p class="errorTextsub">Errors have been <span class="highlightText"><b>highlighted</b></span>below.</p>
                        </div>
                    </div>
                    <div class="jobHeader" id="positionSection">
                        <label class="positionQuery" id="lblError">Which position are you applying for? <span class="requiredIcon">*</span></label><br>
                        <select class="selectJobRole" id="selectJobRole" name="jobRole">
                            <option value selected="selected"></option>
                            <option value="Interface Designer">Interface Designer</option>
                            <option value="Software Engineer">Software Engineer</option>
                            <option value="System Administrator">System Administrator</option>
                            <option value="Office Manager">Office Manager</option>
                        </select>
                        <p id="JobRoleError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery">
                        <label class="positionQuery" id="positionQuery" >Are you willing to relocate? <span class="requiredIcon">*</span></label><br>
                        <input type="radio" name="relocation" value="Yes" checked><span class="radioValue">Yes</span><br>
                        <input type="radio" name="relocation" value="No"><span class="radioValue">No</span>
                    </div>
                    <div class="relocationQuery" id="dateSection">
                        <label class="positionQuery" id="lblError1">When can you start? <span class="requiredIcon">*</span></label><br>
                        <div class="dateSection">
                            <span class="dateBox dateStyle">
                                <input type="text" id="month" name="month" maxlength="2" size="2" class="calenderBox boxStyle">
                                <label for="month">MM</label>
                            </span>
                            <span class="slashStyle">/
                            </span>
                            <span class="dateBox dateStyle">
                                <input type="text" id="day" name="day" maxlength="2" size="2" class="calenderBox boxStyle">
                                <label for="day" class="dayStyle" >DD</label>
                            </span>
                            <span class="slashStyle">/
                            </span>
                            <span class="dateBox dateStyle">
                                <input type="text" id="year" name="year" maxlength="4" size="4" class="calenderBox lastBoxStyle">
                                <label for="year" class="yearStyle">YYYY</label>
                            </span>
                            <span>
                                <img src="./assets/calendar.png" alt="Calendar" id="calendar-icon" width="16" height="16" class="calenderIcon">
                            </span>
                        </div>
                         <p id="DateError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery" id="portfolioSection">
                        <label class="positionQuery" id="lblError2">Portfolio Web Site </label><br>
                        <input type="text" name="portfolio" placeholder="http://" id="portfolio">
                        <p id="PortfolioError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery">
                        <label class="positionQuery" name="fileUpload" id="fileUpload">Attach a Copy of Your Resume </label><br>
                        <input type="file" name="fileUpload" id="fileUpload" accept=".doc,.docx,.pdf">
                        <p><small>Word or PDF Documents Only</small></p>
                    </div>
                    <div class="relocationQuery borderBtm">
                        <label class="positionQuery">Salary Requirements</label><br>
                        <div class="dateSection">
                            <span class="dateBox">
                                <label>$</label>
                                <input type="text" name="dollars" class="calenderBox dollarBoxStyle">
                                <p><small class="dollarStyle">Dollars</small></p>
                            </span>
                            <span class="dotIcon">.</span>
                            <span class="dateBox">
                                <input type="text" name="cents" class="calenderBox boxStyle">
                                <p><small class="centStyle">Cents</small></p>
                            </span>
                        </div>
                    </div>
                    <p class="contactInfo">Your Contact Information</p>
                    <div class="relocationQuery" id="NameSection">
                        <label class="positionQuery" id="lblError3">Name<span class="requiredIcon">*</span></label><br>
                        <div class="dateSection">
                            <span class="dateBox">
                                <input type="text" name="firstName" class="calenderBox fnameBoxStyle" id="firstName">
                                <p><small>First</small></p>
                            </span>
                            <span class="dateBox">
                                <input type="text" name="lastName" class="calenderBox lnameBoxStyle" id="lastName">
                                <p class="lastName"><small>Last</small></p>
                            </span>
                        </div>
                        <p id="NameError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery" id="mailSection">
                        <label class="positionQuery" id="lblError4">Email Address<span class="requiredIcon">*</span></label><br>
                        <div class="dateSection">
                            <span class="dateBox">
                                <input type="text" id="email" name="email"  class="calenderBox emailBoxStyle">
                            </span>
                        </div>
                        <p id="MailError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery" id="phoneSection">
                        <label class="positionQuery" id="lblError5">Phone<span class="requiredIcon">*</span></label><br>
                        <div class="dateSection">
                                 <input type="text" id="firstPhn" name="firstPhn" maxlength="3" size="3" class="calenderBox phnStyle"><span class="hipenIconLeft">-</span>
                                <input type="text" id="midPhn" name="midPhn" maxlength="3" size="3" class="calenderBox phnStyle"><span class="hipenIconRight">-</span>
                                <input type="text" id="lastPhn" name="lastPhn" maxlength="4" size="4" class="calenderBox lastPhnStyle">
                        </div>
                        <div>
                                <span class="hashSymbolFirst">###</span>
                                <span class="hashSymbolMid">###</span>
                                <span class="hashSymbolMid">####</span>
                        </div>
                        <p id="PhoneError" class="errorColor" ></p>
                    </div>
                    <div class="relocationQuery">
                       <input type="submit" value="Submit" class="submitBtn" id="submit">
                    </div>
                </div>
            </form> 
        </div>
        <footer>
            <p class="footerText">This site is protected by reCAPTCHA Enterprise and the Google <a href="#" class="linkText">Privacy Policy</a> and <a href="#" class="linkText">Terms of Service apply</a>.</p>
        </footer>
    </div>


</body>
</html>
