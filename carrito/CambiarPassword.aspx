<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="CambiarPassword.aspx.cs" Inherits="carrito_CambiarPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Cambiar Contraseña</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Mi Perfil</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a></li>
                    <li class="separator">&nbsp;</li>
                    <li><a href="MiPerfil.aspx">Mi Perfil</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>Mi Perfil</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-lg-4">
                <aside class="user-info-wrapper">
                    <div class="user-cover" style="background-image: url(../images/footer.jpg);">
                    </div>
                    <div class="user-info">
                        <div class="user-avatar">
                            <a class="edit-avatar" href="#"></a>
                            <img src="../images/profile.png" alt="User" />
                        </div>
                        <div class="user-data">
                            <h4>Daniel Adams</h4>
                        </div>
                    </div>
                </aside>
                <nav class="list-group">
                    <a class="list-group-item" href="MiPerfil.aspx">
                        <i class="icon-head"></i>Mi Perfil
                    </a>
                    <a class="list-group-item" href="#">
                        <i class="pe-7s-cart"></i>Mis Compras
                    </a>
                    <a class="list-group-item active" href="#">
                        <i class="pe-7s-lock"></i>Cambiar Contraseña
                    </a>
                </nav>
            </div>
            <div class="col-lg-8">
                <div class="padding-top-2x mt-2 hidden-lg-up"></div>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <h2>Cambiar Contraseña?</h2>
                        <p>
                            Puedes Cambiar tu contraseña en tres simples pasos.
                             Esto nos ayuda mantener tu cuenta segura.
                        </p>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>
                                Introduzca su E-mail en el campo de texto de abajo.</li>
                            <li><span class="text-primary text-medium">2. </span>
                                Le enviaremos un E-mail para cambiar su contrasña.</li>
                            <li><span class="text-primary text-medium">3. </span>
                                Usa la URL que le enviaremos para cambiar su contraseña.</li>
                        </ol>
                        <div class="card mt-4">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="Email">Inserte su E-Mail</label>
                                    <input class="form-control" type="text" id="Email" />
                                </div>
                            </div>
                            <div class="card-footer">
                                <a class="btn btn-primary" href="#">Obtener Su Conraseña.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

