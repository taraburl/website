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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectByEquipo" TypeName="GrupoEquipoBLL">
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
                    <div class="col-lg-6 col-md-6 col-sm-12 entry">
                        <div class="entry-thumb">
                            <a href="#">
                                <img src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="logo evento" class="logo-equipo" />
                            </a>
                        </div>
                        <div class="entry-content" style="width: 25% !important; word-wrap: break-word;">
                            <h4 class="entry-title"><a href="#"><%# Eval("Equipo.Nombre") %></a></h4>
                        </div>
                        <div class="text-center" style="width: 100%; padding-top: .90rem !important;">
                            <p class="badge badge-primary badge-pill text-center">VS</p>
                        </div>
                        <div class="entry-content text-right" style="padding-right: 5px !important;">
                            <h4 class="entry-title"><a href="#"><%# Eval("Rival.Nombre") %></a></h4>
                        </div>
                        <div class="entry-thumb">
                            <a href="#">
                                <img src="../images/equipos/<%# Eval("IdRival") %>.png" alt="logo evento" class="logo-equipo" />
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 entry text-center">
                        <div class="entry-content">
                            <h5 class="entry-title"><a href="#">Lugar: <%# Eval("Cancha.Nombre") %></a></h5>
                        </div>
                        <div class="entry-content">
                            <h5 class="entry-title"><a href="#"><%# Eval("FechaForDisplay") %>
                                <%# Eval("HoraForDisplay") %></a></h5>
                        </div>
                        <div class="entry-content" style="padding-top: .90rem !important;">
                            <p class="badge badge-warning badge-pill text-center">ESTADO</p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByGrupo" TypeName="FixtureBLL">
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

