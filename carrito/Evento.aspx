<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="Evento.aspx.cs" Inherits="carrito_Evento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Eventos</title>
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
                    <li>Eventos</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container padding-bottom-2x mb-2">
        <div class="row align-items-center padding-bottom-2x">
            <asp:Repeater runat="server" ID="RepeaterEvento" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <div class="col-md-5">
                        <img class="d-block w-270 m-auto"
                            src="../images/evento/<%# Eval("IdEvento") %>.png" alt="Logo <%# Eval("Nombre") %>" />
                    </div>
                    <div class="col-md-7 text-md-left text-center">
                        <div class="mt-30 hidden-md-up"></div>
                        <h2><%# Eval("Nombre") %></h2>
                        <h5>DEL <%# Eval("FechaInicioForDisplay") %> AL <%# Eval("FechaInicioForDisplay") %></h5>
                        <h5><%# Eval("Categoria") %></h5>
                        <p><%# Eval("Descripcion") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectById" TypeName="EventoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <hr />
        <div class="text-center padding-top-3x mb-30">
            <h2>Equipos</h2>
            <p class="text-muted">Todos Los equipos que participaran en el Campeonato</p>
        </div>
        <div class="row">
            <asp:Repeater runat="server" ID="RepeaterEquipos" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 mb-30 text-center">
                        <img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2"
                            src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="Equipo" />
                        <h6><%# Eval("Equipo.Nombre") %></h6>
                        <p>
                            Grupo: <%# Eval("Grupo.Nombre") %>
                        </p>
                        <div>
                            <a class="text-medium text-decoration-none" href="jugadores.aspx?ID=<%# Eval("IdEquipo") %>">Ver Jugadores&nbsp;<i class="icon-arrow-right"></i></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectByEquipo" TypeName="GrupoEquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <hr />
        <div class="text-center padding-top-3x mb-30">
            <h2>Partidos</h2>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Equipo 1</th>
                        <th></th>
                        <th>Equipo 2</th>
                        <th>Lugar</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource3">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Equipo.Nombre") %></td>
                                <td>VS.</td>
                                <td><%# Eval("Rival.Nombre") %></td>
                                <td><%# Eval("Cancha.Nombre") %></td>
                                <td><%# Eval("FechaForDisplay") %></td>
                                <td><%# Eval("HoraForDisplay") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByGrupo" TypeName="FixtureBLL">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="idGrupo" QueryStringField="ID" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

