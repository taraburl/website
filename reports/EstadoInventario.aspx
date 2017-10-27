<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="EstadoInventario.aspx.cs" Inherits="reports_EstadoInventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Estado de Inventario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>ESTADO DE INVENTARIO</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info">
        <div class="box-header with-border">
            <asp:Button runat="server" CssCalss="btn btn-success btn-lg" OnClick="Unnamed1_Click"
                Text="DESCARGAR PDF"/>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView  runat="server" id="GridView1"
                datasourceid="ObjectDataSource1"
                cssclass="table text-center table-striped table-bordered table-hover table-sm "
                autogeneratecolumns="False">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="PrecioVenta" HeaderText="Precio de Venta" SortExpression="PrecioVenta" />
                    <asp:BoundField DataField="Medida" HeaderText="Medida" SortExpression="Medida" />
                    <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoria" SortExpression="Categoria.Nombre" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                </Columns>
            </asp:GridView>
            <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="SelectAll"
                typename="ProductoBLL"></asp:objectdatasource>
        </div>
    </div>
</asp:Content>

