<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="Evento.aspx.cs" Inherits="carrito_Evento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Eventos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Title-->
    <div class="page-title ">
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
    <%--<div class="parallax">--%>
    <div class="container padding-bottom-2x mb-2 parallax" style="border-radius: 5px;">
        <div class="row align-items-center">
            <asp:Repeater runat="server" ID="RepeaterEvento" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <div class="col-md-5">
                        <img class="d-block w-270 m-auto img-zoom"
                            src="../images/evento/<%# Eval("IdEvento") %>.png" alt="Logo <%# Eval("Nombre") %>" />
                    </div>
                    <div class="col-md-7 text-md-left text-center text-white">
                        <div class="mt-30 hidden-md-up"></div>
                        <h2 class="text-white"><%# Eval("Nombre") %></h2>
                        <h5 class="text-white">DEL <%# Eval("FechaInicioForDisplay") %> AL <%# Eval("FechaInicioForDisplay") %></h5>
                        <h5 class="text-white"><%# Eval("Categoria") %></h5>
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
    </div>
    <%--</div>--%>
    <div class="container padding-bottom-2x mb-2">
        <hr />
        <div class="text-center padding-top-1x mb-30">
            <h2>Equipos</h2>
        </div>
        <div class="row">
            <asp:Repeater runat="server" ID="RepeaterEquipos" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 mb-30 text-center">
                        <img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2 img-zoom"
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectByEvento" TypeName="GrupoEquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="parallax" style="padding: 0px !important; border-radius: 5px;">
            <div class="container">
                <div class="text-left text-white padding-bottom-1x padding-top-1x">
                    <h2 class="text-white margin-bottom-none">Partidos</h2>
                </div>
            </div>
        </div>
        <div class="row padding-top-1x widget widget-featured-posts">
            <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource3">
                <ItemTemplate>
                    <div class="col-lg-2 text-center">
                        <img src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="logo evento" class="logo-equipo d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" />
                        <h5><%# Eval("Equipo.Nombre") %></h5>
                    </div>
                    <div class="col-lg-2 text-center" style="padding-top: .90rem !important;">
                        <div class="row">
                            <h3 class="col-lg-4">
                                <%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreEquipo") : ""%>
                            </h3>
                            <p class="badge badge-primary badge-pill text-center col-lg-4">VS</p>
                            <h3 class="col-lg-4">
                                <%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreRival") : ""%>
                            </h3>
                        </div>
                    </div>
                    <div class="col-lg-2 text-center">
                        <img src="../images/equipos/<%# Eval("IdRival") %>.png" alt="logo evento" class="logo-equipo d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" />
                        <h5><%# Eval("Rival.Nombre") %></h5>
                    </div>
                    <div class="col-lg-2 text-center" style="padding-top: .90rem !important;">
                        <h7 class="entry-title">Lugar: <%# Eval("Cancha.Nombre") %></h7>
                    </div>
                    <div class="col-lg-2 text-center" style="padding-top: .90rem !important;">
                        <h7 class="entry-title"><%# Eval("FechaForDisplay") %>
                            <%# Eval("HoraForDisplay") %></h7>
                    </div>
                    <div class="col-lg-2 text-center" style="padding-top: .90rem !important;">
                        <p class="badge 
                                    <%# Eval("Estado").ToString() == "Pendiente" ? "bg-warning"
                                    : Eval("Estado").ToString() == "En Curso" ? "bg-success"
                                    : Eval("Estado").ToString() == "Finalizado" ? "bg-primary"
                                    : Eval("Estado").ToString() == "Cancelado" ? "bg-danger" : "" %> badge-pill  text-center">
                            <%# Eval("Estado") %>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByEvento" TypeName="FixtureBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idGrupo" QueryStringField="ID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="alert alert-image-bg fade show text-center parallax" style="border-radius: 5px;">
            <asp:Repeater runat="server" ID="Repeater1" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <div class="h3 text-medium text-white">
                        <i class="icon-clock" style="font-size: 33px; margin-top: -5px;"></i>
                        &nbsp;&nbsp;Mantente informado con noticias de nuestro evento&nbsp;&nbsp;&nbsp;
                        <div class="mt-3 hidden-xl-up"></div>
                        <a class="btn btn-primary" href="noticias.aspx?ID=<%# Eval("IdEvento") %>">Ver Noticias</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

