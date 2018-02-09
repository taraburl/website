$(document).ready(function () {
    var idEvento = getParameterByName('ID');
    cargarGrupo(idEvento);
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
                $("#tabla-pos-grupos").append("<a class='dropdown-item' href='#tablaposgrupo" + grupo.IdGrupo + "' data-toggle='tab' role='tab'>" + grupo.Nombre + "</a>");
                $("#tabla-goleadores").append("<a class='dropdown-item' href='#tablagoleadres" + grupo.IdGrupo + "' data-toggle='tab' role='tab'>" + grupo.Nombre + "</a>");
                cargarEquipos(grupo.IdGrupo);
                cargartablaposiciones(grupo.IdGrupo, grupo.Nombre);
                cargartablagoleadores(grupo.IdGrupo, grupo.Nombre);
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

function cargartablaposiciones(id, nombre) {
    $("#tablas-pos").append("<div class='tab-pane transition fade scale' id='tablaposgrupo" + id + "' role=tabpanel' style='margin-top: -10px !important;'> " +
                        "<div class='row padding-top-1x widget widget-featured-posts' style='padding-top: 0px !important;'>" +
                            "<div class='row margin-left-none'>" +
                                "<div class='col-12 padding-top-1x'>" +
                                    "<h3>TABLA DE POSICIONES:   " + nombre + "</h3>" +
                                "</div>" +
                            "</div>" +
                            "<div class='table-responsive' style='width: 100% !important;'>" +

                            "</div>" +
                        "</div>" +
                    "</div>");
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


/**
 * @param String name
 * @return String
 */
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}