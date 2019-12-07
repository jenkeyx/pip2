<%@ page contentType="text/html;charset=UTF-8" %>
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
    #y{
      font-size: 15px;
      width: 180px;
      border: none;
      border-bottom: 1px solid #e0e0e0;
      background-color: transparent;
      outline: none;
      transition: 0.3s;
      margin-left: 16px
    }
    #y:focus{
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
<script defer src="javaScript.js"></script>
<form action="ControllerServlet" method="get" id="form">
  <table class="animated fadeInUp">
    <tr>
      <td></td>
      <td>
        HERE WILL BE A CANVAS!
      </td>
    </tr>
    <tr>
      <td>Изменение X : </td>
      <td>
        <div class="checkboxArr">
        <label>
        <input type="checkbox" name="checkbox" value="-2" onclick="checkboxOnClick()">
      </label>-2
        <label>
          <input type="checkbox" name="checkbox" value="-1.5" onclick="checkboxOnClick()">
        </label>-1.5
        <label>
          <input type="checkbox" name="checkbox" value="-1" onclick="checkboxOnClick()" >
        </label>-1
        <label>
          <input type="checkbox" name="checkbox" value="-0.5" onclick="checkboxOnClick()">
        </label>-0.5
        <label>
          <input type="checkbox" name="checkbox" value="0" onclick="checkboxOnClick()">
        </label>0
        <label>
          <input type="checkbox" name="checkbox" value="0.5" onclick="checkboxOnClick()">
        </label>0.5
        <label>
          <input type="checkbox" name="checkbox" value="1" onclick="checkboxOnClick()">
        </label>1
        <label>
          <input type="checkbox" name="checkbox" value="1.5" onclick="checkboxOnClick()">
        </label>1.5
        <label>
          <input type="checkbox" name="checkbox" value="2" onclick="checkboxOnClick()">
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
      <td>
        <label><input type="radio" name="r" value="1" checked></label> 1
        <label><input type="radio" name="r" value="2"></label> 2
        <label><input type="radio" name="r" value="3"></label> 3
        <label><input type="radio" name="r" value="4"></label> 4
        <label><input type="radio" name="r" value="5"></label> 5
      </td>
    </tr>
    <tr>
      <td></td>
      <td><button style="width:100px;height:25px" type="button" id="submitButton" onclick="send()">Check</button></td>
    </tr>
  </table>
</form>
</body>
</html>
