function numberValidation() {
    let number = document.getElementById("number").value;
    if (isNaN(number) || number.trim() == "") {
      alert("Please enter a valid numeric value");
      return false;
    }
    else{
      return true;
    }
}