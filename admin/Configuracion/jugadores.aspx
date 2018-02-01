<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="jugadores.aspx.cs" Inherits="admin_Configuracion_jugadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Arbitros</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Arbitros</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listJugadores">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newJugador();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO ARBITRO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server"
                ID="GridView1"
                DataSourceID="ObjectDataSource1"
                AllowPaging="True"
                AllowSorting="False"
                AutoGenerateColumns="False"
                DataKeyNames="IdJugador"
                CssClass="table table-striped table-bordered table-hover table-sm "
                CellPadding="4" ForeColor="#333333" GridLines="None"  ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaJugador<%# Eval("IdJugador") %>" href="javascript:actualizarJugador(<%# Eval("IdJugador")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaJugador<%# Eval("IdJugador")%>" href="javascript:eliminarJugador(<%# Eval("IdJugador") %>)">
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="JugadorBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newJugadores" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Arbrito</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Arbrito</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdJugador" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre Completo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre Completo" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Edad">Edad:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar-times-o"></i></span>
                    <input class="form-control" id="Edad" type="number" min="0" onkeypress="return isNumberKey(this);" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarJugador()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelJugador()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/jugadores.js"></script>
</asp:Content>

