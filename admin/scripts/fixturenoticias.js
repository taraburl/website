$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
    $('#ContentPlaceHolder1_IdPartido').on('change', function () {
        cargarEquipo();
    });
    $('#ContentPlaceHolder1_IdEquipos').on('change', function () {
        cargarJugadores();
    });
    $('#hora').datetimepicker({
        format: 'hh:mm:ss'
    });
    $('#fecha').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    cargarEquipo();
});

function cancelNoticia() {
    $("#newNoticia").slideUp(500, function () {
        $("#listNoticia").slideDown(500);
    });
}

function newNoticia() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdNoticia').val('');
    $("#new").show();
    $("#upd").hide();
    $('#Descripcion').val('');
    $('#Fecha input').val('');
    $('#Hora input').val('');
    $("#listNoticia").slideUp(500, function () {
        $("#newNoticia").slideDown(500);
    });
}

function cargarEquipo() {
    $("#ContentPlaceHolder1_IdEquipos").empty();
    var parametros = {
        idFixture: $("#ContentPlaceHolder1_IdPartido").val()
    };
    $.ajax({
        url: 'fixture.aspx/TraerFixture',
        dataType: 'json',
        type: 'POST',
        async: false,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objFixture = data.d;
            $("#ContentPlaceHolder1_IdEquipos").append(
                '<option value="' + objFixture.IdEquipo + '">' + objFixture.Equipo.Nombre + '</option>' +
                '<option value="' + objFixture.IdRival + '">' + objFixture.Rival.Nombre + '</option>'
            );
            cargarJugadores();
        }
    });
}

function cargarJugadores() {
    $('#ContentPlaceHolder1_IdJugador').empty();
    var parametros = {
        idEquipo: $('#ContentPlaceHolder1_IdEquipos').val()
    };
    $.ajax({
        async: true,
        url: 'NoticiasFixture.aspx/TraerJugadoresEquipo',
        dataType: 'json',
        type: 'POST',
        async: false,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_IdJugador').append(
                    '<option value="' + element.IdJugadorEquipo + '">' + element.Nombre + '</option>');
            });
        }
    });
}

function eliminarNoticia(id) {
    var parametros = {
        idNoticia: id
    };
    $.ajax({
        url: 'NoticiasFixture.aspx/EliminarNoticia',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Noticia", "error");
                return;
            }
            var linkEliminar = $('.eliminarFilaNoticia' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
            mensajeConfirmacion("Bien!", "Noticia Eliminada", "success");
        }
    });
}

function actualizarNoticia(id) {
    cargarEquipo();
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idNoticia: id
    };
    $.ajax({
        url: 'NoticiasFixture.aspx/TraerNoticia',
        dataType: 'json',
        type: 'POST',
        async:true,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEvento = data.d;
            $("#listNoticia").slideUp(500, function () {
                $("#newNoticia").slideDown(500);
            });
            $("#ContentPlaceHolder1_IdPartido").val(ObjEvento.Id).trigger('change');
            $('#ContentPlaceHolder1_Tipo').val(ObjEvento.Tipo).trigger('change');
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#fecha input').val(ObjEvento.FechaForDisplay);
            $('#hora input').val(ObjEvento.HoraForDisplay);
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#ContentPlaceHolder1_hdnIdNoticia').val(ObjEvento.Id);
            $('#ContentPlaceHolder1_IdJugador').val(ObjEvento.IdJugador).trigger('change');
            $('#ContentPlaceHolder1_IdEquipos').val(ObjEvento.IdEquipo).trigger('change');
        }
    });
}

function guardarNoticia() {
    if (!$('#fecha input').val() || !$('#fecha input').val().trim().length) {
        $("#fecha input").parent().addClass("has-error");
        return false;
    } else {
        $("#fecha input").parent().removeClass('has-error');
    }
    if (!$('#hora input').val() || !$('#hora input').val().trim().length) {
        $("#hora input").parent().addClass("has-error");
        return false;
    } else {
        $("#fecha input").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdNoticia').val() != "") {
        //Actualizar
        var parametros = {
            idFixture: $('#ContentPlaceHolder1_IdPartido').val(),
            idEquipo: $('#ContentPlaceHolder1_IdEquipos').val(),
            idJugador: $('#ContentPlaceHolder1_IdJugador').val(),
            tipo:  $('#ContentPlaceHolder1_Tipo').val(),
            descripcion: $("#Descripcion").val(),
            fecha: $("#fecha input").val(),
            hora: $("#hora input").val(),
            id: $('#ContentPlaceHolder1_hdnIdNoticia').val()
        };
        $.ajax({
            url: 'NoticiasFixture.aspx/ActualizarNoticia',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objNoticia = data.d;
                var linkActualizar = $('.actualizarFilaNoticia' + objNoticia.Id);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objNoticia.Partido.Partido + '</td>' +
                    '<td>' + objNoticia.Equipo.Nombre + '</td>' +
                    '<td>' + objNoticia.Jugador.Nombre + '</td>' +
                    '<td>' + objNoticia.Tipo + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>' +
                    '<td>' + objNoticia.HoraForDisplay + '</td>' +
                    '<td><a class="btn btn-circle btn-info actualizarFilaNoticia' + objNoticia.Id + '" href="javascript:actualizarNoticia(' + objNoticia.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-danger eliminarFilaNoticia' + objNoticia.Id + '" href="javascript:eliminarNoticia(' + objNoticia.Id + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdNoticia').val('');
                mensajeConfirmacion("Bien!", "Noticia Actualizada", "success");
                $("#newNoticia").slideUp(500, function () {
                    $("#listNoticia").slideDown(500);
                });
            },
            error: function () {
                $(".input-group").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            idFixture: $('#ContentPlaceHolder1_IdPartido').val(),
            idEquipo: $('#ContentPlaceHolder1_IdEquipos').val(),
            idJugador: $('#ContentPlaceHolder1_IdJugador').val(),
            tipo: $('#ContentPlaceHolder1_Tipo').val(),
            descripcion: $("#Descripcion").val(),
            fecha: $("#fecha input").val(),
            hora: $("#hora input").val()
        };
        $.ajax({
            url: 'NoticiasFixture.aspx/InsertarNoticia',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objNoticia = data.d;
                var tr = '<tr>' +
                    '<td>' + objNoticia.Partido.Partido + '</td>' +
                    '<td>' + objNoticia.Equipo.Nombre + '</td>' +
                    '<td>' + objNoticia.Jugador.Nombre + '</td>' +
                    '<td>' + objNoticia.Tipo + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>' +
                    '<td>' + objNoticia.HoraForDisplay + '</td>' +
                    '<td><a class="btn btn-circle btn-info actualizarFilaNoticia' + objNoticia.Id + '" href="javascript:actualizarNoticia(' + objNoticia.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-danger eliminarFilaNoticia' + objNoticia.Id + '" href="javascript:eliminarNoticia(' + objNoticia.Id + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Noticia Creada", "success");
                $("#newNoticia").slideUp(500, function () {
                    $("#listNoticia").slideDown(500);
                });
            },
            error: function () {
                $(".input-group").parent().addClass("has-error");
            }
        });
    }
}