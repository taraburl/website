<%@ Page Title="" Language="C#" MasterPageFile="~/servicios/Servicios.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="servicios_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Mi Perfil</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper row3">
        <main class="hoc container clear">
            <div class="content">
                <div id="servicecontent">
                    <div class="iconserv">
                        <i class="fa fa fa-users wow bounce" data-wow-delay="0.6s" aria-hidden="true"></i>
                    </div>
                    <h1 class="wow bounceInLeft servicetitle" data-wow-delay="0.6s">MI PERFIL</h1>
                </div>
                <div class="block animated flash" id="actual">
                    <div class="one_quarter first">
                        <img src="../images/profile.png" />
                    </div>
                    <div class="two_quarter">
                        <div id="footer" style="padding: 0px !important;">
                            <ul class="nospace linklist contact">
                                <li>
                                    <i class="fa fa-user" aria-hidden="true"></i><span id="nombres"></span>
                                </li>
                                <li>
                                    <i class="fa fa-users" aria-hidden="true"></i><span id="usernames"></span>
                                </li>
                                <li>
                                    <i class="fa fa-envelope" aria-hidden="true"></i><span id="phones"></span>
                                </li>
                                <li>
                                    <i class="fa fa-mobile" aria-hidden="true"></i><span id="cell"></span>
                                </li>
                                <li>
                                    <i class="fa fa-phone" aria-hidden="true"></i><span id="emails"></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="one_quarter">
                        <a class="btn wow zoomIn" data-wow-delay="0.6s" href="javascript:actualizarUser()">Editar</a>
                    </div>
                </div>
                <div id="editar" style="display: none;" class="block animated flash">
                    <div class="block">
                        <asp:HiddenField id="hdnIdUser" runat="server"/>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Nombre">Nombre:</label>
                            <div class=" input-group">
                                <span class="input-group-addon"><i class="fa fa-user-o"></i></span>
                                <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Apellidos">Apellidos:</label>
                            <div class=" input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input class="form-control" placeholder="Insertar Apellidos" id="Apellidos" type="text" />
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <label for="Email">Email:</label>
                            <div class=" input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input class="form-control" placeholder="Insertar Email" id="Email" type="text" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Telefono">Telefono:</label>
                            <div class=" input-group">
                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                <input class="form-control" placeholder="Insertar Nro. de Telefono" id="Telefono" type="text" onkeypress="return isNumberKey(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Celular">Celular:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>
                                <input class="form-control" placeholder="Insertar Nro. de Celular" id="Celular" type="text" onkeypress="return isNumberKey(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <label for="Direccion">Direccion:</label>
                            <div class=" input-group">
                                <span class="input-group-addon"><i class="fa fa-location-arrow"></i></span>
                                <input class="form-control" placeholder="Insertar Direccion" id="Direccion" type="text" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="UserName">Nombre de Usuario:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input class="form-control" placeholder="Insertar Nombre de Usuario" id="UserName" type="text" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Ciudad">Seleccione la Ciudad</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                                <asp:DropDownList runat="server" ID="Ciudad" CssClass="form-control">
                                    <asp:ListItem Text="Santa Cruz" Value="1" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Password">Contraseña:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                <input class="form-control" placeholder="Insertar Contraseña" id="Password" type="password" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-6 col-md-6">
                            <label for="Password2">Repita Contraseña:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                <input class="form-control" placeholder="Repita Contraseña" id="Password2" type="password" />
                            </div>
                        </div>
                    </div>
                    <div style="padding-top: 10px; ">
                        <a class="btn pull-right " href="javascript:guardarUsuario()" style="margin-top: 20px; margin-left: 10px;">Guardar</a>
                        <a class="btn inverse pull-right " href="javascript:cancelnewuser()" style="margin-top: 20px;">Cancelar</a>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>

