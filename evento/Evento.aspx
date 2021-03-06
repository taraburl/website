﻿<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="Evento.aspx.cs" Inherits="carrito_Evento" %>

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
    <div class="container padding-bottom-2x ">
        <asp:HiddenField runat="server" ID="hdnEvento" />
        <div class="row align-items-center fondo-cards">
            <asp:Repeater runat="server" ID="RepeaterEvento" DataSourceID="odsEvento">
                <ItemTemplate>
                    <div class="col-lg-4 card">
                        <div class="card-body">
                            <img class="d-block w-290 m-auto logo-evento" src="../images/evento/<%# Eval("IdEvento") %>.png" alt="Logo <%# Eval("Nombre") %>" />
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="text-md-left text-center text-gris">
                            <div class="mt-30 hidden-md-up"></div>
                            <h2 class="text-gris"><%# Eval("Nombre") %></h2>
                            <h5 class="text-gris">DEL <%# Eval("FechaInicioForDisplay") %> AL <%# Eval("FechaFinForDisplay") %></h5>
                            <h5 class="text-gris"><%# Eval("Categoria") %></h5>
                            <p class="text-justify"><%# Eval("Descripcion") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsEvento" runat="server" SelectMethod="SelectById" TypeName="EventoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="row padding-top-1x">
            <div class="col-lg-12 titulo-seccion">
                <div class="text-center">
                    <h2>Grupos</h2>
                </div>
            </div>
            <div class="accordion padding-left-none padding-right-none col-lg-12" id="accordionGrupos" role="tablist"></div>
        </div>
        <div class="padding-right-none padding-left-none margin-right-none margin-left-none row gallery-wrapper owl-carousel padding-top-1x"
            data-owl-carousel="{ &quot;nav&quot;: false,
             &quot;dots&quot;: false, &quot;loop&quot;: true,
             &quot;margin&quot;: 20, &quot;autoplay&quot;: true, 
            &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},
            &quot;576&quot;:{&quot;items&quot;:2},&quot;991&quot;:{&quot;items&quot;:3},
            &quot;1200&quot;:{&quot;items&quot;:4}} }">
            <asp:Repeater ID="repaterGallery" runat="server" DataSourceID="odsNoticias">
                <ItemTemplate>
                    <div class="gallery-item">
                        <a href="/images/noticia/<%# Eval("IdNoticia") %>.png" data-size="1000x667">
                            <img src="/images/noticia/<%# Eval("IdNoticia") %>.png" alt="<%# Eval("Titulo") %>" class="slider-top" /></a><span class="caption"><%# Eval("Titulo") %></span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource runat="server" ID="odsNoticias" SelectMethod="SelectByEvento" TypeName="NoticiaBLL">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ID" Name="id" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="row padding-top-1x">
            <div class="accordion padding-left-none padding-right-none col-lg-12" id="accordionEquipos" role="tablist">
                <div class="card">
                    <div class="card-header gruposheader" role="tab">
                        <h2>
                            <a class="collapsed text-center text-white" href="#accordTeam" data-toggle="collapse" data-parent="#accordionEquipos">Equipos</a>
                        </h2>
                    </div>
                    <div class="collapse" id="accordTeam" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <asp:Repeater runat="server" ID="Repeater2" DataSourceID="odsEquiposEvento">
                                    <ItemTemplate>
                                        <div class="col-md-3 col-sm-6 col-lg-2 col-6 mb-30 text-center">
                                            <img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img" src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="Equipo" />
                                            <h6><%# Eval("Equipo.Nombre") %></h6>
                                            <p class="text-white">
                                                <%# Eval("Grupo.Nombre") %>
                                            </p>
                                            <div>
                                                <a class="text-medium text-decoration-none" href="jugadores.aspx?ID=<%# Eval("IdEquipo") %>">Ver Jugadores&nbsp;<i class="icon-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:ObjectDataSource ID="odsEquiposEvento" runat="server" SelectMethod="SelectByEvento" TypeName="GrupoEquipoBLL">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="row padding-top-1x">
            <div class="col-lg-12 padding-right-none padding-left-none titulo-seccion">
                <div class="text-center">
                    <h2>Equipos</h2>
                </div>
            </div>
            <div class="col-lg-12 padding-top-1x  equipos-sector">
                <div class="row">
                    <asp:Repeater runat="server" ID="RepeaterEquipos" DataSourceID="odsEquiposEvento">
                        <ItemTemplate>
                            <div class="col-md-3 col-sm-6 col-lg-2 col-6 mb-30 text-center">
                                <img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img" src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="Equipo" />
                                <h6><%# Eval("Equipo.Nombre") %></h6>
                                <p class="text-white">
                                    <%# Eval("Grupo.Nombre") %>
                                </p>
                                <div>
                                    <a class="text-medium text-decoration-none" href="jugadores.aspx?ID=<%# Eval("IdEquipo") %>">Ver Jugadores&nbsp;<i class="icon-arrow-right"></i></a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>--%>
        <div class="row padding-top-1x">
            <div class="col-lg-12 padding-right-none padding-left-none titulo-seccion">
                <div class="text-center">
                    <h2>Datos Oficiales</h2>
                </div>
            </div>
            <div class="padding-left-none padding-right-none col-lg-12">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item"><a class="nav-link active text-white" href="#fixture-tab" data-toggle="tab" role="tab">Fixture</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#pos-tab" data-toggle="tab" role="tab">Tabla de Posiciones</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#gol-tab" data-toggle="tab" role="tab">Tabla de Goleadores</a></li>
                </ul>
                <div class="tab-content" id="tablas-pos">
                    <div class="tab-pane transition fade show active" id="fixture-tab" role="tabpanel">
                        <div class="row widget widget-featured-posts">
                            <div class="col-lg-12 padding-right-none padding-left-none">
                                <asp:Repeater runat="server" ID="RepeaterJugadores" DataSourceID="ObjectDataSource3">
                                    <ItemTemplate>
                                        <div class="row fixture-colum">
                                            <div class="col-lg-2 col-3 text-center">
                                                <img src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="<%# Eval("Equipo.Nombre") %>" class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img-fixture" />
                                                <h5><%# Eval("Equipo.Nombre") %></h5>
                                            </div>
                                            <div class="col-lg-1 col-1 text-center padding-top-1x">
                                                <h1><%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreEquipo") : ""%></h1>
                                            </div>
                                            <div class="col-lg-1 col-4 text-center" style="padding-top: 35px !important;">
                                                <h1 class="badge 
                                                <%# Eval("Estado").ToString() == "Pendiente" ? "bg-success"
                                                : Eval("Estado").ToString() == "En Curso" ? "bg-danger animated flash infinite"
                                                : Eval("Estado").ToString() == "Finalizado" ? "bg-primary"
                                                : Eval("Estado").ToString() == "suspendido" ? "bg-danger" : "" %> badge-pill  text-center">
                                                    <%# Eval("Estado").ToString() == "Pendiente" ? "VS" : Eval("Estado")%>
                                                </h1>
                                            </div>
                                            <div class="col-lg-1 col-1 text-center  padding-top-1x">
                                                <h1><%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreRival") : ""%></h1>
                                            </div>
                                            <div class="col-lg-2 col-3 text-center">
                                                <img src="../images/equipos/<%# Eval("IdRival") %>.png" alt="<%# Eval("Rival.Nombre") %>" class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img-fixture" />
                                                <h5><%# Eval("Rival.Nombre") %></h5>
                                            </div>
                                            <div class="col-lg-3 col-6 text-center text-white" style="padding-top: .90rem !important;">
                                                <h5 class="entry-title">
                                                    <%# Eval("Cancha.Nombre") %><br />
                                                    <%# Eval("FechaForDisplay") %>
                                                    <%# Eval("HoraForDisplay") %>
                                                </h5>
                                            </div>
                                            <div class="col-lg-2 col-6 text-center" style="padding-top: .90rem !important;">
                                                <a class="btn btn-primary btn-sea" href="estadisticas.aspx?ID=<%# Eval("IdFixture") %>">Estadisticas</a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByEvento" TypeName="FixtureBLL">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="idGrupo" QueryStringField="ID" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane transition fade scale" id="pos-tab" role="tabpanel">
                    </div>
                    <div class="tab-pane transition fade scale" id="gol-tab" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="3"></th>
                                        <th class="ancho-tbl">PJ</th>
                                        <th class="ancho-tbl">GOLES</th>
                                    </tr>
                                </thead>
                                <tbody id="table-gol">
                                    <asp:Repeater runat="server" ID="repeaterGoles" DataSourceID="odsGoles">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="ancho-tbl">
                                                    <img src='../images/jugadores/<%# Eval("Jugador.IdJugadorEquipo")%>.png' alt='<%# Eval("Jugador.Nombre")%>' class="img-jugador" /></td>
                                                <td class="ancho-tbl">
                                                    <img src='../images/equipos/<%# Eval("Jugador.Equipo.IdEquipo")%>.png' alt='<%# Eval("Jugador.Equipo.Nombre")%>' /></td>
                                                <td class="text-left"><%# Eval("Jugador.Nombre") %><br />
                                                    <span class="text-muted"><%# Eval("Jugador.Equipo.Nombre") %></span></td>
                                                <td><%# Eval("PartidosJugados")%></td>
                                                <td><%# Eval("Gol")%></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:ObjectDataSource runat="server" ID="odsGoles" SelectMethod="SelectByEvento" TypeName="GolesBLL">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="ID" Name="idEvento" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row padding-top-1x">
            <div class="col-xl-12 col-lg-12 padding-right-none padding-left-none" style="min-height: 200px;">
                <asp:Repeater runat="server" ID="Repeater1" DataSourceID="odsEvento">
                    <ItemTemplate>
                        <div class="img-cover rounded" style="background-image: url(/images/publicidad/<%# Eval("IdEvento")%>.jpg); background-size: cover; object-fit: contain !important;"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script src="../carrito/js/evento.js"></script>
</asp:Content>

