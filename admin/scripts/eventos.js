$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $('#FechaInicio').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    $('#FechaFin').datetimepicker({
        format: 'DD/MM/YYYY'
    });
});

jQuery('#ContentPlaceHolder1_uploader').on('change', function (e) {
    var Lector,
            oFileInput = this;
    if (oFileInput.files.length === 0) {
        return;
    }
    Lector = new FileReader();
    Lector.onloadend = function (e) {
        jQuery('#ContentPlaceHolder1_imgPrincipal').attr('src', e.target.result);
    }
    Lector.readAsDataURL(oFileInput.files[0]);
});

function newEvento() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdEvento').val('');
    $("#new").show();
    $("#upd").hide();
    $('#Nombre').val('');
    $('#Categoria').val('');
    $('#Descripcion').val('');
    $('#FechaInicio input').val('');
    $('#FechaFin input').val('');
    $('#CantEquipos').val('');
    $('#CantGrupos').val('');
    $('#Maximos').val('');
    $('#ContentPlaceHolder1_hdnIdEvento').val('');
    $("#listEvento").slideUp(500, function () {
        $("#newEvento").slideDown(500);
    });
}

function eliminarEvento(id) {
    var parametros = {
        idEvento: id
    };
    $.ajax({
        url: 'eventos.aspx/EliminarEvento',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al eliminar evento", "error");
                return;
            }
            var linkEliminar = $('.eliminarFilaEvento' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
            mensajeConfirmacion("Bien!", "Evento Eliminado", "success");
        }
    });
}

function actualizarEvento(id) {
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idEvento: id
    };
    $.ajax({
        url: 'eventos.aspx/TraerEvento',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEvento = data.d;
            $("#listEvento").slideUp(500, function () {
                $("#newEvento").slideDown(500);
            });
            $('#Nombre').val(ObjEvento.Nombre);
            $('#Categoria').val(ObjEvento.Categoria);
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#FechaInicio input').val(fechaCorrecta(ObjEvento.FechaInicioForDisplay));
            $('#FechaFin input').val(fechaCorrecta(ObjEvento.FechaFinForDisplay));
            $('#CantEquipos').val(ObjEvento.CantidadEquipos);
            $('#CantGrupos').val(ObjEvento.CantidadGrupos);
            $('#Maximos').val(ObjEvento.CantidadJugadoresPorEquipo);
            $('#ContentPlaceHolder1_hdnIdEvento').val(ObjEvento.IdEvento);
        }
    });
}

function guardarEvento() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        return $("#Nombre").parent().addClass("has-error");
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if (!$('#Categoria').val() || !$('#Categoria').val().trim().length) {
        return $("#Categoria").parent().addClass("has-error");
    } else {
        $("#Categoria").parent().removeClass('has-error');
    }
    if (!$('#FechaInicio input').val() || !$('#FechaInicio input').val().trim().length) {
        return $("#FechaInicio input").parent().addClass("has-error");
    } else {
        $("#FechaInicio input").parent().removeClass('has-error');
    }
    if (!$('#FechaFin input').val() || !$('#FechaFin input').val().trim().length) {
        return $("#FechaFin input").parent().addClass("has-error");
    } else {
        $("#FechaFin input").parent().removeClass('has-error');
    }
    if (!$('#CantEquipos').val() || !$('#CantEquipos').val().trim().length) {
        return $("#CantEquipos").parent().addClass("has-error");
    } else {
        $("#CantEquipos").parent().removeClass('has-error');
    }
    if (!$('#CantGrupos').val() || !$('#CantGrupos').val().trim().length) {
        return $("#CantGrupos").parent().addClass("has-error");
    } else {
        $("#CantGrupos").parent().removeClass('has-error');
    }
    if (!$('#Maximos').val() || !$('#Maximos').val().trim().length) {
        return $("#Maximos").parent().addClass("has-error");
    } else {
        $("#Maximos").parent().removeClass('has-error');
    }
    var fechaInicio = new Date(fechaCorrecta($('#FechaInicio input').val()));
    var fechaFin = new Date(fechaCorrecta($('#FechaFin input').val()));
    if (fechaInicio >= fechaFin) {
        $("#FechaFin input").parent().addClass("has-error");
        $("#FechaInicio input").parent().addClass("has-error");
        return false;
    }
    if ($('#ContentPlaceHolder1_hdnIdEvento').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            categoria: $('#Categoria').val(),
            descripcion: $('#Descripcion').val(),
            fechaInicio: fechaCorrecta($('#FechaInicio input').val()),
            fechaFin: fechaCorrecta($('#FechaFin input').val()),
            cantidadEquipos: $('#CantEquipos').val(),
            cantidadGrupos: $('#CantGrupos').val(),
            jugadoresPorEquipo: $('#Maximos').val(),
            id: $('#ContentPlaceHolder1_hdnIdEvento').val()
        };
        $.ajax({
            url: 'eventos.aspx/ActualizarEvento',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objEvento = data.d;
                var linkActualizar = $('.actualizarFilaEvento' + objEvento.IdEvento);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objEvento.Nombre + '</td>' +
                    '<td>' + objEvento.Categoria + '</td>' +
                    '<td>' + fechaCorrecta(objEvento.FechaInicioForDisplay) + '</td>' +
                    '<td>' + fechaCorrecta(objEvento.FechaFinForDisplay) + '</td>' +
                    '<td>' + objEvento.CantidadGrupos + '</td>' +
                    '<td>' + objEvento.CantidadEquipos + '</td>' +
                    '<td>' + objEvento.CantidadJugadoresPorEquipo + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaEvento' + objEvento.IdEvento + '" href="javascript:actualizarEvento(' + objEvento.IdEvento + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaEvento' + objEvento.IdEvento + '" href="javascript:eliminarEvento(' + objEvento.IdEvento + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning btn-circle" href="SubirImagenEvento.aspx?ID=' + objEvento.IdEvento + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-success btn-circle" href="SubirBannerEvento.aspx?ID=' + objEvento.IdEvento + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdEvento').val('');
                mensajeConfirmacion("Bien!", "Evento Actualizado", "success");
                $("#newEvento").slideUp(500, function () {
                    $("#listEvento").slideDown(500);
                });
            },
            error: function () {
                $(".input-group").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            categoria: $('#Categoria').val(),
            descripcion: $('#Descripcion').val(),
            fechaInicio: fechaCorrecta($('#FechaInicio input').val()),
            fechaFin: fechaCorrecta($('#FechaFin input').val()),
            cantidadEquipos: $('#CantEquipos').val(),
            cantidadGrupos: $('#CantGrupos').val(),
            jugadoresPorEquipo: $('#Maximos').val()
        };
        $.ajax({
            url: 'eventos.aspx/InsertarEvento',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objEvento = data.d;
                var tr = '<tr>' +
                    '<td>' + objEvento.Nombre + '</td>' +
                    '<td>' + objEvento.Categoria + '</td>' +
                    '<td>' + fechaCorrecta(objEvento.FechaInicioForDisplay) + '</td>' +
                    '<td>' + fechaCorrecta(objEvento.FechaFinForDisplay) + '</td>' +
                    '<td>' + objEvento.CantidadGrupos + '</td>' +
                    '<td>' + objEvento.CantidadEquipos + '</td>' +
                    '<td>' + objEvento.CantidadJugadoresPorEquipo + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaEvento' + objEvento.IdEvento + '" href="javascript:actualizarEvento(' + objEvento.IdEvento + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaEvento' + objEvento.IdEvento + '" href="javascript:eliminarEvento(' + objEvento.IdEvento + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning btn-circle" href="SubirImagenEvento.aspx?ID=' + objEvento.IdEvento + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-success btn-circle" href="SubirBannerEvento.aspx?ID=' + objEvento.IdEvento + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Evento Guardado", "success");
                $("#newEvento").slideUp(500, function () {
                    $("#listEvento").slideDown(500);
                });
            },
            error: function () {
                $(".input-group").parent().addClass("has-error");
            }
        });
    }
}

function cancelEvento() {
    $("#newEvento").slideUp(500, function () {
        $("#listEvento").slideDown(500);
    });
}