<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="MiPerfil.aspx.cs" Inherits="carrito_MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Mi Perfil</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Mi Perfil</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a>
                    </li>
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
                            <img src="" alt="User" class="imgPerfil"/>
                        </div>
                        <div class="user-data">
                            <h4 class="user-name"></h4>
                        </div>
                    </div>
                </aside>
                <nav class="list-group">
                    <a class="list-group-item active" href="#">
                        <i class="icon-head"></i>Mi Perfil
                    </a>
                    <a class="list-group-item" href="#">
                        <i class="pe-7s-cart"></i>Mis Compras
                    </a>
                    <a class="list-group-item" href="CambiarPassword.aspx">
                        <i class="pe-7s-lock"></i>Cambiar Contraseña
                    </a>
                </nav>
            </div>
            <div class="col-lg-8">
                <div class="padding-top-2x mt-2 hidden-lg-up"></div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Nombre">Nombre</label>
                            <input class="form-control" type="text" id="Nombre" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Apellido">Apellido</label>
                            <input class="form-control" type="text" id="Apellido" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Email">E-Mail</label>
                            <input class="form-control" type="email" id="Email" disabled />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Telefono">Telefono</label>
                            <input class="form-control" type="text" id="Telefono" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Celular">Celular</label>
                            <input class="form-control" type="text" id="Celular" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Direccion">Direccion</label>
                            <input class="form-control" type="text" id="Direccion" />
                        </div>
                    </div>
                    <div class="col-12">
                        <hr class="mt-2 mb-3">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <label class="custom-control custom-checkbox d-block">
                            </label>
                            <a class="btn btn-primary margin-right-none" href="#">Actualizar Perfil</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/miperfil.js"></script>
</asp:Content>

