$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
    $('#hora').datetimepicker({
        format: 'hh:mm:ss'
    });
    $('#fecha').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#ContentPlaceHolder1_SelectGrupo').on('change', function () {
        cargarEquipos();
        cargarPartidos($("#ContentPlaceHolder1_SelectGrupo").val());
    });
});

function cancelFixture() {
    $("#addFixture").slideUp(500, function () {
        $("#listFixture").slideDown(500);
    });
}

function gestionarFixture(id) {
    $("#listFixture").slideUp(500, function () {
        $("#addFixture").slideDown(500);
    });
    cargarGrupos(id);
}

function cargarGrupos(id) {
    $('#ContentPlaceHolder1_SelectGrupo').empty();
    var parametros = {
        idEvento: id
    };
    $.ajax({
        async: true,
        url: 'grupo.aspx/TraerGruposEvento',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_SelectGrupo').append('<option value=' + element.IdGrupo + ' >'
                    + element.Nombre + '</option>');
            });
            cargarEquipos();
            cargarPartidos($("#ContentPlaceHolder1_SelectGrupo").val());
        }
    });
}

function cargarEquipos() {
    $('#ContentPlaceHolder1_EquipoRival1').empty();
    $('#ContentPlaceHolder1_EquipoRival2').empty();
    var parametros = {
        idGrupo: $('#ContentPlaceHolder1_SelectGrupo').val()
    };
    $.ajax({
        async: true,
        url: 'grupo.aspx/TraerEquiposGrupo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_EquipoRival1').append('<option value=' + element.IdEquipo + ' >'
                    + element.Equipo.Nombre + '</option>');
                $('#ContentPlaceHolder1_EquipoRival2').append('<option value=' + element.IdEquipo + ' >'
                    + element.Equipo.Nombre + '</option>');
            });
        }
    });
}

function nuevoEquipo() {
    var parametros = {
        idEquipo: $("#ContentPlaceHolder1_EquipoRival1").val(),
        idRival: $("#ContentPlaceHolder1_EquipoRival2").val(),
        idCancha: $("#ContentPlaceHolder1_Cancha").val(),
        fecha: $("#fecha input").val(),
        hora: $("#hora input").val(),
        idGrupo: $("#ContentPlaceHolder1_SelectGrupo").val()
    }
    $.ajax({
        url: 'fixture.aspx/InsertarFixture',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objJugadorEquipo = data.d;
            var tr = '<tr>' +
                //'<td><a class="btn btn-block btn-social-icon btn-info href="javascript:agregarArbitros(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>' +
                '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaJugadorEquipo' + objJugadorEquipo.IdFixture + '" href="javascript:eliminarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                 '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                 '<td>' + objJugadorEquipo.Rival.Nombre + '</td>' +
                 '<td>' + objJugadorEquipo.Cancha.Nombre + '</td>' +
                 '<td>' + objJugadorEquipo.FechaForDisplay + '</td>' +
                 '<td>' + objJugadorEquipo.HoraForDisplay + '</td>' +
                 '</tr>';
            $("#partidos").append(tr);
            mensajeConfirmacion("Bien!", "Partido Agregado", "success");
        },
        error: function () {
            mensajeConfirmacion("Advertencia!", "Partido Repetido", "warning");
        }
    });
}

function cargarPartidos(id) {
    $("#partidos").empty();
    var parametros = {
        idGrupo: id
    }
    $.ajax({
        url: 'fixture.aspx/ListFixture',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objgrup = data.d;
            objgrup.forEach(function (objJugadorEquipo) {
                var tr = '<tr>' +
                    //boooooo'<td><a class="btn btn-block btn-social-icon btn-info href="javascript:agregarArbitros(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaJugadorEquipo' + objJugadorEquipo.IdFixture + '" href="javascript:eliminarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                     '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Rival.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Cancha.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.FechaForDisplay + '</td>' +
                     '<td>' + objJugadorEquipo.HoraForDisplay + '</td>' +
                     '</tr>';
                $("#partidos").append(tr);
            });
        },
        error: function () {
        }
    });
}

function eliminarPartido(id) {
    var parametros = {
        idPartido: id
    };
    $.ajax({
        url: 'fixture.aspx/EliminarPartido',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Prtido", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Partido Eliminado", "success");
            var linkEliminar = $('.eliminarFilaJugadorEquipo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}