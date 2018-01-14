<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="jugadores.aspx.cs" Inherits="admin_eventos_jugadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Jugadores del Equipo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:repeater runat="server" id="RepeaterTitle" datasourceid="ObjectDataSource2">
        <ItemTemplate>
            <h1>LISTADO DE JUGADORES: <%# Eval("Nombre") %></h1>
        </ItemTemplate>
    </asp:repeater>
    <asp:objectdatasource id="ObjectDataSource2" runat="server" selectmethod="SelectById" typename="EquipoBLL">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:objectdatasource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listJugador">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:agregarJugador();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO JUGADOR
            </a>
            <a class="btn btn-default pull-right btn-lg" href="equipos.aspx"><i class="fa fa-times" aria-hidden="true"></i>Atras</a>
        </div>
        <div class="box-body table-responsive">
            <asp:gridview
                runat="server"
                id="GridView1"
                datasourceid="ObjectDataSource1"
                allowpaging="True"
                autogeneratecolumns="False"
                cssclass="table table-striped table-bordered table-hover table-sm"
                cellpadding="4" forecolor="#333333" gridlines="None" EmptyDataText="No se encuentran Registros">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Posicion" HeaderText="Posicion" SortExpression="Posicion" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaJugadorEquipo<%# Eval("IdJugadorEquipo") %>" href="javascript:actualizarJugadorEquipo(<%# Eval("IdJugadorEquipo")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaJugadorEquipo<%# Eval("IdJugadorEquipo")%>" href="javascript:eliminarJugadorEquipo(<%# Eval("IdJugadorEquipo") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Foto">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning btn-circle" href="SubirImagenJugador.aspx?ID=<%# Eval("IdJugadorEquipo")%>&Equipo=<%# Eval("IdEquipo") %>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
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
            </asp:gridview>
            <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="SelectByTipo" typename="JugadorEquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:objectdatasource>
        </div>
    </div>
    <div class="box box-warning" id="addJugadores" style="display: none;">
        <div class="box-header with-border">
            <h3>Agregar Jugadores</h3>
        </div>
        <div class="box-body">
            <asp:hiddenfield runat="server" id="hdnEquipo" />
            <asp:hiddenfield runat="server" id="hdnJugadorEquipo" />
            <div class="col-xs-12 margin">
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre del Jugador" id="NombreJugador" type="text" />
                </div>
            </div>
            <div class="col-xs-12 margin">
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Posicion del Jugador" id="Posicion" type="text" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-info btn-lg" href="javascript:nuevoJugador()">Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/equipo.js"></script>
</asp:Content>

