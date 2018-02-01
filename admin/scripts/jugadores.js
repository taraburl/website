$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelJugador() {
    $("#newJugadores").slideUp(500, function () {
        $("#listJugadores").slideDown(500);
    });
    $('#Nombre').val("");
    $('#Edad').val("")
    $('#ContentPlaceHolder1_hdnIdJugador').val("");
}

function newJugador() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdJugador').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listJugadores").slideUp(500, function () {
        $("#newJugadores").slideDown(500);
    });

    $('#Nombre').val("");
    $('#Edad').val("")
}

function eliminarJugador(id) {
    var parametros = {
        idJugador: id
    };
    $.ajax({
        url: 'jugadores.aspx/EliminarJugador',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Arbitro", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Arbitro Eliminado", "success");
            var linkEliminar = $('.eliminarFilaJugador' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarJugador(id) {
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idJugador: id
    };
    $.ajax({
        url: 'jugadores.aspx/TraerJugador',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjJugador = data.d;
            $("#listJugadores").slideUp(500, function () {
                $("#newJugadores").slideDown(500);
            });
            $('#Nombre').val(ObjJugador.Nombre);
            $('#Edad').val(ObjJugador.Edad)
            $('#ContentPlaceHolder1_hdnIdJugador').val(ObjJugador.IdJugador);
        }
    });
}

function guardarJugador() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if (!$('#Edad').val() || !$('#Edad').val().trim().length) {
        $("#Edad").parent().addClass("has-error");
        return false;
    } else {
        $("#Edad").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdJugador').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            edad: $('#Edad').val(),
            tipo: "Arbitro",
            id: $('#ContentPlaceHolder1_hdnIdJugador').val()
        };
        $.ajax({
            url: 'jugadores.aspx/ActualizarJugador',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugador = data.d;
                var linkActualizar = $('.actualizarFilaJugador' + objJugador.IdJugador);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objJugador.Nombre + '</td>' +
                    '<td>' + objJugador.Edad + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaJugador' + objJugador.IdJugador + '" href="javascript:actualizarJugador(' + objJugador.IdJugador + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaJugador' + objJugador.IdJugador + '" href="javascript:eliminarJugador(' + objJugador.IdJugador + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                mensajeConfirmacion("Bien!", "Arbitro Actualizado", "success");
                $('#ContentPlaceHolder1_hdnIdJugador').val('');
                $("#newJugadores").slideUp(500, function () {
                    $("#listJugadores").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
                $("#Edad").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            tipo: "Arbitro",
            edad: $('#Edad').val()
        };
        $.ajax({
            url: 'jugadores.aspx/InsertarJugador',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugador = data.d;
                var tr = '<tr>' +
                    '<td>' + objJugador.Nombre + '</td>' +
                    '<td>' + objJugador.Edad + '</td>' +
                    '<td><a class="btn btn-block btn-circle btn-info actualizarFilaJugador' + objJugador.IdJugador + '" href="javascript:actualizarJugador(' + objJugador.IdJugador + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-circle btn-danger actualizarFilaJugador' + objJugador.IdJugador + '" href="javascript:eliminarJugador(' + objJugador.IdJugador + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Arbitro Guardado", "success");
                $("#newJugadores").slideUp(500, function () {
                    $("#listJugadores").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
                $("#Edad").parent().addClass("has-error");
            }
        });
    }
}