<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="inicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SEA - Sports Events Agency</title>
    <meta name="keywords" content="SEA - SPORT EVENT AGENCY" />
    <link href="styles/listas.css" rel="stylesheet" />
    <link href="carrito/css/vendor.min.css" rel="stylesheet" />
    <link href="carrito/css/styles.min.css" rel="stylesheet" />
    <link href="carrito/css/customizer.min.css" rel="stylesheet" />
    <link href="Content/animate.css" rel="stylesheet" />
    <script src="carrito/js/modernizr.min.js"></script>
    <script src="carrito/js/vendor.min.js"></script>
    <script src="carrito/js/scripts.min.js"></script>
    <script src="carrito/css/customizer.min.js"></script>
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="carrito/js/main.js"></script>
    <script src="scripts/jquery.yottie.bundled.js"></script>
    <%--<script src="scripts/smoothScroll.js"></script>--%>
    <script src="scripts/wow.min.js"></script>
    <%--<script src="styles/slick/slick.js"></script>--%>
    <script src="scripts/js.js"></script>
    <script type="text/javascript">
        new WOW().init();
    </script>
</head>
<body>
    <noscript>
      <iframe src="http://www.googletagmanager.com/ns.html?id=GTM-T4DJFPZ" height="0" width="0" style="display: none; visibility: hidden;"></iframe>
    </noscript>
    <div class="offcanvas-container" id="shop-categories">
        <div class="offcanvas-header">
            <h3 class="offcanvas-title">MENU</h3>
        </div>
        <nav class="offcanvas-menu">
            <ul class="menu">
                <li>
                    <span><a href="/index.aspx"><span>Inicio</span></a></span>
                </li>
                <li>
                    <span><a href="http://173.212.197.57:81/" target="_blank"><span>Boliva Soccer Camp 2018</span></a></span>
                </li>
                <li class="has-children">
                    <span>
                        <a href="#">Club Atlético Juniors</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                    <ul class="offcanvas-submenu">
                        <li>
                            <a href="#">Club Atlético Juniors</a>
                        </li>
                        <li>
                            <a href="academia/academia.aspx">Academia de Futbol</a>
                        </li>
                        <li>
                            <a href="carrito/Inscripciones.aspx">Formulario de Inscripcion</a>
                        </li>
                        <li>
                            <a href="carrito/inicio.aspx">Catálogo de Productos</a>
                        </li>
                    </ul>
                </li>
                <li class="has-children">
                    <span>
                        <a href="#">Eventos</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                    <ul class="offcanvas-submenu">
                        <asp:Repeater runat="server" ID="Repeater3" DataSourceID="ObjectDataSource1">
                            <ItemTemplate>
                                <li><a href="evento/Evento.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
                        <%# Eval("Nombre")%>
                        <li><a href="evento/info.aspx">Acerca de Nuestros Eventos</a></li>
                    </ul>
                </li>
                <li>
                    <span><a href="#"><span>Marketing Deportivo</span></a></span>
                </li>
                <li>
                    <span><a href="#">Marketing Deportivo</a></span></li>
                <li>
                    <span><a href="#">Complejo Deportivo</a></span></li>
                <li>
                    <span><a href="#">Students & Athletics</a></span></li>
                <li>
                    <span><a href="#">SEA TV</a></span></li>
            </ul>
        </nav>
    </div>
    <!-- Menu Celulares -->
    <div class="offcanvas-container" id="mobile-menu">
        <a class="account-link" href="/carrito/MiPerfil.aspx">
            <div class="user-ava">
                <img src="" alt="foto-perfil" class="imgPerfil" />
            </div>
            <div class="user-info">
                <h6 class="user-name" id="nombre-perfil-carrito"></h6>
            </div>
        </a>
        <nav class="offcanvas-menu">
            <ul class="menu">
                <li><a href="#">Inicio</a></li>
                <li id="admincell"><a href="admin/index.aspx">Panel Administrador</a></li>
                <li>
                    <span><a href="http://173.212.197.57:81/" target="_blank"><span>Boliva Soccer Camp 2018</span></a></span>
                </li>
                <li class="has-children">
                    <span>
                        <a href="#">Club Atlético Juniors</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                    <ul class="offcanvas-submenu">
                        <li>
                            <a href="#">Club Atlético Juniors</a>
                        </li>
                        <li>
                            <a href="academia/academia.aspx">Academia de Futbol</a>
                        </li>
                        <li>
                            <a href="carrito/Inscripciones.aspx">Formulario de Inscripcion</a>
                        </li>
                        <li>
                            <a href="carrito/inicio.aspx">Catálogo de Productos</a>
                        </li>
                    </ul>
                </li>
                <li class="has-children">
                    <span>
                        <a href="#">Eventos</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                    <ul class="offcanvas-submenu">
                        <asp:Repeater runat="server" ID="Repeater2" DataSourceID="ObjectDataSource1">
                            <ItemTemplate>
                                <li><a href="evento/Evento.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <li><a href="evento/info.aspx">Acerca de Nuestros Eventos</a></li>
                    </ul>
                </li>
                <li><a href="#">Marketing Deportivo</a></li>
                <li><a href="#">Marketing Deportivo</a></li>
                <li><a href="#">Complejo Deportivo</a></li>
                <li><a href="#">Students & Athletics</a></li>
                <li><a href="#">SEA TV</a></li>
            </ul>
        </nav>
    </div>
    <!-- Topbar-->
    <div class="topbar">
        <div class="topbar-column">
            <a class="hidden-md-down" href="mailto:info@sea.com.bo">
                <i class="icon-mail"></i>&nbsp; info@sea.com.bo</a>
            <a class="hidden-md-down" href="tel:00331697720">
                <i class="icon-bell"></i>&nbsp; +591 347-4704</a>
            <a class="social-button sb-twitter shape-none sb-dark" href="https://twitter.com/SEA_SRL" target="_blank">
                <i class="socicon-twitter"></i></a>
            <a class="social-button sb-facebook shape-none sb-dark" href="https://www.facebook.com/sports.events.agency/" target="_blank">
                <i class="socicon-facebook"></i></a>
            <a class="social-button sb-youtube shape-none sb-dark" href="https://www.youtube.com/user/SportsEventsAgency" target="_blank">
                <i class="socicon-youtube"></i></a>
            <a class="social-button sb-instagram shape-none sb-dark" href="https://www.instagram.com/sea_srl/?hl=es" target="_blank">
                <i class="socicon-instagram"></i></a>
        </div>
    </div>
    <header class="navbar navbar-sticky">
        <div class="site-branding">
            <div class="inner">
                <!-- Off-Canvas Toggle (#shop-categories)-->
                <a class="offcanvas-toggle cats-toggle" href="#shop-categories"
                    data-toggle="offcanvas"></a>
                <!-- Off-Canvas Toggle (#mobile-menu)-->
                <a class="offcanvas-toggle menu-toggle" href="#mobile-menu"
                    data-toggle="offcanvas"></a>
                <!-- Site Logo-->
                <a class="site-logo" href="#">
                    <img src="/images/logo.png" alt="SEA-logo" style="width: 50px !important;" /></a>
            </div>
        </div>
        <!-- Main Navigation-->
        <nav class="site-menu">
            <ul>
                <li><a href="#"><span>Inicio</span></a></li>
                <li>
                    <a href="#"><span>Club Atlético Juniors</span></a>
                    <ul class="sub-menu">
                        <li><a href="http://173.212.197.57:81/" target="_blank">Bolivia Soccer Camp 2018</a></li>
                        <li><a href="#">Club Atlético Juniors</a></li>
                        <li><a href="academia/academia.aspx">Academia de Fútbol</a></li>
                        <li><a href="carrito/inicio.aspx">Catálogo de Productos</a></li>
                        <li><a href="carrito/inscripciones.aspx">Inscripciones</a></li>
                    </ul>
                </li>
                <li><a href="#"><span>Eventos</span></a>
                    <ul class="sub-menu">
                        <asp:Repeater runat="server" ID="Repeater1" DataSourceID="ObjectDataSource1">
                            <ItemTemplate>
                                <li><a href="evento/Evento.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--<li><a href="evento/listanoticias.aspx">Noticias</a></li>--%>
                        <li><a href="evento/info.aspx">Acerca de Nuestros Eventos</a></li>
                    </ul>
                </li>
                <li><a href="#"><span>Marketing Deportivo</span></a></li>
                <li><a href="#"><span>Complejo Deportivo</span></a></li>
                <li><a href="#"><span>Students & Athletics</span></a></li>
                <li><a href="#"><span>SEA TV</span></a></li>
            </ul>
        </nav>
        <!-- Toolbar-->
        <div class="toolbar">
            <div class="inner">
                <div class="tools">
                    <div class="cart" id="UseriIcons">
                        <a href="#"></a><i class="icon-head"></i>
                        <ul class="toolbar-dropdown">
                            <li class="sub-menu-user">
                                <div class="user-ava">
                                    <img src="" alt="perfil" class="imgPerfil" />
                                </div>
                                <div class="user-info">
                                    <h6 class="user-name" style="color: #081A28;" id="nombre-carrito-user"></h6>
                                </div>
                            </li>
                            <li><a href="/carrito/MiPerfil.aspx">Mi Perfil</a></li>
                            <li id="admin"><a href="/admin/index.aspx">Panel Administrador</a></li>
                            <li class="sub-menu-separator"></li>
                            <li><a href="javascript:logout();"><i class="icon-unlock"></i>Salir</a></li>
                        </ul>
                    </div>
                    <div class="cart" id="loginIcons" style="display: none;">
                        <a href="#"></a><i class="icon-head"></i>
                        <ul class="toolbar-dropdown">
                            <li><a href="/login.aspx"><i class="icon-unlock"></i>Iniciar Sesion</a></li>
                        </ul>
                    </div>
                    <div class="cart" id="CartIcons">
                        <a href="/carrito/MiCarrito.aspx"></a>
                        <i class="icon-bag"></i>
                        <span class="count" id="cantProductos">0</span>
                        <span class="subtotal" id="Total">0</span>
                        <div class="toolbar-dropdown">
                            <div id="detallePedido"></div>
                            <div class="toolbar-dropdown-group">
                                <div class="column">
                                    <span class="text-lg">Total:</span>
                                </div>
                                <div class="column text-right">
                                    <span class="text-lg text-medium" id="TotalDetalle"></span>
                                </div>
                            </div>
                            <div class="toolbar-dropdown-group">
                                <div class="column text-black">
                                    <a class="btn btn-sm btn-rounded btn-block btn-secondary" href="carrito/MiCarrito.aspx">Ver Carrito</a>
                                </div>
                                <div class="column">
                                    <a class="btn btn-sm btn-rounded btn-block btn-success" href="javascript:finalizar()">Finalizar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="offcanvas-wrapper">
        <form id="form1" runat="server">
            <section class="hero-slider" id="main-carousel">
                <div class="owl-carousel large-controls dots-inside" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 7000 }">
                    <div class="item">
                        <div class="image fw-section" style="background-image: url(images/background1.jpg);">
                            <span class="overlay" style="opacity: .25;"></span>
                        </div>
                        <div class="container padding-top-3x">
                            <div class="row right">
                                <div class="col-lg-12 col-md-6 padding-bottom-2x text-md-right text-right align-text-top">
                                    <div class="from-left  col-12 col-lg-5" style="float: right;">
                                        <div class="h2 text-body mb-2 pt-1 text-bold text-white text-bold">SEA SRL nace en Bolivia el año 2013 bajo la motivación de nuestros directores de poder aportar y apoyar al deporte en nuestro país.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="bg-white">
                <h4 class="text-left sponsors-title margin-bottom-none">Con el Apoyo de</h4>
                <div class="owl-carousel" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;loop&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 4000, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:2}, &quot;470&quot;:{&quot;items&quot;:3},&quot;630&quot;:{&quot;items&quot;:4},&quot;991&quot;:{&quot;items&quot;:5},&quot;1200&quot;:{&quot;items&quot;:6}} }">
                    <asp:Repeater runat="server" DataSourceID="odsSponsorDS" ID="Repeater4">
                        <ItemTemplate>
                            <img class="d-block w-110 m-auto" src="images/sponsors/<%# Eval("ID") %>.png" alt="<%# Eval("Nombre") %>" style="object-fit: contain; height: 80px;" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>
            <div class="mb-2 padding-top-1x container-index">
                <div class="row">
                    <div class="col-lg-12 col-md-12 order-md-1">
                        <div class="row">
                            <%# Eval("Nombre")%>
                            <div class="col-sm-12 col-md-4 col-lg-4 col-12 pb-2  pb-3 zoomIn" data-wow-delay="0.6s">
                                <a class="twitter-timeline"
                                    data-lang="es"
                                    data-height="500"
                                    target="_blank"
                                    href="https://twitter.com/SEA_SRL?ref_src=twsrc%5Etfw">SEA - Tweets</a>
                                <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4 col-12 pb-2">
                                <section style="min-height: 500px !important;">
                                    <div class="justify-content-center">
                                        <div class="col-lg-12 padding-right-none padding-left-none">
                                            <div class="fw-section rounded padding-top-1x padding-bottom-1x" style="background-image: url(images/mision.jpg); min-height: 500px !important;">
                                                <span class="overlay rounded" style="opacity: .35;"></span>
                                                <div class="text-center m-5">
                                                    <h5 class="display-4 text-normal text-white text-shadow mb-1">MISION</h5>
                                                    <h6 class="d-inline-block text-normal
                                                         text-white text-shadow border-default
                                                         border-left-0 border-right-0 mb-4">Ayudar a la mejora del bienestar de las personas mediante la práctica del deporte,
                                                        con ética profesional mediante el Marketing Deportivo.</h6>
                                                    <h5 class="display-4 text-normal text-white text-shadow mb-1">VISION</h5>
                                                    <h6 class="d-inline-block text-normal
                                                         text-white text-shadow border-default
                                                         border-left-0 border-right-0 mb-4">Ser una corporación deportiva líder y de referencia a nivel nacional,
                                        mediante nuestras unidades de negocios buscamos fomentar la práctica del deporte sano, el respeto mutuo y el trabajo en equipo.</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <%# Eval("Nombre")%>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4 col-12 pb-2">
                                <div class="fb-page"
                                    data-href="https://www.facebook.com/sports.events.agency/"
                                    data-tabs="timeline" data-width="500"
                                    data-height="500"
                                    data-small-header="false"
                                    data-adapt-container-width="true"
                                    data-hide-cover="false"
                                    data-show-facepile="true">
                                    <blockquote cite="https://www.facebook.com/sports.events.agency/"
                                        class="fb-xfbml-parse-ignore">
                                        <a href="https://www.facebook.com/sports.events.agency/">SEA - Sports Events Agency</a>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="padding-bottom-1x mb-2 container-index">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-12 pb-2" id="masleidas">
                        <h3 class="text-muted text-normal text-uppercase padding-top-2x text-bold text-white">NOTICIAS</h3>
                        <hr class="margin-bottom-1x" />
                        <div class="window row">
                            <asp:Repeater runat="server" ID="repeterNoticias" DataSourceID="ObjectDataSource3">
                                <ItemTemplate>
                                    <div class="col-lg-6 col-sm-6 col-12 padding-right-none padding-left-none">
                                        <section class="promo-box" style='background-image: url(images/noticia/<%# Eval("IdNoticia") %>.png); height: 200px !important;'>
                                            <div class="promo-box-content text-center padding-top-3x padding-bottom-2x">
                                                <h4 class="text-bold text-light text-shadow"><%# Eval("Titulo") %></h4>
                                                <a class="btn btn-sm btn-primary btn-rounded" href="evento/noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>">Ver Noticia</a>
                                            </div>
                                        </section>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectAll" TypeName="NoticiaBLL"></asp:ObjectDataSource>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-12 pb-2">
                        <h3 class="text-muted text-normal text-uppercase padding-top-2x text-bold text-white">datos oficiales</h3>
                        <hr class="margin-bottom-1x" />
                        <div class="card-group">
                            <div style="max-height: 610px !important; overflow-y: scroll !important; width: 100%;">
                                <asp:Repeater runat="server" ID="RepeaterPartidos" DataSourceID="odsPartidosActuales">
                                    <ItemTemplate>
                                        <div class="row text-center window text-white" style="margin: 0px 0px 10px 0px; border: 1px solid white; border-radius: 5px; padding: 15px 0px 0px 0px;">
                                            <div class="col-lg-3 col-3 text-center">
                                                <img src="/images/equipos/<%# Eval("IdEquipo") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; margin: auto; height: 50px !important; object-fit: contain;" />
                                                <p><%# Eval("Equipo.Nombre") %></p>
                                            </div>
                                            <div class="col-lg-3 col-6 text-center">
                                                <div class="row">
                                                    <h3 class="col-lg-3 col-3">
                                                        <%# Eval("ScoreEquipo")%>
                                                    </h3>
                                                    <div class="col-lg-6 col-6">
                                                        <p class="badge bg-danger text-center flash animated infinite">VS</p>
                                                    </div>
                                                    <h3 class="col-lg-3 col-3">
                                                        <%# Eval("ScoreRival")%>
                                                    </h3>
                                                    <div class="col-lg-12 col-12">
                                                        <h7 class="entry-title"><%# Eval("Cancha.Nombre") %></h7>
                                                        <p>
                                                            <%# Eval("FechaForDisplay") %>
                                                            <%# Eval("HoraForDisplay") %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-3 text-center">
                                                <img src="/images/equipos/<%# Eval("IdRival") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; height: 50px !important; margin: auto; height: 50px !important; object-fit: contain;" />
                                                <p><%# Eval("Rival.Nombre") %></p>
                                            </div>
                                            <div class="col-lg-3 col-12 text-center">
                                                <img src="/images/evento/<%# Eval("Evento.IdEvento") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; height: 50px !important; object-fit: contain;" />
                                                <p style="font-size: 13px;"><%# Eval("Evento.Nombre") %></p>
                                            </div>
                                        </div>
                                        <div class="divider"></div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:ObjectDataSource runat="server" ID="odsPartidosActuales" SelectMethod="SelectActuales" TypeName="FixtureBLL"></asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="padding-bottom-1x mb-2 container-index">
                <div data-yt
                    data-yt-channel="https://www.youtube.com/channel/UCxqs4wK9T-dvoK235ZNsAPg"
                    data-yt-lang="es"
                    data-yt-header-layout="minimal"
                    data-yt-video-layout="classic"
                    data-yt-header-channel-name=" "
                    data-yt-header-channel-logo="images/logo.png"
                    data-yt-content-columns="4"
                    data-yt-content-rows="2"
                    data-yt-content-auto-pause-on-hover="true"
                    data-yt-content-responsive="%7B%22480%22%3A%7B%22columns%22%3A%221%22%2C%22rows%22%3A%222%22%2C%22gutter%22%3A%2220%22%7D%2C%22600%22%3A%7B%22columns%22%3A%222%22%2C%22rows%22%3A%222%22%2C%22gutter%22%3A%2220%22%7D%2C%22800%22%3A%7B%22columns%22%3A%223%22%2C%22rows%22%3A%222%22%2C%22gutter%22%3A%2220%22%7D%2C%221000%22%3A%7B%22columns%22%3A%224%22%2C%22rows%22%3A%222%22%2C%22gutter%22%3A%2220%22%7D%7D">
                </div>
            </div>
            <div id="contacto" class="container-index padding-bottom-2x" style="background-image: url(images/contactenos.jpg); background-size: cover; background-position: center center;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <h4 class="text-muted text-normal text-uppercase padding-top-2x text-bold text-white">CONTACTANOS</h4>
                            <hr class="margin-bottom-1x" />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="name">Nombre <span>*</span></label>
                                        <asp:TextBox runat="server" ID="name" CssClass="form-control form-control-rounded"></asp:TextBox>
                                        <div class="form-control-feedback">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="name" ErrorMessage="Debe Ingresar su nombre"
                                                ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="email">E-Mail <span>*</span></label>
                                        <asp:TextBox runat="server" ID="email" TextMode="Email" CssClass="form-control form-control-rounded"></asp:TextBox>
                                        <div class="form-control-feedback">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="email" ErrorMessage="Debe Ingresar su E-mail"
                                                ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="url">Asunto <span>*</span></label>
                                        <asp:TextBox runat="server" ID="asunto" CssClass="form-control form-control-rounded"></asp:TextBox>
                                        <div class="form-control-feedback">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="asunto" ErrorMessage="Debe Ingresar el Asunto de la Consulta"
                                                ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="comment">Comentario <span>*</span></label>
                                        <asp:TextBox runat="server" ID="comment" TextMode="MultiLine" Columns="8" CssClass="form-control"></asp:TextBox>
                                        <div class="form-control-feedback">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ControlToValidate="comment" ErrorMessage="Debe Ingresar el Comentario"
                                                ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 text-right">
                                    <div class="form-group">
                                        <asp:LinkButton ID="btnEnviarMail" Text="Enviar" runat="server" CssClass="btn btn-primary"
                                            OnClick="EnviarMail"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <h4 class="text-muted text-normal text-uppercase padding-top-2x text-bold text-white">DONDE ESTAMOS</h4>
                            <hr class="margin-bottom-1x" />
                            <ul class="list-icon text-white">
                                <li><i class="icon-map"></i>Av. Paragua 4to anillo Santa Cruz de la Sierra</li>
                                <li><i class="icon-mail"></i><a class="hidden-md-down text-decoration-none text-white" href="mailto:info@sea.com.bo">info@sea.com.bo</a></li>
                                <li><i class="icon-bell"></i>+59178557777</li>
                                <li><i class="icon-globe"></i>+591 347-4704</li>
                            </ul>
                            <h4 class="text-muted text-normal text-uppercase padding-top-2x text-bold text-white">SIGUENOS EN NUESTRAS REDES SOCIALES</h4>
                            <hr class="margin-bottom-1x" />
                            <a class="social-button shape-circle sb-twitter tw sb-light-skin" href="https://twitter.com/SEA_SRL" target="_blank"><i class="socicon-twitter"></i></a>
                            <a class="social-button shape-circle sb-facebook fb sb-light-skin" href="https://www.facebook.com/sports.events.agency/" target="_blank"><i class="socicon-facebook"></i></a>
                            <a class="social-button shape-circle sb-youtube ln sb-light-skin" href="https://www.youtube.com/user/SportsEventsAgency" target="_blank"><i class="socicon-youtube"></i></a>
                            <a class="social-button shape-circle sb-instagram ins sb-light-skin" href="https://www.instagram.com/sea_srl/?hl=es" target="_blank"><i class="socicon-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <%--<asp:Timer ID="TimerPartidos" runat="server" OnTick="EstadosPartidos" Enabled="true" Interval="100000">
            </asp:Timer>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>
        </form>
        <div class="redes-sociales">
            <ul class="list-unstyled text-center animatedParent animateOnce" data-sequence='300'>
                <li>
                    <a href="https://www.facebook.com/sports.events.agency/" class="icon eft-btn fb animated fadeInUpShort" target="_blank" data-id="2">
                        <i class="socicon-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="https://twitter.com/SEA_SRL" class="icon eft-btn tw animated fadeInUpShort" target="_blank" data-id="1">
                        <i class="socicon-twitter"></i>
                    </a>
                </li>
                <li>
                    <a href="https://www.instagram.com/sea_srl/?hl=es" class="icon eft-btn ins animated fadeInUpShort" target="_blank" data-id="4">
                        <i class="socicon-instagram"></i>
                    </a>
                </li>
                <li>
                    <a href="https://www.youtube.com/user/SportsEventsAgency" class="icon eft-btn ln animated fadeInUpShort" target="_blank" data-id="3">
                        <i class="socicon-youtube"></i>
                    </a>
                </li>
            </ul>
        </div>
        <footer class="site-footer">
            <div class="container">
                <div class="row margin-bottom-2x text-justify">
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/atletico.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <li><a href="#">Club Atletico Juniors</a></li>
                                <li><a href="academia/academia.aspx">Academia de Futbol</a></li>
                                <li><a href="carrito/inicio.aspx">Catalogo de Productos</a></li>
                                <li><a href="carrito/Inscripciones.aspx">Inscripciones</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/logo.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <asp:Repeater runat="server" ID="RepeaterEventos" DataSourceID="ObjectDataSource1">
                                    <ItemTemplate>
                                        <li><a href="evento/Evento.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </section>
                    </div>
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/logo.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <li><a href="#">Marketing Deportivo</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/logo.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <li><a href="#">Complejo Deportivo</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/S&A.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <li><a href="#">Students & Athletics</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="col-lg-2 col-md-3 margin-bottom-1x">
                        <div class="text-center">
                            <img alt="logo" src="images/seatv.png" style="height: 50px;" class="margin-bottom-1x" />
                        </div>
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title"></h3>
                            <ul>
                                <li><a href="#">SEA - TV</a></li>
                            </ul>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <!-- Contact Info-->
                        <section class="widget widget-light-skin">
                            <h3 class="widget-title">Contáctanos</h3>
                            <p class="text-white">Teléfono: +591 347 4704</p>
                            <p class="text-white">Celular: +591 785 57777</p>
                            <p><a class="navi-link-light" href="mailto:info@sea.com.bo">info@sea.comb.bo</a></p>
                            <a class="social-button shape-circle sb-twitter tw sb-light-skin" href="https://twitter.com/SEA_SRL" target="_blank"><i class="socicon-twitter"></i></a>
                            <a class="social-button shape-circle sb-facebook fb sb-light-skin" href="https://www.facebook.com/sports.events.agency/" target="_blank"><i class="socicon-facebook"></i></a>
                            <a class="social-button shape-circle sb-youtube ln sb-light-skin" href="https://www.youtube.com/user/SportsEventsAgency" target="_blank"><i class="socicon-youtube"></i></a>
                            <a class="social-button shape-circle sb-instagram ins sb-light-skin" href="https://www.instagram.com/sea_srl/?hl=es" target="_blank"><i class="socicon-instagram"></i></a>
                        </section>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <!-- Mobile App Buttons-->
                        <section class="widget widget-light-skin">
                            <h3 class="widget-title">Descarga Nuestra 
                                Aplicación
                            </h3>
                            <a class="market-button apple-button mb-light-skin" href="#">
                                <span class="mb-subtitle">Descargar en la </span>
                                <span class="mb-title">App Store</span>
                            </a>
                            <a class="market-button google-button mb-light-skin" href="#">
                                <span class="mb-subtitle">Descargarla en </span>
                                <span class="mb-title">Google Play</span>
                            </a>
                        </section>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <!-- About Us-->
                        <section class="widget widget-links widget-light-skin">
                            <h3 class="widget-title">Acerca de Nosotros</h3>
                            <ul>
                                <li><a href="#">Inicio</a></li>
                                <li><a href="carrito/MiPerfil.aspx">Mi Perfil</a></li>
                            </ul>
                        </section>
                    </div>
                    <h6 class="margin-top-1x ">Con el Apoyo de:</h6>
                    <hr class="hr-light mt-2 margin-bottom-1x text-black" />
                </div>
            </div>
        </footer>
        <div class=" bg-white margin-top-none">
            <div class="container">
                <div class="col-md-12">
                    <div class="margin-bottom-1 row">
                        <asp:Repeater runat="server" DataSourceID="odsSponsorDS" ID="repaterSponsors">
                            <ItemTemplate>
                                <img class="col-6 col-lg-2 col-md-3 col-sm-6"
                                    src="/images/sponsors/<%# Eval("ID") %>.png" alt="<%# Eval("Nombre") %>" style="margin: auto; width: 200px; object-fit: contain; height: 100px;" />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="odsSponsorDS"
                            runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByModulo"
                            TypeName="SponsorDSTableAdapters.tbl_sponsorsTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="modulo" SessionField="modulo" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <div class="row">
                    <!-- Copyright-->
                    <p class="footer-copyright">© Todos los derechos reservado. Desarrollado por<a href="http://www.osbolivia.com/" target="_blank"> &nbsp;OsBolivia</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="pswp__bg"></div>
        <div class="pswp__scroll-wrap">
            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>
            <div class="pswp__ui pswp__ui--hidden">
                <div class="pswp__top-bar">
                    <div class="pswp__counter"></div>
                    <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                    <button class="pswp__button pswp__button--share" title="Share"></button>
                    <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                    <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip"></div>
                </div>
                <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
                <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>
            </div>
        </div>
    </div>
    <a class="scroll-to-top-btn" href="#"><i class="icon-arrow-up"></i></a>
    <div class="site-backdrop"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.11';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>
