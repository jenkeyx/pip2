function send() {
    let yValid = false;
    const y = document.getElementById('y');
    if (y.value.length < 10) {
        if (!isNaN(parseFloat(y.value))) {
            y.value = parseFloat(y.value.replace(",", "."));
        }
        if (isNaN(parseFloat(y.value)) || y.value > 3 || y.value < -5 || !y.value) {
            y.style.borderBottom = "1px solid red";
            console.log("false");
            yValid = false;
        } else {
            yValid = true;
            y.style.borderBottom = "1px solid #e0e0e0";
        }
    } else {
        console.log("false!");
        yValid = false;
        y.style.borderBottom = "1px solid red";
    }

    if (yValid) {
        document.forms.item(0).submit();
    }
}

function checkboxOnClick() {
    $('.checkboxArr input:checkbox').click(function () {
        if ($(this).is(':checked')) {
            $('input:checkbox').not(this).prop('checked', false);
        }
    });
}

