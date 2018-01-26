<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ventas.aspx.cs" Inherits="admin_ecommerce_ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Ventas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Ventas</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listVenta">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newVenta();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA VENTA
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm "
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowCustomPaging="True" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="IdOrdenCompra" HeaderText="Codigo" SortExpression="IdOrdenCompra" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%# Eval("IdEstadoCompra").ToString() == "1" ? 
                                    "<span class='label label-info'>"+Eval("Estado.Nombre")+"</span>" : 
                                    Eval("IdEstadoCompra").ToString() == "2" ?
                                    "<span class='label label-warning'>"+Eval("Estado.Nombre")+"</span>" : 
                                    Eval("IdEstadoCompra").ToString() == "3" ?
                                    "<span class='label label-success'>"+Eval("Estado.Nombre")+"</span>" : 
                                    Eval("IdEstadoCompra").ToString() == "4" ?
                                    "<span class='label label-danger'>"+Eval("Estado.Nombre")+"</span>": 
                                    "<span class='label label-danger'>"+Eval("Estado.Nombre")+"</span>"%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TipoPago.Nombre" HeaderText="Tipo de Pago" SortExpression="TipoPago.Nombre" />
                    <asp:TemplateField HeaderText="Usuario">
                        <ItemTemplate>
                            <%# Eval("Usuario.Nombre") + " " + Eval("Usuario.Apellido")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" SortExpression="FechaForDisplay" />
                    <asp:BoundField DataField="HoraForDisplay" HeaderText="Hora" SortExpression="HoraForDisplay" />
                    <asp:TemplateField HeaderText="Finalizar">
                        <ItemTemplate>
                            <%#Eval("IdEstadoCompra").ToString() == "2" ?
                                    String.Format("<a class='btn btn-block btn-info btn-circle actualizarFilaVenta{0}' href='javascript:actualizarVenta({0})'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a>", Eval("IdOrdenCompra"))
                                    :"" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class='btn btn-block btn-danger btn-circle actualizarFilaVenta<%# Eval("IdOrdenCompra") %>' href="javascript:eliminarVenta(<%# Eval("IdOrdenCompra") %>)"><i class='fa fa-trash' aria-hidden='true'></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#47AEC5" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#081A28" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#081A28" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="OrdenCompraBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div id="newVenta col-lg-12" style="display: block;">
        <div class="row">
            <div class=" col-lg-8 col-md-8 col-sm-12">
                <div class="box box-success">
                    <div class="box-header with-border" id="new">
                        <h3>Nueva Venta</h3>
                    </div>
                    <div class="box-body">
                        <asp:HiddenField runat="server" ID="hdnIdVenta" />
                        <div class="col-xs-12">
                            <label for="buscarPrducto">Buscar Producto</label>
                            <div class="input-group input-group-sm">
                                <input id="buscarProducto" type="text" class="form-control" />
                                <span class="input-group-btn">
                                    <a href="#" class="btn btn-info btn-flat">BUSCAR</a>
                                </span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <h5 class="text-bold">Resultado de Busqueda</h5>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Imagen</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Precio de Venta</th>
                                            <th>Stock</th>
                                            <th>Cantidad</th>
                                            <th>Agregar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" col-lg-4 col-md-4 col-sm-12">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3>Datos de la Venta</h3>
                    </div>
                    <div class="box-body">
                        <div class=" col-xs-12">
                            <label>Seleccionar Cliente</label>
                            <div class="input-group input-group-sm">
                                <asp:DropDownList runat="server" CssClass="form-control select2" Style="width: 100%;" ID="IdUsuario" DataSourceID="ObjectDataSource2" DataTextField="nombre" DataValueField="id">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectUsersNormal" TypeName="UsuarioDSTableAdapters.tbl_usuariosTableAdapter"></asp:ObjectDataSource>
                                <span class="input-group-btn">
                                    <a class="btn btn-info btn-flat" href="#" data-toggle="modal" data-target="#nuevoCliente">NUEVO</a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <a class="btn btn-success btn-lg" href="javascript:guardarVenta()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
                        <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewVenta()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="nuevoCliente" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Insertar Usurio</h4>
                    </div>
                    <div class="modal-body">
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <a href="javascript:guardarUsuario()" class="btn btn-primary">Guardar</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="../scripts/venta.js"></script>
</asp:Content>

