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
        request(getCheckedBoxes(),$("#y").val(),$("#r").val());
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
        if (name === "y") {
            if (isNaN(parseFloat(e.value)) || e.value > 3 || e.value < -5 || !e.value) {
                e.style.borderBottom = "1px solid red";
                console.log("error")
            } else {
                yValid = true;
                e.style.borderBottom = "1px solid #e0e0e0";
            }
        }else {
            if (isNaN(parseFloat(e.value))|| e.value < 2 || e.value >5 || !e.value){
                e.style.borderBottom = "1px solid red";
                console.log("error")
            }else {
                rValid = true;
                e.style.borderBottom = "1px solid #e0e0e0";
            }
        }
    } else {
        if (name === "y"){
            yValid = false;
        }else {rValid = false}
        e.style.borderBottom = "1px solid red";
    }
}

function request(x, y, r) {
    let data = {
        "type": "ajax",
        "checkbox[]": Array.isArray(x) ? x : [x],
        "y": y,
        "r": r
    };
    $.ajax({
        type: "GET",
        url: "controllerServlet",
        data: data,
        dataType: 'text',
        success: function (data) {
            let index = 0;
            data = Array(data);
            console.log(data);
            let res = JSON.parse(data);
            for (index; index < res.length; index++) {
                let tr = document.createElement("tr");
                tr.innerHTML = '<td>' + res[index].x + '</td><td>' + res[index].y + '</td><td>' + res[index].r + '</td><td style="background-color: ' + (res[index].result === "true" ? "lightgreen" : "lightcoral") + '">' + res[index].result + '</td>';
                document.getElementById("table").appendChild(tr);
            }
        }
    })
}
function getCheckedBoxes() {
    let checkboxes = document.getElementsByClassName('checkbox');
    let checkboxesChecked = [];
    for (let index = 0; index < checkboxes.length; index++) {
        if (checkboxes[index].checked) {
            checkboxesChecked.push(checkboxes[index].value);
        }
    }
    return checkboxesChecked;
}