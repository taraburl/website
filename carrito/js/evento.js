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
                            '<h4>'+
                                '<a class="collapsed" href="#collapse' + grupo.IdGrupo + '" data-toggle="collapse" data-parent="#accordionGrupos">' + grupo.Nombre + '</a>' +
                            '</h4>' +
                         '</div>' +
                         '<div class="collapse" id="collapse' + grupo.IdGrupo + '" role="tabpanel">' +
                            '<div class="card-body">' +
                                    '<div class="row" id="bodycollapse' + grupo.IdGrupo + '"></div>' +
                            '</div>' +
                         '</div>' +
                    '</div>' +
                   '</div>');
                cargarEquipos(grupo.IdGrupo);
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
                         '<div class="col-lg-2 col-md-4 col-sm-6 mb-3 text-center">' +
                            '<img class="d-block w-150 mx-auto img-thumbnail mb-2 tamano-img"' +
                                  'src="../images/equipos/' + equipo.IdEquipo + '.png" alt="Equipo" />' +
                            '<h6 class="text-sea-color">' + equipo.Equipo.Nombre + '</h6>' +
                            '<p>' + equipo.Grupo.Nombre + '</p>' +
                          '<div>' +
                          '<a class="text-medium text-decoration-none" href="jugadores.aspx?ID=' + equipo.IdEquipo + '">' +
                                 'Ver Jugadores&nbsp;<i class="icon-arrow-right"></i></a>' +
                          '</div>' +
                    '</div>');
            });
        }
    });
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