<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Inventario.aspx.cs" Inherits="admin_Inventario_Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Inventario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE INVENTARIOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listInventario">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newInventario();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO INVENTARIO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm "
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                             <%#Eval("EstadoForDisplay").ToString() == "Consolidado" ?
                                     "" :
                                     String.Format("<a class='btn btn-block btn-info actualizarFilaInventario{0}' href='javascript:actualizarInventario({0})'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a>",
                                     Eval("IdInventario")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaInventario<%# Eval("IdInventario")%>" href="javascript:eliminarInventario(<%# Eval("IdInventario") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IdInventario" HeaderText="Codigo" SortExpression="IdInventario" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Usuario.Username" HeaderText="Usuario" SortExpression="Usuario.Username" />
                    <asp:BoundField DataField="Glosa" HeaderText="Glosa" SortExpression="Glosa" />
                    <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" SortExpression="FechaForDisplay" />
                    <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                    <asp:BoundField DataField="EstadoForDisplay" HeaderText="Estado" SortExpression="EstadoForDisplay" />
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="InventarioBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-info" id="newInventario" style="display: none;">
        <asp:HiddenField ID="hdnIdInventario" runat="server"/>
        <div class="box-header with-border" id="new">
            <h3>Nuevo Inventario</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Inventario</h3>
        </div>
        <div class="box-body with-border">
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Tipo de Inventario:</label>
                    <select class="form-control select2" id="TipoInventario" style="width: 100%;">
                        <option value="Ingreso" selected="selected">Ingreso</option>
                        <option value="Egreso">Egreso</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Glosa:</label>
                    <textarea class="form-control" id="Glosa" rows="3" placeholder="Glosa..."></textarea>
                </div>
            </div>
            <div class="col-xs-12">
                <h4>Listado de Productos</h4>
            </div>
            <div class="col-xs-12 table-responsive">
                <asp:GridView runat="server" ID="ListadoDeProductos"
                    CssClass="table text-center table-striped table-bordered table-hover table-sm "
                    AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="IdProducto" HeaderText="Codigo de Producto" SortExpression="IdProducto" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="PrecioVenta" HeaderText="Precio de Venta" SortExpression="PrecioVenta" />
                        <asp:BoundField DataField="Medida" HeaderText="Medida/Talla" SortExpression="Medida" />
                        <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoria" SortExpression="Categoria.Nombre" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock Actual" SortExpression="Stock" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <input type="hidden" value="<%# Eval("Stock")%>" id="stock<%# Eval("IdProducto")%>" class="stockProducto"/>
                                <input type="text" id='Pro<%# Eval("IdProducto")%>' value="0" class="CantProd" onkeypress="return isNumberKey(this);"/>
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
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="ProductoBLL"></asp:ObjectDataSource>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarInventario()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewInventario()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/inventario.js"></script>
</asp:Content>
