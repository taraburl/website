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
    <!--<link href="/Content/styles-menu.css" rel="stylesheet" />
    <link href="/Content/youmax.css" rel="stylesheet" />-->
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
                                    <li><a href="servicios/EventosDeportivos.aspx">Eventos</a></li>
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
                <!--<div id='cssmenu'>
                    <ul>
                        <li><a href="/index.aspx" style="padding: 0px !important; padding-top: 5px !important; padding-left: 10px !important;">
                            <img src="/images/logo.png" alt="sea" style="width: 40px; padding: 0px !important;" /></a></li>
                        <li class='has-sub'>
                            <a  href="#">Eventos</a>
                            <ul>
                                <li><a href="servicios/EventosDeportivos.aspx">Eventos</a></li>
                            </ul>
                        </li>
                        <li class='has-sub'>
                            <a  href="#">Marketing Deportivo</a>
                            <ul>
                                <li><a href="/servicios/Marketing.aspx">Marketing Deportivo</a></li>
                            </ul>
                        </li>
                        <li class='has-sub'>
                            <a href="#">Club Atlético Juniors</a>
                            <ul>
                                <li><a href="/servicios/ClubAtletico.aspx">Club Atletico Juniors</a></li>
                                <li><a href="/servicios/SoccerAcademy.aspx">Academia de Fútbol</a></li>
                            </ul>
                        </li>
                        <li class='has-sub'>
                            <a href="#">Complejo Deportivo</a>
                            <ul>
                                <li><a href="/servicios/ComplejoDeportivo.aspx">Complejo Deportivo</a></li>
                            </ul>
                        </li>
                        <li class='has-sub'>
                            <a  href="#">Students & Athletics</a>
                            <ul>
                                <li><a href="/servicios/StudentsAthletics.aspx">Students & Athletics</a></li>
                            </ul>
                        </li>
                        <li class='has-sub'>
                            <a href="#">Sea TV</a>
                            <ul>
                                <li><a href="#">SEA TV</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>-->
            </div>
            <div id="pageintro" class="hoc clear">
                <article>
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
            </div>
        </div>
        <div class="wrapper clear" style="top: 20%;">
            <div class="auspiciadores-title">
                <p>CON EL APOYO DE:</p>
            </div>
            <section class="center2 slider" id="conocenos">
                <div>
                    <img src="images/sponsors2/alianza.png" alt="alianza" />
                </div>
                <div>
                    <img src="images/sponsors2/cuartito.png" alt="cuartito" />
                </div>
                <div>
                    <img src="images/sponsors2/maltareal.png" alt="maltareal" />
                </div>
                <div>
                    <img src="images/sponsors2/sante.png" alt="sante" />
                </div>
                <div>
                    <img src="images/sponsors2/terbonova.png" alt="terbonova" />
                </div>
            </section>
        </div>
        <div class="wrapper row3" style="top: 20%;">
            <div class="group">
                <div class="content-lg container">
                    <!-- Masonry Grid -->
                    <div class="masonry-grid row">
                        <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6 sm-margin-b-30">
                            <div class="margin-b-60">
                                <h2>MISIÓN</h2>
                                <p>
                                    Ayudar a la mejora del bienestar de las personas mediante la práctica del deporte,
                                        con ética profesional mediante el Marketing Deportivo.
                                </p>
                            </div>
                            <img class="full-width img-responsive wow fadeInUp"
                                src="images/mision.jpg" alt="Misión" data-wow-duration=".3"
                                data-wow-delay=".2s"
                                style="border-top: 10px solid #47AEC5;" />
                        </div>
                        <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6">
                            <div class="margin-b-60">
                                <img class="full-width img-responsive wow fadeInUp"
                                    src="images/vision.jpg" alt="Visión" data-wow-duration=".3"
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
                    <!-- End Masonry Grid -->
                </div>
            </div>
        </div>
        <div class="wrapper row4 bgded overlay">
            <!--<div id="youmax"></div>-->
            <div data-yt
                data-yt-channel="https://www.youtube.com/channel/UCxqs4wK9T-dvoK235ZNsAPg"
                data-yt-lang="es"
                data-yt-header-layout="minimal"
                data-yt-video-layout="classic"
                data-yt-header-channel-name=" "
                data-yt-header-channel-logo="images/logo-yt.jpg"
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
                    <input type="text" name="name" id="name" value="" runat="server" />
                    <label for="email">E-Mail <span>*</span></label>
                    <input type="email" name="email" id="email" value="" runat="server" />
                    <label for="url">Asunto</label>
                    <input type="text" name="asunto" id="asunto" value="" runat="server" />
                    <div class="block clear">
                        <label for="comment">Comentario</label>
                        <textarea name="comment" id="comment" cols="25" rows="10" runat="server"></textarea>
                    </div>
                    <div>
                        <!--<asp:LinkButton CssClass="btn emailsend" Text="Enviar" runat="server" OnClick="Unnamed1_Click"></asp:LinkButton>-->
                        <input type="submit" name="submit" value="Enviar" class="btn" />
                        <input type="reset" name="reset" value="Limpiar" class="btn inverse" />
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
                    <asp:Repeater runat="server" ID="repaterSponsors" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="wow rotateIn" data-wow-delay="0.8s">
                                <img class="ausp" src="/images/sponsors/<%# Eval("ID") %>.png" alt="<%# Eval("Nombre") %>" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" TypeName="SponsorDSTableAdapters.tbl_sponsorsTableAdapter"></asp:ObjectDataSource>
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
        <!--<script src="scripts/youmax.min.js"></script>
        <script src="scripts/script-menu.js"></script>-->
        <script src="scripts/js.js"></script>
        <script type="text/javascript">
            new WOW().init();
        </script>
    </form>
</body>
</html>
