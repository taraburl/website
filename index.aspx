<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SEA - Sport Event Agency</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="styles/layout.css" rel="stylesheet" />
    <link href="Content/animate.css" rel="stylesheet" />
    <link href="styles/slick/slick.css" rel="stylesheet" />
    <link href="styles/slick/slick-theme.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/listas.css" rel="stylesheet" />
</head>
<body id="top">
    <form id="form1" runat="server">
        <div class="topspacer bgded overlay" style="background-image: url('images/background1.jpg');">
            <div class="wrapper row0">
                <div id="topbar" class="clear">
                    <div class="fl_left">
                        <ul class="nospace">
                            <li><i class="fa fa-phone"></i>+591 347-4704</li>
                            <li><i class="fa fa-envelope-o"></i>info@sea.com.bo</li>
                        </ul>
                    </div>
                    <div class="fl_right">
                        <ul class="nospace">
                            <li><a href="index.aspx"><i class="fa fa-lg fa-home"></i></a></li>
                            <li id="login"><a href="login.aspx?form=login" runat="server">Iniciar Sesión</a></li>
                            <li id="signup"><a href="login.aspx?form=signup" runat="server">Registrarse</a></li>
                            <li id="miperfil">
                                <img src="images/profile.png" id="imagenperfil" alt="img-perfil" style="width: 10px; height: 10px; border-radius: 50%;" />
                                <a href="~/carrito/MiPerfil.aspx" runat="server"></a></li>
                            <li id="pnladmin" style="display: none;"><a href="admin/index.aspx" runat="server">Panel Adm.</a></li>
                            <li id="logout"><a href="javascript:logout();"><i class="fa fa-sign-out" aria-hidden="true"></i>Salir</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="clear">
                    <div id="logo" class="fl_left">
                        <h1><a href="index.aspx">
                            <img src="images/logo.png" alt="sea" style="width: 60px;" /></a></h1>
                    </div>
                    <nav id="mainav" class="fl_right">
                        <ul class="clear">
                            <li class="active"><a href="index.aspx">Inicio</a></li>
                            <li>
                                <a class="drop" href="#">Eventos</a>
                                <ul>
                                    <asp:Repeater runat="server" ID="Repeater2" DataSourceID="ObjectDataSource2">
                                        <ItemTemplate>
                                            <li><a href="carrito/Evento.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
                                    <%--<li><a href="servicios/EventosDeportivos.aspx">Información</a></li>--%>
                                </ul>
                            </li>
                            <li>
                                <a class="drop" href="#">Marketing Deportivo</a>
                                <ul>
                                    <li><a href="servicios/Marketing.aspx">Marketing Deportivo</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop" href="#">Club Atlético Juniors</a>
                                <ul>
                                    <li><a href="servicios/ClubAtletico.aspx">Club Atletico Juniors</a></li>
                                    <li><a href="servicios/SoccerAcademy.aspx">Academia de Fútbol</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop" href="#">Complejo Deportivo</a>
                                <ul>
                                    <li><a href="servicios/ComplejoDeportivo.aspx">Complejo Deportivo</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop" href="#">Students & Athletics</a>
                                <ul>
                                    <li><a href="servicios/StudentsAthletics.aspx">Students & Athletics</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop" href="#">Sea TV</a>
                                <ul>
                                    <li><a href="#">SEA TV</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </header>
            </div>
            <div id="pageintro" class="hoc clear">
                <article class="col-xs-12 col-sm-6 col-md-6">
                    <h2 class="heading wow zoomIn" data-wow-delay="0.6s">
                        <img src="images/logo.png" alt="sea" style="width: 150px;" />
                    </h2>
                    <p class="wow zoomIn" data-wow-delay="0.6s">SEA SRL nace en Bolivia el año 2013 bajo la motivación de nuestros directores de poder aportar y apoyar al deporte en nuestro país.</p>
                    <footer>
                        <ul class="nospace inline pushright scroll">
                            <li><a class="btn wow zoomIn" data-wow-delay="0.6s" href="#conocenos">Conócenos</a></li>
                            <li><a class="btn inverse wow zoomIn" data-wow-delay="0.6s" href="#comments">Contáctenos</a></li>
                        </ul>
                    </footer>
                </article>
                <article class="col-xs-12 col-sm-6 col-md-6">
                    <a class="twitter-timeline" data-lang="es" data-height="300" target="_blank"
                        href="https://twitter.com/SEA_SRL?ref_src=twsrc%5Etfw">Tweets by SEA_SRL</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </article>
            </div>
        </div>
        <!--AUSPICIADORES-->
        <div class="wrapper clear" style="top: 20%;">
            <div class="auspiciadores-title">
                <p>CON EL APOYO DE:</p>
            </div>
            <section class="center2 slider" id="conocenos">
                <asp:Repeater runat="server" DataSourceID="objSponsorDS" ID="Repeater1">
                    <ItemTemplate>
                        <div class="wow rotateIn" data-wow-delay="0.8s">
                            <img class="ausp" src="/images/sponsors/<%# Eval("ID") %>.png" alt="<%# Eval("Nombre") %>" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </div>
        <div class="wrapper row3" style="top: 20%;">
            <div class="group">
                <div class="">
                    <div class="masonry-grid row">
                        <div class="card masonry-grid-item col-xs-12 col-sm-9 col-md-9 sm-margin-b-30">
                            <div class="card-block masonry-grid">
                                <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6 sm-margin-b-30 wow fadeInUp" data-wow-duration=".3">
                                    <div class="margin-b-60">
                                        <h2>MISIÓN</h2>
                                        <p>
                                            Ayudar a la mejora del bienestar de las personas mediante la práctica del deporte,
                                        con ética profesional mediante el Marketing Deportivo.
                                        </p>
                                    </div>
                                    <img class="full-width img-responsive "
                                        src="images/mision.jpg" alt="Misión"
                                        data-wow-delay=".2s"
                                        style="border-top: 10px solid #47AEC5;" />
                                </div>
                                <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6 wow fadeInUp" data-wow-duration=".3">
                                    <div class="margin-b-60">
                                        <img class="full-width img-responsive"
                                            src="images/vision.jpg" alt="Visión"
                                            data-wow-delay=".3s"
                                            style="border-bottom: 10px solid #47AEC5;" />
                                    </div>
                                    <h2>VISIÓN</h2>
                                    <p>
                                        Ser una corporación deportiva líder y de referencia a nivel nacional,
                                        mediante nuestras unidades de negocios buscamos fomentar la práctica del deporte sano, el respeto mutuo y el trabajo en equipo.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card masonry-grid-item col-xs-12 col-sm-3 col-md-3">
                            <div class="fb-page card-block" data-href="https://www.facebook.com/sports.events.agency/"
                                data-tabs="timeline,events,messages"
                                data-small-header="true"
                                data-width="500"
                                data-adapt-container-width="true"
                                data-hide-cover="false" data-show-facepile="true">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper row3" style="margin-top: 20px; margin-bottom: 20px;">
            <div class="group">
                <article class="col-xs-12 col-sm-6 col-md-6 index-news wow fadeInUp" id="masleidas" data-wow-duration=".3">
                    <h3 class="titulo">NOTICIAS</h3>
                    <div class="window">
                        <asp:Repeater runat="server" ID="repeterNoticias" DataSourceID="ObjectDataSource3">
                            <ItemTemplate>
                                <div class="masleida nomargin">
                                    <a class="foto ajax" href="carrito/noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>">
                                        <img class="lz" src="images/noticia/<%# Eval("IdNoticia")  %>.png" alt="<%# Eval("Descripcion") %>" />
                                    </a>
                                    <h2>
                                        <a class="ajax" href="carrito/noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>">
                                            <strong><%# Eval("Titulo") %></strong>
                                        </a>
                                    </h2>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectAll" TypeName="NoticiaBLL"></asp:ObjectDataSource>
                    </div>
                </article>
                <article class="col-xs-12 col-sm-6 col-md-6 wow fadeInUp" data-wow-duration=".3">
                    <h3 class="partidos">DATOS OFICIALES</h3>
                    <div style="max-height: 600px !important; overflow-y: scroll !important;">
                        <asp:Repeater runat="server" ID="RepeaterPartidos" DataSourceID="odsPartidosActuales">
                            <ItemTemplate>
                                <div class="row text-center window" style="margin: 10px 0px 10px 0px; border: 1px solid gray; border-radius: 6px; padding: 15px 0px 0px 0px;">
                                    <div class="col-lg-3 text-center">
                                        <img src="/images/equipos/<%# Eval("IdEquipo") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; margin: auto; height: 50px !important; object-fit: contain;" />
                                        <h7><%# Eval("Equipo.Nombre") %></h7>
                                    </div>
                                    <div class="col-lg-3 text-center">
                                        <div class="row">
                                            <h3 class="col-lg-3">
                                                <%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreEquipo") : ""%>
                                            </h3>
                                            <div class="col-lg-5" style="padding-top: 2.5rem !important;">
                                                <p class="badge bg-info text-center" style="background-color: #09c !important;">VS</p>
                                            </div>
                                            <h3 class="col-lg-4">
                                                <%# Eval("Estado").ToString() != "Pendiente" ? Eval("ScoreRival") : ""%>
                                            </h3>
                                            <div class="col-lg-12">
                                                <h7 class="entry-title"><%# Eval("Cancha.Nombre") %></h7>
                                                <p>
                                                    <%# Eval("FechaForDisplay") %>
                                                    <%# Eval("HoraForDisplay") %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 text-center">
                                        <img src="/images/equipos/<%# Eval("IdRival") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; margin: auto; height: 50px !important; object-fit: contain;" />
                                        <h7><%# Eval("Rival.Nombre") %></h7>
                                    </div>
                                    <div class="col-lg-3 text-center">
                                        <img src="/images/evento/<%# Eval("Evento.IdEvento") %>.png" alt="logo evento" class="img-rounded img-responsive" style="width: 50px !important; margin: auto;" />
                                        <p style="font-size: 13px;"><%# Eval("Evento.Nombre") %></p>
                                    </div>
                                </div>
                                <div class="divider"></div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource runat="server" ID="odsPartidosActuales" SelectMethod="SelectActuales" TypeName="FixtureBLL"></asp:ObjectDataSource>
                    </div>
                </article>
            </div>
        </div>
        <div class="wrapper row4 bgded overlay">
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
        <div class="wrapper row4 bgded overlay" style="background-image: url('images/contactenos.jpg'); z-index: 0; background-position: center center;">
            <footer id="footer" class="hoc clear">
                <div class="one_half first  wow fadeInUp" data-wow-delay="0.9s" id="comments">
                    <h6 class="heading">Contáctenos</h6>
                    <label for="name">Nombre <span>*</span></label>
                    <asp:TextBox runat="server" ID="name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="name" ErrorMessage="Inserte Nombre"
                        ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator><br />
                    <label for="email">E-Mail <span>*</span></label>
                    <asp:TextBox runat="server" ID="email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="email" ErrorMessage="Inserte Email"
                        ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator><br />
                    <label for="url">Asunto <span>*</span></label>
                    <asp:TextBox runat="server" ID="asunto"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="asunto" ErrorMessage="Inserte Email"
                        ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator><br />
                    <div class="block clear">
                        <label for="comment">Comentario <span>*</span></label>
                        <asp:TextBox runat="server" ID="comment" TextMode="MultiLine" Columns="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="comment" ErrorMessage="Inserte Email"
                            ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator><br />
                    </div>
                    <div>
                        <asp:Button CssClass="btn emailsend" Text="Enviar" runat="server" OnClick="EnviarMail"
                            OnClientClick="return false;"></asp:Button>
                    </div>
                </div>
                <div class="one_half">
                    <div class="block  wow fadeInUp" data-wow-delay="0.9s">
                        <h6 class="heading">Donde Estamos</h6>
                        <ul class="nospace linklist contact">
                            <li><i class="fa fa-map-marker"></i>
                                <address>
                                    Av. Paragua 4to anillo Santa Cruz de la Sierra
                                </address>
                            </li>
                            <li><i class="fa fa-phone"></i>+59178557777</li>
                            <li><i class="fa fa-fax"></i>+591 347-4704</li>
                            <li><i class="fa fa-envelope-o"></i>info@sea.com.bo</li>
                        </ul>
                        <div class="block">
                            <p>Siguenos en nuestras redes sociales</p>
                            <ul class="faico clear">
                                <li><a class="faicon-facebook" href="https://www.facebook.com/sports.events.agency/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a class="faicon-twitter" href="https://twitter.com/SEA_SRL" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                <li><a class="faicon-youtube" href="https://www.youtube.com/user/SportsEventsAgency" target="_blank"><i class="fa fa-youtube"></i></a></li>
                                <li><a class="faicon-instagram" href="https://www.instagram.com/sea_srl/?hl=es" target="_blank"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <div class="wrapper row5">
            <div id="copyright" class="hoc clear">
                <p class="fl_left">Copyright &copy; 2017 - SEA - <a href="http://sea.com.bo/">www.sea.com.bo</a></p>
                <p class="fl_right">Desarrollado por <a target="_blank" href="http://osbolivia.com/" title="OSBolivia">OSBolivia</a></p>
            </div>
        </div>
        <div class="wrapper row2">
            <div class="hoc container clear">
                <div class="group">
                    <div class="one_half first">
                        <div class="one_third first">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/logo.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/EventosDeportivos.aspx">Eventos Deportivos</a></li>
                            </ul>
                        </div>
                        <div class="one_third">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/logo.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/Marketing.aspx">Marketing Deportivo</a></li>
                            </ul>
                        </div>
                        <div class="one_third">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/atletico.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/ClubAtletico.aspx">Club Atletico Juniors</a></li>
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/SoccerAcademy.aspx">Academia de Fútbol</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="one_half">
                        <div class="one_third first">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/logo.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/ComplejoDeportivo.aspx">Complejo Deportivo SEA</a></li>
                            </ul>
                        </div>
                        <div class="one_third">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/S&A.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/StudentsAthletics.aspx">Students & Athletics</a></li>
                            </ul>
                        </div>

                        <div class="one_third wow ">
                            <h6 class="heading titulo wow lightSpeedIn" data-wow-delay="0.6s">
                                <img alt="logo" src="images/seatv.png" style="height: 50px;" />
                            </h6>
                            <ul class="nospace linklist contact serv">
                                <li class="wow bounceIn" data-wow-delay="0.8s"><a href="servicios/ClubAtletico.aspx">Sea TV</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper row5">
            <div class="hoc container clear">
                <p class="sponsor-title">Con el Apoyo de</p>
                <p style="border-bottom: 3px solid white;"></p>
                <div class="auspiciadores">
                    <asp:Repeater runat="server" DataSourceID="objSponsorDS" ID="repaterSponsors">
                        <ItemTemplate>
                            <div class="wow rotateIn" data-wow-delay="0.8s">
                                <img class="ausp" src="/images/sponsors/<%# Eval("ID") %>.png" alt="<%# Eval("Nombre") %>" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="objSponsorDS"
                        runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByModulo"
                        TypeName="SponsorDSTableAdapters.tbl_sponsorsTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="modulo" SessionField="modulo" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <script src="scripts/jquery-1.9.1.min.js"></script>
        <script src="scripts/jquery.backtotop.js"></script>
        <script src="scripts/jquery.mobilemenu.js"></script>
        <script src="scripts/smoothScroll.js"></script>
        <script src="scripts/wow.min.js"></script>
        <script src="styles/slick/slick.js"></script>
        <script src="scripts/jquery.yottie.bundled.js"></script>
        <script src="scripts/js.js"></script>
        <script type="text/javascript">
            new WOW().init();
        </script>
    </form>
</body>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.11';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</html>
