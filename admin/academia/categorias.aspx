<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="categorias.aspx.cs" Inherits="admin_academia_categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA- Academia de Fútbol</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE CATEGORIAS </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listCategoria">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newCategoria();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA CATEGORIA
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"  ShowHeaderWhenEmpty="true"
                CssClass="table text-center table-striped table-bordered table-hover table-sm " AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowCustomPaging="True" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="PrecioVenta" HeaderText="Precio" SortExpression="PrecioVenta" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaCategoria<%# Eval("IdCategoriaAcademia") %>" href="javascript:actualizarCategoria(<%# Eval("IdCategoriaAcademia")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaCategoria<%# Eval("IdCategoriaAcademia")%>" href="javascript:eliminarCategoria(<%# Eval("IdCategoriaAcademia") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle BackColor="#47AEC5" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#081A28" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#081A28" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="CategoriaAcademiaBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newCategoria" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nueva Categoria</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Categoria</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdCategoria" />
            <div class="col-xs-12">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12">
                <label for="Precio">Precio:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                    <input class="form-control" min="0" id="Precio" type="number" onkeypress="return NumCheck(event, this)" />
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>

        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarCategoria()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewCategoria()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/categoriaAcademia.js"></script>
</asp:Content>

