<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ventas.aspx.cs" Inherits="admin_ecommerce_ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Ventas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Ventas</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listCategoria">
        <div class="box-header with-border">
            <!-- <a class="btn btn-success btn-lg" href="javascript:newCategoria();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA CATEGORIA
            </a>-->
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm "
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Finalizar">
                        <ItemTemplate>
                            <%#Eval("IdEstadoCompra").ToString() == "2" ?
                                    String.Format("<a class='btn btn-block btn-social-icon btn-info actualizarFilaInscripcion{0}' href='javascript:actualizarInscripcion({0})'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a>", Eval("IdOrdenCompra")):"" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IdOrdenCompra" HeaderText="Codigo" SortExpression="IdOrdenCompra" />
                    <asp:BoundField DataField="Estado.Nombre" HeaderText="Estado" SortExpression="Estado.Nombre" />
                    <asp:BoundField DataField="TipoPago.Nombre" HeaderText="Tipo de Pago" SortExpression="TipoPago.Nombre" />
                    <asp:BoundField DataField="Usuario.Nombre" HeaderText="IdUsuario" SortExpression="Usuario.Nombre" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
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
</asp:Content>

