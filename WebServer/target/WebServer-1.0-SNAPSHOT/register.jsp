<%--
  Created by IntelliJ IDEA.
  User: Sandra i Jeremi
  Date: 02.11.2020
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Ivent</title>
    <meta name = "descrition" content = "Duty of this servis is simplify process of hire ilusionist by events organistations."/>
    <meta name="keywords" content="iluzjonists, event"/>
    <meta http-equiv="X-UA-Compatible" content ="IE=edge,chrome=1"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body onload = "hide()">
<div id = "container">
    <div class="block">
        <button>Language</button>
        <button>Kontakt</button><br/>
    </div>
        <div id = "loginPopUp">
            <h1>Ivent</h1>
            <form action="continueRegister" method="post">
            <div class="block">
                <label>Podaj imie:</label>
                <label for="surname"></label><input type="text" id="surname" name="surname"><br><br>
            </div>
            <div class="block">
                <label>Podaj nazwisko:</label>
                <label for="name"></label><input type="text" id="name" name="name"><br><br>
            </div>
            <div class="block">
                <label>Podaj e-mail:</label>
                <label for="mail"></label><input type="text" id="mail" name="mail"><br><br>
            </div>
            <div class="block">
                <label>Podaj haslo:</label>
                <label for="password"></label><input type="password" id="password" name="password"><br><br>
            </div>
            <div class="block">
                <label>Powtorz haslo:</label>
                <label for="rePassword"></label><input type="password" id="rePassword" name="password"><br><br>
            </div>
            <div class="block">
                <label>Wybierz konto:</label>
                <label for="artist"></label><input checked type="radio" id="artist" name="type" value="artist" onclick="hide()"> Artysta
                <label for="company"></label><input type="radio" id="company" name="type" value="company" onclick="show()"> Firma
                <br/>
            </div>
            <div id="hidden">
                <label>Podaj nazwę firmy:</label>
                <label for="companyName"></label><input type="text" id="companyName" name="companyName"><br><br>
            </div>
            <div class="block">
                    <input type="submit" value="Kontynuj" />
            </div>
            </form>
        </div>
    </div>
    <script src="js/popUp.js"></script>
</body>
</html>
