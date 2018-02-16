$(document).ready(function () {
    var idEvento = $("#ContentPlaceHolder1_hdnEvento").val();
    cargarGrupo(idEvento);
    cargartablagrupo();
    $("#CartIcons").hide();
    if (!sessionStorage.getItem("fullName")) {
        $("#UseriIcons").hide();
        $("#loginIcons").show();
    } else {
    }
});


function cargarGrupo(id) {
    var parametros = {
        idEvento: id
    };
    $.ajax({
        url: 'Evento.aspx/ListarGrupos',
        dataType: 'json',
        type: 'POST',
        async: true,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjGrupo = data.d;
            ObjGrupo.forEach(function (grupo) {
                $("#accordionGrupos").append(
                    '<div class="card">' +
                         '<div class="card-header gruposheader" role="tab">' +
                            '<h4>' +
                                '<a class="collapsed"  href="#collapse' + grupo.IdGrupo + '" data-toggle="collapse" data-parent="#accordionGrupos">' + grupo.Nombre + '</a>' +
                            '</h4>' +
                         '</div>' +
                         '<div class="collapse" id="collapse' + grupo.IdGrupo + '" role="tabpanel">' +
                            '<div class="card-body">' +
                                    '<div class="row grupo-sector" id="bodycollapse' + grupo.IdGrupo + '"></div>' +
                            '</div>' +
                         '</div>' +
                    '</div>' +
                   '</div>');
                $("#pos-tab").append(
                    "<div class='row padding-top-1x widget widget-featured-posts' style='padding-top: 0px !important;'>" +
                        "<div class='col-12 margin-left-none'>" +
                            "<div class='padding-top-1x'>" +
                                "<h3>" + grupo.Nombre + "</h3>" +
                            "</div>" +
                        "</div>" +
                        "<div class='col-12 table-responsive' id='grupopos" + grupo.IdGrupo + "'>" +
                        "</div>" +
                    "</div>");
                cargarEquipos(grupo.IdGrupo);
                cargartablaposiciones(grupo.IdGrupo);
            });
        }
    });
}

function cargarEquipos(idGrupo) {
    var parametros = {
        idGrupo: idGrupo
    };
    $.ajax({
        url: 'Evento.aspx/ListarEquipos',
        dataType: 'json',
        type: 'POST',
        async: true,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objEquipo = data.d;
            objEquipo.forEach(function (equipo) {
                $("#bodycollapse" + idGrupo).append(
                         '<div class="col-lg-2 col-md-4 col-sm-6 col-6 mb-3 text-center">' +
                            '<img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img"' +
                                  'src="../images/equipos/' + equipo.IdEquipo + '.png" alt="Equipo" />' +
                            '<h6>' + equipo.Equipo.Nombre + '</h6>' +
                            '<p class="text-white">' + equipo.Grupo.Nombre + '</p>' +
                          '<div>' +
                          '<a class="text-medium text-decoration-none" href="jugadores.aspx?ID=' + equipo.IdEquipo + '">' +
                                 'Ver Jugadores&nbsp;<i class="icon-arrow-right"></i></a>' +
                          '</div>' +
                    '</div>');
            });
        }
    });
}

function cargartablaposiciones(id) {
    $("#grupopos" + id).append(
        "<table class=table>" +
            "<thead>" +
                "<tr>" +
                "<th colspan=3></th>" +
                "<th class='ancho-tbl'>PJ</th>" +
                "<th class='ancho-tbl'>G</th>" +
                "<th class='ancho-tbl'>E</th>" +
                "<th class='ancho-tbl'>P</th>" +
                "<th class='ancho-tbl'>GF</th>" +
                "<th class='ancho-tbl'>GC</th>" +
                "<th class='ancho-tbl'>DIF</th>" +
                "<th class='ancho-tbl'>PTS</th>" +
                "<tr>" +
            "<thead>" +
            "<tbody id='bodypos" + id + "'></tbody>" +
        "</table>")
    var parametros = {
        idGrupo: id
    };
    $.ajax({
        url: 'Evento.aspx/ListarPosiciones',
        dataType: 'json',
        type: 'POST',
        async: true,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjGrupo = data.d;
            var pos = 1;
            ObjGrupo.forEach(function (grupo) {
                $("#bodypos" + id).append("<tr>" +
                    "<td>" + pos + "</td>" +
                    "<td><img src='../images/equipos/" + grupo.IdEquipo + ".png' alt='" + grupo.Equipo.Nombre + "' width='20' height='50' /></td>" +
                    "<td>" + grupo.Equipo.Nombre + "</td>" +
                    "<td>" + grupo.PartidosJugados + "</td>" +
                    "<td>" + grupo.Ganados + "</td>" +
                    "<td>" + grupo.Empates + "</td>" +
                    "<td>" + grupo.Perdidos + "</td>" +
                    "<td>" + grupo.GolesFavor + "</td>" +
                    "<td>" + grupo.GolesContra + "</td>" +
                    "<td>" + grupo.Diferencia + "</td>" +
                    "<td>" + grupo.Puntos + "</td>" +
                    "</tr>");
                pos++;
            });
        }
    });
}

function cargartablagrupo() {
    var parametros = {
        idGrupo: $("#ContentPlaceHolder1_hdnGrupo").val()
    };
    $.ajax({
        url: 'Evento.aspx/ListarPosiciones',
        dataType: 'json',
        type: 'POST',
        async: true,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjGrupo = data.d;
            var pos = 1;
            ObjGrupo.forEach(function (grupo) {
                $("#estadisticas-pos").append(
                        "<tr>" +
                        "<td>" + pos + "</td>" +
                        "<td>" + grupo.Equipo.Nombre + "</td>" +
                        "<td>" + grupo.PartidosJugados + "</td>" +
                        "<td>" + grupo.Diferencia + "</td>" +
                        "<td>" + grupo.Puntos + "</td>" +
                    "</tr>");
                pos++;
            });
        }
    });
}

function cargartablagoleadores(id, nombre) {
    $("#tablas-pos").append("<div class='tab-pane transition fade scale' id='tablagoleadres" + id + "' role=tabpanel' style='margin-top: -10px !important;'> " +
                       "<div class='row padding-top-1x widget widget-featured-posts' style='padding-top: 0px !important;'>" +
                           "<div class='row margin-left-none'>" +
                               "<div class='col-12 padding-top-1x'>" +
                                   "<h3>TABLA DE GOLEADORES:   " + nombre + "</h3>" +
                               "</div>" +
                           "</div>" +
                           "<div class='table-responsive' style='width: 100% !important;'>" +

                           "</div>" +
                       "</div>" +
                   "</div>");
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}