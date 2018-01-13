$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

function cancelEquipo() {
    $("#NombreJugador").val();
    $("#Posicion").val();
    $("#ContentPlaceHolder1_hdnJugadorEquipo").val();
    $("#ContentPlaceHolder1_hdnEquipo").val();
    $("#newEquipo, #addJugadores").slideUp(500, function () {
        $("#listEquipo").slideDown(500);
    });
}

function newEquipo() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#ContentPlaceHolder1_hdnIdEquipo').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listEquipo").slideUp(500, function () {
        $("#newEquipo").slideDown(500);
    });
}

function eliminarEquipo(id) {
    var parametros = {
        idEquipo: id
    };
    $.ajax({
        url: 'equipos.aspx/EliminarEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Equipo", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Equipo Eliminado", "success");
            var linkEliminar = $('.eliminarFilaEquipo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarEquipo(id) {
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idEquipo: id
    };
    $.ajax({
        url: 'equipos.aspx/TraerEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEquipo = data.d;
            $("#listEquipo").slideUp(500, function () {
                $("#newEquipo").slideDown(500);
            });
            $('#Nombre').val(ObjEquipo.Nombre);
            $('#ContentPlaceHolder1_IdEvento').val(ObjEquipo.IdEvento).trigger('change');
            $('#ContentPlaceHolder1_hdnIdEquipo').val(ObjEquipo.IdEquipo);
        }
    });
}

function guardarEquipo() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdEquipo').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val(),
            id: $('#ContentPlaceHolder1_hdnIdEquipo').val()
        };
        $.ajax({
            url: 'equipos.aspx/ActualizarEquipo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objEquipo = data.d;
                if (objEquipo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "No puede crear mas equipos para el evento seleccionado", "warning");
                }
                var linkActualizar = $('.actualizarFilaEquipo' + objEquipo.IdEquipo);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objEquipo.Nombre + '</td>' +
                    '<td>' + objEquipo.Evento.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaEquipo' + objEquipo.IdEquipo + '" href="javascript:actualizarEquipo(' + objEquipo.IdEquipo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaEquipo' + objEquipo.IdEquipo + '" href="javascript:eliminarEquipo(' + objEquipo.IdEquipo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning btn-circle" href="SubirImagenEquipo.aspx?ID=' + objEquipo.IdEquipo + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-primary btn-circle" href="javascript:agregarJugador(' + objEquipo.IdEquipo + ')"> <i class="fa  fa-plus" aria-hidden="true"></i> </a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdEquipo').val('');
                mensajeConfirmacion("Bien!", "Equipo Actualizado", "success");
                $("#newEquipo").slideUp(500, function () {
                    $("#listEquipo").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val()
        };
        $.ajax({
            url: 'equipos.aspx/InsertarEquipo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objEquipo = data.d;
                if (objEquipo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "No puede crear mas equipos para el evento seleccionado", "warning");
                }
                var tr = '<tr>' +
                    '<td>' + objEquipo.Nombre + '</td>' +
                    '<td>' + objEquipo.Evento.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaEquipo' + objEquipo.IdEquipo + '" href="javascript:actualizarEquipo(' + objEquipo.IdEquipo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaEquipo' + objEquipo.IdEquipo + '" href="javascript:eliminarEquipo(' + objEquipo.IdEquipo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning btn-circle" href="SubirImagenEquipo.aspx?ID=' + objEquipo.IdEquipo + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-primary btn-circle" href="javascript:agregarJugador(' + objEquipo.IdEquipo + ')"> <i class="fa  fa-plus" aria-hidden="true"></i> </a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Equipo Guardado", "success");
                $("#newEquipo").slideUp(500, function () {
                    $("#listEquipo").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    }
}

function agregarJugador(id) {
    $("#ContentPlaceHolder1_hdnEquipo").val(id);
    cargarJugadores(id);
    $("#listEquipo").slideUp(500, function () {
        $("#addJugadores").slideDown(500);
    });
}

function cargarJugadores(idEquipo) {
    $("#body").empty();
    var parametros = {
        idEquipo: idEquipo
    };
    $.ajax({
        url: 'equipos.aspx/TraerJugadoresEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objEquipo = data.d;
            objEquipo.forEach(function (element) {
                var tr = '<tr>' +
                       '<td>' + element.Nombre + '</td>' +
                       '<td>' + element.Posicion + '</td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaJugadorEquipo' + element.IdJugadorEquipo + '" href="javascript:actualizarJugadorEquipo(' + element.IdJugadorEquipo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaJugadorEquipo' + element.IdJugadorEquipo + '" href="javascript:eliminarJugadorEquipo(' + element.IdJugadorEquipo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                       '</tr>';
                $("#body").append(tr);
            });
        },
        error: function () {
            alert("Error al cargar los jugadores");
        }
    });
}

function nuevoJugador() {
    if (!$('#NombreJugador').val() || !$('#NombreJugador').val().trim().length) {
        $("#NombreJugador").parent().addClass("has-error");
        return false;
    } else {
        $("#NombreJugador").parent().removeClass('has-error');
    }
    if (!$('#Posicion').val() || !$('#Posicion').val().trim().length) {
        $("#Posicion").parent().addClass("has-error");
        return false;
    } else {
        $("#Posicion").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnJugadorEquipo').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#NombreJugador').val(),
            posicion: $('#Posicion').val(),
            idEquipo: $('#ContentPlaceHolder1_hdnEquipo').val(),
            id: $('#ContentPlaceHolder1_hdnJugadorEquipo').val()
        };
        $.ajax({
            url: 'equipos.aspx/ActualizarJugadorEquipo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugadorEquipo = data.d;
                if (objJugadorEquipo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "Alcanzo el maximo de inscritos en el quipo", "warning");
                }
                var linkActualizar = $('.actualizarFilaJugadorEquipo' + objJugadorEquipo.IdJugadorEquipo);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                       '<td>' + objJugadorEquipo.Nombre + '</td>' +
                       '<td>' + objJugadorEquipo.Posicion + '</td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaJugadorEquipo' + objJugadorEquipo.IdJugadorEquipo + '" href="javascript:actualizarJugadorEquipo(' + objJugadorEquipo.IdJugadorEquipo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaJugadorEquipo' + objJugadorEquipo.IdJugadorEquipo + '" href="javascript:eliminarJugadorEquipo(' + objJugadorEquipo.IdJugadorEquipo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                mensajeConfirmacion("Bien!", "Jugador Actualizado", "success");
                $('#ContentPlaceHolder1_hdnJugadorEquipo').val('');
                $("#NombreJugador").val('');
                $('#Posicion').val('');
            },
            error: function () {
                $("#NombreJugador").parent().addClass("has-error");
                $('#Posicion').parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#NombreJugador').val(),
            posicion: $('#Posicion').val(),
            idEquipo: $('#ContentPlaceHolder1_hdnEquipo').val()
        };
        $.ajax({
            url: 'equipos.aspx/InsertarJugadorEquipo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugadorEquipo = data.d;
                if (objJugadorEquipo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "Alcanzo el maximo de inscritos en el quipo", "warning");
                }
                var tr = '<tr>' +
                       '<td>' + objJugadorEquipo.Nombre + '</td>' +
                       '<td>' + objJugadorEquipo.Posicion + '</td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaJugadorEquipo' + objJugadorEquipo.IdJugadorEquipo + '" href="javascript:actualizarJugadorEquipo(' + objJugadorEquipo.IdJugadorEquipo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                       '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaJugadorEquipo' + objJugadorEquipo.IdJugadorEquipo + '" href="javascript:eliminarJugadorEquipo(' + objJugadorEquipo.IdJugadorEquipo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                $("#body").append(tr);
                mensajeConfirmacion("Bien!", "Jugador Creado", "success");
                $("#NombreJugador").val('');
                $('#Posicion').val('');
            },
            error: function () {
                $("#NombreJugador").parent().addClass("has-error");
                $('#Posicion').parent().addClass("has-error");
            }
        });
    }
}

function actualizarJugadorEquipo(id) {
    $(".input-group").removeClass('has-error');
    var parametros = {
        idJugadorEquipo: id
    };
    $.ajax({
        url: 'equipos.aspx/TraerJugadorEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEquipo = data.d;
            $('#NombreJugador').val(ObjEquipo.Nombre);
            $('#Posicion').val(ObjEquipo.Posicion);
            $('#ContentPlaceHolder1_hdnJugadorEquipo').val(ObjEquipo.IdJugadorEquipo);
        }
    });
}

function eliminarJugadorEquipo(id) {
    var parametros = {
        idEquipo: id
    };
    $.ajax({
        url: 'equipos.aspx/EliminarJugadorEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Equipo", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Equipo Eliminado", "success");
            var linkEliminar = $('.eliminarFilaJugadorEquipo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}