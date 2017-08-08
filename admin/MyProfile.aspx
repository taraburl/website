<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="admin_MyProfile" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Mi Perfil</title>
    <script src="scripts/miperfil.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="row" id="actual">
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img id="imagenp" class="profile-user-img img-responsive img-circle" src="../../dist/img/user4-128x128.jpg" alt="User profile picture" />

                    <h3 class="profile-username text-center" id="nombrep">Nina Mcintire</h3>

                    <p class="text-muted text-center" id="usernamep">Software Engineer</p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>E-mail</b> <a class="pull-right"><span id="emailp"></span></a>
                        </li>
                        <li class="list-group-item">
                            <b>Direccion</b> <a class="pull-right"><span id="direccionp"></span></a>
                        </li>
                        <li class="list-group-item">
                            <b>Telefono</b> <a class="pull-right"><span id="telefonop"></span></a>
                        </li>
                        <li class="list-group-item">
                            <b>Celular</b> <a class="pull-right"><span id="celularp"></span></a>
                        </li>
                    </ul>
                    <a href="javascript:actualizarUser();" class="btn btn-primary btn-block"><b>EDITAR</b></a>
                </div>
            </div>
        </div>
        <div class="row" id="editar" style="display: none;">
            <div class="block">
                <div class="box box-success">
                    <div class="box box-header with-border">
                        <h3 class="box-title">Actualizar Datos de usuarios</h3>
                    </div>
                    <div class="box-body">
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
                    <div class="box box-footer">
                        <a class="btn btn-success btn-lg " href="javascript:guardarUsuario()" style="margin-top: 20px; margin-left: 10px;"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
                        <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewuser()" style="margin-top: 20px;"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

