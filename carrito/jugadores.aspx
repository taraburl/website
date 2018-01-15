<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="jugadores.aspx.cs" Inherits="carrito_jugadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Jugadores</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Title-->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Evento</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Jugadores</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container padding-bottom-2x mb-2">
        <div class="text-center">
            <asp:Repeater runat="server" ID="RepeaterDatosEquipo" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2"
                        src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="Equipo" />
                    <h2><%# Eval("Nombre") %></h2>
                    <p class="text-muted mb-2">
                        <asp:Repeater runat="server" ID="RepeaterEvento" DataSourceID="ObjectDataSource3">
                            <ItemTemplate>
                                Grupo: <%# Eval("Grupo.Nombre") %>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" SelectMethod="SelectByEquipo" TypeName="GrupoEquipoBLL">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="ID" Name="id" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectById" TypeName="EquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <br />
        <div class="row">
            <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="col-sm-3 mb-2">
                        <div class="d-table">
                            <img class="d-block w-150 mx-auto img-thumbnail
                                 rounded-circle d-table-cell align-middle"
                                src="../images/jugadores/<%# Eval("IdJugadorEquipo") %>.png" alt="<%# Eval("Nombre") %>">
                            <div class="pl-3 d-table-cell align-middle">
                                <h6><%# Eval("Nombre") %></h6>
                                <p class="text-muted mb-2">Posicion: <%# Eval("Posicion") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                SelectMethod="SelectByEquipo" TypeName="JugadorEquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

