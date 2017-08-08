<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SEA - Sport Event Agency</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' />
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Montserrat:400,700' />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="styles/login.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="info">
            <h1></h1>
        </div>
    </div>
    <form runat="server">
        <div class="form">
            <div id="SignUp" class="login-form" runat="server" style="display: none;">
                <h1>
                    <img src="images/logo.png" style="width: 100px; margin: auto;" class="img-responsive" alt="logo img" />
                </h1>
                <div class="form-group sign-name">
                    <asp:TextBox CssClass="form-control" placeholder="Nombre" ID="Nombre" runat="server"></asp:TextBox>
                </div>
                <div class="form-group sign-last">
                    <asp:TextBox CssClass="form-control" placeholder="Apellidos" ID="Apellidos" runat="server"></asp:TextBox>
                </div>
                <div class="form-group sign-user">
                    <asp:TextBox CssClass="form-control" placeholder="Nombre de Usuario" ID="NombreUsuario" runat="server"></asp:TextBox>
                </div>
                <div class="form-group sign-pass">
                    <asp:TextBox CssClass="form-control" placeholder="Contraseña" ID="Contrasena" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group sign-pass2">
                    <asp:TextBox CssClass="form-control" placeholder="Repita Contrasenña" ID="Contrasena2" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group sign-email">
                    <asp:TextBox CssClass="form-control" placeholder="Email" ID="Email" runat="server"></asp:TextBox>
                </div>
                <a class="sign-btn" href="javascript:insertUser()">Crear Cuenta</a>
                <p style="text-align: center;">
                    Ya tienes una cuenta?<a href="javascript:mostrarLogIn()">Iniciar Sesion</a><br />
                    <a href="javascript:mostrarChangePassword()">Olvidó su Contraseña?</a><br />
                    <a href="index.aspx">Ir al Inicio</a>
                </p>
            </div>
            <div id="LogIn" class="login-form" runat="server">
                <h1 class="center-block">
                    <img src="images/logo.png" style="width: 100px; margin: auto; display: contents;" class="img-responsive" alt="logo img" />
                </h1>
                <div class="form-group log-name">
                    <asp:TextBox CssClass="form-control" placeholder="Usuario" ID="UserName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group log-pass">
                    <asp:TextBox CssClass="form-control" placeHolder="Contraseña" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <a href="javascript:logInUser()" class="log-btn">Iniciar Sesion</a>
                <p style="text-align: center;">
                    No estas Registrado? <a href="javascript:mostrarSignUp()">Crear Cuenta</a><br />
                    <a href="javascript:mostrarChangePassword()">Olvidó su Contraseña?</a><br />
                    <a href="Index.aspx">Ir al Inicio</a>
                </p>
            </div>
            <div id="changePassword" class="login-form" runat="server" style="display: none;">
                <h1 class="center-block">
                    <img src="images/logo.png" style="width: 100px; margin: auto; display: contents;" class="img-responsive" alt="logo img" />
                </h1>
                <div class="form-group email-change">
                    <asp:TextBox CssClass="form-control" placeholder="Inserte su Correo Electronico" ID="emailpassword" runat="server"></asp:TextBox>
                </div>
                <a href="javascript:changePassword()" class="log-btn">Restablecer Contraseña</a>
                <p style="text-align: center;">
                    No estas Registrado? <a href="javascript:mostrarSignUp()">Crear Cuenta</a><br />
                    Ya tienes una cuenta?<a href="javascript:mostrarLogIn()">Iniciar Sesion</a><br />
                    <a href="Index.aspx">Ir al Inicio</a>

                </p>
            </div>
        </div>
    </form>
    <video id="video" autoplay="autoplay" loop="loop" poster="images/background1.jpg" muted="muted">
        <source src="videos/login.mp4" type="video/mp4" />
    </video>
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/login.js"></script>
    <script src="scripts/js/login.js"></script>
</body>
</html>
