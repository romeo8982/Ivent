<%--
  Created by IntelliJ IDEA.
  User: Sandra i Jeremi
  Date: 02.11.2020
  Time: 14:01
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
<body>
<div id = "container">
    <div class="block">
        <button>Language</button>
        <button>Kontakt</button><br/>
    </div>
        <div id = "loginPopUp">
            <h1>Ivent</h1>
            <div class="block">
                <label>Podaj E-mail:</label>
                <label for="mail"></label><input type="text" id="mail" name="mail" placeholder="mojEmail@przyklad.pl"><br><br>
            </div>
            <div class="block">
                <label>Podaj hasło:</label>
                <label for="password"></label><input type="password" id="password" name="password"><br><br>
            </div>
            <div class="block">
                <button>Zaloguj</button><br/>
            </div>
            <div class="block">
                <label>Nie masz konta?</label>
                <br/>
                <form action="register.jsp">
                    <input type="submit" value="Zarejestruj" />
                </form>
            </div>
        </div>
    </div>
    <script src="js/popUp.js"></script>
</body>
</html>
