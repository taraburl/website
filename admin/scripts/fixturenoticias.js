$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
    $('#ContentPlaceHolder1_IdEquipo').on('change', function () {
        cargarJugadores();
    });
    $('#hora').datetimepicker({
        format: 'hh:mm:ss'
    });
    $('#fecha').datetimepicker({
        format: 'YYYY-MM-DD'
    });
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
    $('#Tipo').val('');
    $('#Descripcion').val('');
    $('#Fecha input').val('');
    $('#ContentPlaceHolder1_hdnIdNoticia').val('');
    $("#listNoticia").slideUp(500, function () {
        $("#newNoticia").slideDown(500);
    });
    cargarJugadores();
}

function cargarJugadores() {
    $('#ContentPlaceHolder1_IDJugador').empty();
    var parametros = {
        idEquipo: $('#ContentPlaceHolder1_IdEquipo').val()
    };
    $.ajax({
        async: true,
        url: 'NoticiasFixture.aspx/TraerJugadoresEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_IDJugador').append('<option value=' + element.IdJugadorEquipo + ' >'
                    + element.Nombre + '</option>');
            });
        }
    });
}

function eliminarNoticia(id) {
    var parametros = {
        idNoticia: id
    };
    $.ajax({
        url: 'NoticiaFixture.aspx/EliminarNoticia',
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
    cargarJugadores();
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
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEvento = data.d;
            $("#listNoticia").slideUp(500, function () {
                $("#newNoticia").slideDown(500);
            });
            $('#Tipo').val(ObjEvento.Tipo);
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#fecha input').val(ObjEvento.FechaForDisplay);
            $('#hora input').val(ObjEvento.HoraForDisplay);
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#ContentPlaceHolder1_hdnIdNoticia').val(ObjEvento.Id);
            $('#ContentPlaceHolder1_IDJugador').val(ObjEvento.IdJugador).trigger('change');
        }
    });
}

function guardarNoticia() {
    if (!$('#Tipo').val() || !$('#Tipo').val().trim().length) {
        $("#Tipo").parent().addClass("has-error");
        return false;
    } else {
        $("#Tipo").parent().removeClass('has-error');
    }
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
    if (!$('#Descripcion').val() || !$('#Descripcion').val().trim().length) {
        $("#Descripcion").parent().addClass("has-error");
        return false;
    } else {
        $("#Descripcion").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdNoticia').val() != "") {
        //Actualizar
        var parametros = {
            idEquipo: $('#ContentPlaceHolder1_IdEquipo').val(),
            idJugador: $('#ContentPlaceHolder1_IDJugador').val(),
            tipo: $("#Tipo").val(),
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
                    '<td><a class="btn btn-block btn-info actualizarFilaNoticia' + objNoticia.Id + '" href="javascript:actualizarNoticia(' + objNoticia.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger eliminarFilaNoticia' + objNoticia.Id + '" href="javascript:eliminarNoticia(' + objNoticia.Id + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objNoticia.Partido.Nombre + '</td>' +
                    '<td>' + objNoticia.Jugador.Nombre + '</td>' +
                    '<td>' + objNoticia.Tipo + '</td>' +
                    '<td>' + objNoticia.Descripcion + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>' +
                    '<td>' + objNoticia.HoraForDisplay + '</td>';
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
            idEquipo: $('#ContentPlaceHolder1_IdEquipo').val(),
            idJugador: $('#ContentPlaceHolder1_IDJugador').val(),
            tipo: $("#Tipo").val(),
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
                    '<td><a class="btn btn-block btn-info actualizarFilaNoticia' + objNoticia.Id + '" href="javascript:actualizarNoticia(' + objNoticia.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger eliminarFilaNoticia' + objNoticia.Id + '" href="javascript:eliminarNoticia(' + objNoticia.Id + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objNoticia.Partido.Nombre + '</td>' +
                    '<td>' + objNoticia.Jugador.Nombre + '</td>' +
                    '<td>' + objNoticia.Tipo + '</td>' +
                    '<td>' + objNoticia.Descripcion + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>' +
                    '<td>' + objNoticia.HoraForDisplay + '</td>' +
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