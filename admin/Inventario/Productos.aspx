<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Productos.aspx.cs" Inherits="admin_Inventario_Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Productos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE PRODUCTOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listProducto">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newProducto();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO PRODUCTO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm "
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaProducto<%# Eval("IdProducto") %>" href="javascript:actualizarProducto(<%# Eval("IdProducto")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaProducto<%# Eval("IdProducto")%>" href="javascript:eliminarProducto(<%# Eval("IdProducto") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Fotos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning" href="SubirImagenProducto.aspx?ID=<%# Eval("IdProducto")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="PrecioVenta" HeaderText="Precio de Venta" SortExpression="PrecioVenta" />
                    <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoria" ReadOnly="True" SortExpression="Categoria.Nombre" />
                    <asp:BoundField DataField="Medida" HeaderText="Medida/Talla" SortExpression="Medida" />
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProductoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newProducto" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Producto</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Producto</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdProducto" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Categoria:</label>
                    <asp:DropDownList runat="server" ID="IdCategoria" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource1" DataTextField="nombre" DataValueField="id">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectNoEliminados" TypeName="CategoriaDSTableAdapters.tbl_categoriaTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="PrecioVenta">Precio de Venta:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                    <input class="form-control" min="0" id="PrecioVenta" type="number" onkeypress="return NumCheck(event, this)"/>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Medida">Medida/Talla:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-arrow-circle-right"></i></span>
                    <input class="form-control" placeholder="Insertar Medida/Talla" id="Medida" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Costo">Costo:</label>
                <div class=" input-group">
                    <asp:HiddenField ID="Stock" runat="server" />
                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                    <input class="form-control" min="0" id="Costo" type="number" onkeypress="return NumCheck(event, this)"/>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarProducto()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewProducto()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/producto.js"></script>
</asp:Content>
