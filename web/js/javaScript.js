let checkboxArr = $(".checkboxArr input:checkbox");
let yValid;
let rValid;
let xValid;
function send() {
    xValid = false;
    yValid = false;
    rValid = false;
    const y = document.getElementById('y');
    const r = document.getElementById("r");

    checkboxArr.each(function validCheckbox(){
        if ($("input:checkbox").is(":checked")){
            xValid = true;
        }
    });
    validateText(y);
    validateText(r);

    if (xValid && yValid && rValid) {
        document.forms.item(0).submit();
    }else if (!xValid){
        checkboxArr.each(function mark(){
            $("input:checkbox").css({"color":"#cc0000"})
            //todo сделать подсветку красным
        });
            console.log("Check x!")
    }
}

function validateText(e) {
    let name = e.getAttribute("name");
    if (e.value.length < 10) {
        if (!isNaN(parseFloat(e.value))) {
            e.value = e.value.replace(",",".");
        }
        if (isNaN(parseFloat(e.value)) || e.value > 3 || e.value < -5 || !e.value) {
            e.style.borderBottom = "1px solid red";
            console.log("error")
        } else {
            if (name === "y"){
                yValid = true;
            }else {rValid = true}
            e.style.borderBottom = "1px solid #e0e0e0";
        }
    } else {
        if (name === "y"){
            yValid = false;
        }else {rValid = false}
        e.style.borderBottom = "1px solid red";
    }
}

