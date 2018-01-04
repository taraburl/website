<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="admin_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Usuarios</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE USUARIOS</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listauser">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:nuewuser();"><i class="fa fa-plus" aria-hidden="true"></i>NUEVO USUARIO</a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsUsuarios"
                CssClass="table table-striped table-bordered table-hover table-sm " CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaUsuario<%# Eval("id") %>" href="javascript:actualizarUser(<%# Eval("id")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaUsuario<%# Eval("id")%>" href="javascript:eliminarUsuario(<%# Eval("id") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
                    <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="email" />
                    <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                    <asp:BoundField DataField="username" HeaderText="Nombre de Usuario" SortExpression="username" />
                    <asp:BoundField DataField="tipo" HeaderText="Tipo de Usuario" SortExpression="tipo" />

                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#081A28" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#081A28" />
            </asp:GridView>
            <asp:ObjectDataSource ID="odsUsuarios" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="selectNoEliminados" TypeName="UsuarioDSTableAdapters.tbl_usuariosTableAdapter"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="nuevouser" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Usuario</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Usuario</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdUser" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
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
                    <input class="form-control" min="0" id="Telefono" type="number" onkeypress="return isNumberKey(this);" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Celular">Celular:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>
                    <input class="form-control" min="0" id="Celular" type="number" onkeypress="return isNumberKey(this);" />
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
                <label for="Password">Contraseña:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                    <input class="form-control" placeholder="Insertar Contraseña" id="Password" type="password" />
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <label for="TipoUser">Seleccione el Tipo de Usuario:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                    <asp:DropDownList runat="server" ID="TipoUser" CssClass="form-control">
                        <asp:ListItem Text="Administrador" Value="1" />
                        <asp:ListItem Text="Usuario Normal" Value="0" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <label for="Ciudad">Seleccione la Ciudad</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                    <asp:DropDownList runat="server" ID="Ciudad" CssClass="form-control">
                        <asp:ListItem Text="Santa Cruz" Value="1" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarUsuario()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewuser()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="scripts/users.js"></script>
</asp:Content>

