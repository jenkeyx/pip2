<%@ page import="Beans.Dot" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="array" class="Beans.DotBean" scope="application"/>
<html>
<head>
  <meta charset="utf-8">
  <title>lil pip</title>
  <style>
    #submitButton{
      border: 1px solid #6491B3;
      border-radius: 22px 22px 22px 22px;
    }
    button{
      width: 40px;
      height: 20px;
      outline: 0;
      border: 0;
      background-color: white
    }
    table{
      margin: 0 auto 0 300px;
    }
    input[type = "text"]{
      font-size: 15px;
      width: 180px;
      border: none;
      border-bottom: 1px solid #e0e0e0;
      background-color: transparent;
      outline: none;
      transition: 0.3s;
      margin-left: 16px
    }
    input[type = "text"]:focus{
      border-bottom: 1px solid #6491B3;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<h1>
  <i><p>Мхитарян Сергей Арменович. P3200. Вариант 200014</p></i>
</h1>
<body>
<script defer src="js/javaScript.js"></script>
<form action="controllerServlet" method="get" id="form">
  <table class="animated fadeInUp">
    <tr>
      <td></td>
      <td>
        <div>
            <canvas width="400" height="400" id="canvasArea">Canvas died</canvas>
        </div>
      </td>
    </tr>
    <tr>
      <td>Изменение X : </td>
      <td>
        <div class="checkboxArr">
        <label>
        <input type="checkbox" class="checkbox" name="checkbox[]" value="-2">
      </label>-2
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="-1.5">
        </label>-1.5
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="-1">
        </label>-1
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="-0.5">
        </label>-0.5
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="0">
        </label>0
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="0.5">
        </label>0.5
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="1">
        </label>1
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="1.5">
        </label>1.5
        <label>
          <input type="checkbox" class="checkbox" name="checkbox[]" value="2">
        </label>2
        </div>
      </td>
    </tr>
    <tr>
      <td>Изменение Y : </td>
      <td><label for="y"></label><input type="text" name="y" id = "y" placeholder="Введите число от -5 до 3"></td>
    </tr>
    <tr>
      <td>Изменение R : </td>
      <td><label for="r"></label><input type="text" name="r" id="r" placeholder="Введите число от -5 до 3" onchange="setR(this.options[this.selectedIndex].value)"></td>
    </tr>
    <tr>
      <td></td>
      <td><button style="width:100px;height:25px" type="button" id="submitButton" onclick="send()">Check</button></td>
    </tr>
  </table>
</form>
<div>
    <table id="table" class="animated fadeInUp delay-1s">
        <%
            int i = 1;
            StringBuilder builder = new StringBuilder();
            builder.append("<tr>");
            builder.append("<th>").append("X").append("</th>");
            builder.append("<th>").append("Y").append("</th>");
            builder.append("<th>").append("R").append("</th>");
            builder.append("<th>").append("Result").append("</th>");
            builder.append("</tr>");
            for (Dot dot : array.getArray()) {
                builder.append("<tr>");
                builder.append("<td>").append(dot.getX()).append("</td>");
                builder.append("<td>").append(dot.getY()).append("</td>");
                builder.append("<td>").append(dot.getR()).append("</td>");
                if (dot.isInZone()) {
                    builder.append("<td style='background-color: lightgreen;'>").append(dot.isInZone()).append("</td>");
                } else {
                    builder.append("<td style='background-color: lightcoral;'>").append(dot.isInZone()).append("</td>");
                }
                builder.append("</tr>");
                i++;
            }
            out.println(builder.toString());
        %>
    </table>
</div>
<script>
    let drawingCanvas = document.getElementById("canvasArea");
    let context = drawingCanvas.getContext("2d");
    drawCanvas("r");

    drawingCanvas.addEventListener('click', function (ev) {
        let R = document.getElementById("r").value;
        if (R === "") {
            R = "r";
        }
        drawCanvas(R);
        let r = parseFloat(R).toFixed(3);
        if (isNaN(r)) {
            document.getElementById("r").style.borderBottom ="1px solid #e0e0e0";
            let incr = 1;
            while (incr < document.getElementById("r").options.length) {
                document.getElementById("r").options.item(incr).style = 'background-color: lightblue;';
                incr++;
            }
        } else {
            context.strokeStyle = 'rgb(255,0,0)';
            context.fillStyle = 'rgb(255,0,0)';
            context.beginPath();
            context.arc(ev.offsetX, ev.offsetY, 2, 0, 2 * Math.PI);
            context.closePath();
            context.fill();
            let x = ((ev.layerX - drawingCanvas.width / 2) / 140 * r).toPrecision(3);
            let y = ((drawingCanvas.height / 2 - ev.layerY) / 140 * r).toPrecision(3);
            request(x, y, r);
        }
    });
    function drawCanvas(r) {
        context.clearRect(0, 0, 400, 400);
        context.strokeStyle = 'rgb(0,0,0)';
        context.strokeRect(0, 0, 400, 400);
        context.lineWidth = 2;
        context.font = "small-caps 12px Arial";
        //отрисовка области
        context.fillStyle = 'rgb(0,155,255)';
        context.fillRect(130, 200, 70, 140);
        // шаблон треугольника
        context.beginPath();
        context.moveTo(200, 200);
        context.lineTo(130, 200);
        context.lineTo(200, 60);
        context.lineTo(200, 200);
        context.closePath();
        context.fill();

        // шаблон треугольника
        //шаблон сектора круга
        context.beginPath();
        context.moveTo(200, 200);
        context.lineTo(200, 100);
        context.arc(200, 200, 70, 1.5 * Math.PI, 0, false);//x и y центра, р адиус, начальная точка, конечная точка , против часовой стрелки
        context.lineTo(200, 200);
        context.closePath();
        context.fill();
        // шаблон сектора круга
        context.fillStyle = 'rgb(0,0,0)';
        // ось  у
        context.beginPath();
        context.moveTo(200, 400);
        context.lineTo(200, 0);
        context.closePath();
        context.stroke();
        // стрелка оси у
        context.beginPath();
        context.moveTo(200, 0);
        context.lineTo(195, 10);
        context.moveTo(200, 0);
        context.lineTo(205, 10);
        context.closePath();
        context.stroke();
        // ось х
        context.beginPath();
        context.moveTo(0, 200);
        context.lineTo(400, 200);
        context.closePath();
        context.stroke();
        // стрелки оси х
        context.beginPath();
        context.moveTo(400, 200);
        context.lineTo(390, 195);
        context.moveTo(400, 200);
        context.lineTo(390, 205);
        context.closePath();
        context.stroke();
        // буквы х и у
        context.fillText("x", 387, 190);
        context.fillText("y", 210, 13);
        // засечики на оси X
        context.beginPath();
        context.moveTo(270, 195);
        context.lineTo(270, 205);
        context.moveTo(340, 195);
        context.lineTo(340, 205);
        context.closePath();
        context.stroke();
        context.beginPath();
        context.moveTo(130, 195);
        context.lineTo(130, 205);
        context.moveTo(60, 195);
        context.lineTo(60, 205);
        context.closePath();
        context.stroke();
        // засечки на оси Y
        context.beginPath();
        context.moveTo(195, 130);
        context.lineTo(205, 130);
        context.moveTo(195, 60);
        context.lineTo(205, 60);
        context.closePath();
        context.stroke();
        context.beginPath();
        context.moveTo(195, 270);
        context.lineTo(205, 270);
        context.moveTo(195, 340);
        context.lineTo(205, 340);
        context.closePath();
        context.stroke();
        // пометки значений засечек
        let halfR;
        if (r === "r") {
            halfR = "R/2"
        } else {
            halfR = r / 2;
        }
        context.fillText(halfR, 263, 190);
        context.fillText(halfR, 210, 133);
        context.fillText(r, 210, 63);
        context.fillText(r, 337, 190);
        context.fillText("-" + halfR, 120, 190);
        context.fillText("-" + halfR, 210, 273);
        context.fillText("-" + r, 55, 190);
        context.fillText("-" + r, 210, 343);
    }
    function setR(r) {
        document.getElementById("r").style = 'background-color: lightblue;';
        if (document.getElementById("r").options.item(0).value === "r") {
            document.getElementById("r").options.remove(0)
        }
        drawCanvas(r);
    }
</script>
</body>
</html>
