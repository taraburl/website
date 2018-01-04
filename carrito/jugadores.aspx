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
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByEquipo" TypeName="GrupoEquipoBLL">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
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
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre del Jugador</th>
                        <th>Posicion</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource2">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Nombre") %></td>
                                <td><%# Eval("Posicion") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                        SelectMethod="SelectByTipo" TypeName="JugadorEquipoBLL">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

