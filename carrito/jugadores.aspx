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
    <div class="container padding-bottom-2x mb-2 equipos-contenedor margin-bottom-2x">
        <div class="text-center datos-equipos">
            <asp:Repeater runat="server" ID="RepeaterDatosEquipo" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img"
                        src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="Equipo" />
                    <h2><%# Eval("Nombre") %></h2>
                    <p class="mb-2">
                        <asp:Repeater runat="server" ID="RepeaterEvento" DataSourceID="ObjectDataSource3">
                            <ItemTemplate>
                                <%# Eval("Grupo.Nombre") %>
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
        <div class="row" style="padding: 20px;">
            <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 col-lg-2 mb-30 text-center">
                        <img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img"
                            src="../images/jugadores/<%# Eval("IdJugadorEquipo") %>.png" alt="<%# Eval("Nombre") %>">
                        <h6><%# Eval("Nombre") %></h6>
                        <p class="text-white mb-2"><%# Eval("Posicion") %></p>
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
    <script src="js/evento.js"></script>
</asp:Content>

