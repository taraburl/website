<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="formapago.aspx.cs" Inherits="admin_Configuracion_formapago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Tipo de Pago</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE TIPOS DE PAGO</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listTipoPago">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newTipoPago();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO TIPO DE PAGO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView
                runat="server"
                ID="GridView1"
                DataSourceID="ObjectDataSource1"
                AllowPaging="True"
                AllowSorting="False"
                AutoGenerateColumns="False"
                DataKeyNames="IdTipoPago"
                CssClass="table table-striped table-bordered table-hover table-sm "
                CellPadding="4" ForeColor="#333333" GridLines="None"  ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdTipoPago" HeaderText="Codigo" SortExpression="IdTipoPago" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaTipoPago<%# Eval("IdTipoPago") %>" href="javascript:actualizarTipoPago(<%# Eval("IdTipoPago")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaTipoPago<%# Eval("IdTipoPago")%>" href="javascript:eliminarTipoPago(<%# Eval("IdTipoPago") %>)">
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="TipoPagoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newTipoPago" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Tipo de Pago</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Tipo de Pago</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdTipoPago" />
            <div class="col-xs-12">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarTipoPago()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelTipoPago()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/tipopago.js"></script>
</asp:Content>

