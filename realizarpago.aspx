<%@ Page Language="C#" AutoEventWireup="true" CodeFile="realizarpago.aspx.cs" Inherits="realizarpago" %>

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
    <link href="Content/animate.css" rel="stylesheet" />
    <link href="styles/slick/slick.css" rel="stylesheet" />
    <link href="styles/slick/slick-theme.css" rel="stylesheet" />
    <link href="styles/listas.css" rel="stylesheet" />
    <link href="styles/layout.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
</head>
<body>
    <%--<form id="form1" runat="server">--%>
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
                                <img src="images/profile.png" id="imagenperfil" alt="img-perfil" style="width: 20px; height: 20px; border-radius: 50%;" />
                                <a href="servicios/MyProfile.aspx" runat="server"></a></li>
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
            </div>
            <div id="pageintro" class="hoc clear">
                <%--<article>
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
                </article>--%>

                <div class="container">
                    <div class="form-horizontal">
                        <div class="row">
                            <h2>Realizar Pagos con Tigo Money</h2>
                            <h3 id="hmensaje"></h3>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="orderId" class="col-lg-2 control-label">Número de Orden</label>
                                    <div class="col-lg-10">
                                        <input type="number" class="form-control" id="nroOrden" name="orderId"
                                                placeholder="Numero de Orden" value="1">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="monto" class="col-lg-2 control-label">Monto</label>
                                        <div class="col-lg-10">
                                            <input type="number" class="form-control" id="monto" name="monto" placeholder="Monto" value="1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="linea" class="col-lg-2 control-label">Linea</label>
                                        <div class="col-lg-10">
                                            <input type="number" class="form-control" id="linea" name="linea" placeholder="Linea" value="76051629">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <%--<button type="submit" class="btn btn-primary">Realizar Pago</button>--%>
                                            <button class="btn btn-primary" onclick="RealizarPago()">Realizar Pago</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                                <div class="col-md-6">
                                    <img src="http://promocionestigohn.com/saatchihn/tigo/landing-pages/2016/01-enero/refresh-tigo-smart/images/footer-03-logo-tigo-money.png" alt="Logo Tigo Money">
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
  <%--  </form>--%>
</body>
</html>

<script type="text/javascript">

    var iconsultar = 0;
    var snroOrden;

    $(document).ready(function () {
        // RealizarPago();
    });

    function RealizarPago()
    {
        iconsultar = 0;
        var data = {
            nroorden: $("#nroOrden").val(),
            linea: $("#linea").val(),
            monto: $("#monto").val()
        };
        data = JSON.stringify(data);

        // Example E - call a function that returns an object.  .net will serialise the object as JSON for us.
        // Params are sent in JSON format, data that comes back is a JSON object
        $.ajax({
            url: "realizarpago.aspx/RealizarPago",
            cache: false,
            data: data,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        }).complete(function () {
            // DesbloquearPantalla();
            // alert('Complet');
            console.log('Completado RealizarPago');
        }).done(function (respuesta) {
            var res = respuesta.d;
            $("#hmensaje").html('Respuesta RP: ' + res.resultado);
            console.log('Done RealizarPago', res.resultado);
            snroOrden = res.orderId;
            ProgramarConsultarEstadoPago();
        }).error(function (er) {
            alert('Erorrrrrr');
        });
    }

    function ProgramarConsultarEstadoPago()
    {
        var itime = 30;
        if (iconsultar > 0) {
            itime = 10;
        }
        setTimeout( ConsultarEstadoPago, (itime * 1000));
    }

    function ConsultarEstadoPago()
    {
        var data = {
            nroorden: snroOrden
        };
        data = JSON.stringify(data);

        $.ajax({
            url: "realizarpago.aspx/ConsultarEstado",
            cache: false,
            data: data,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        }).complete(function () {
            console.log('Completado ConsultarEstado');
        }).done(function (respuesta) {
            iconsultar++;
            var res = respuesta.d;
            $("#hmensaje").html('Respuesta CE: ' + res.resultado);
            console.log('Done ConsultarEstado, Nro intentos: ' + iconsultar , res.resultado);
            console.log('Done ConsultarEstado', res);
            // Verificar estado de pago
            if (res.exito == false && iconsultar < 6 && res.codRes == '3') {
                ProgramarConsultarEstadoPago();
                console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
            }
            else if (res.exito == true) {
                console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
            }
            else
            {
                console.log('Limite de pedidos ConsultarEstado, Nro intentos: ' + iconsultar);
            }
        }).error(function (er) {
            alert('Erorrrrrr');
        });
    }
    
</script>
