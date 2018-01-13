$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelTipoPago() {
    $("#newTipoPago").slideUp(500, function () {
        $("#listTipoPago").slideDown(500);
    });
}

function newTipoPago() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#ContentPlaceHolder1_hdnIdTipoPago').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listTipoPago").slideUp(500, function () {
        $("#newTipoPago").slideDown(500);
    });
}

function eliminarTipoPago(id) {
    var parametros = {
        idTipoPago: id
    };
    $.ajax({
        url: 'formapago.aspx/EliminarTipoPago',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Tipo de Pago", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Tipo de PAgo ELiminado", "success");
            var linkEliminar = $('.eliminarFilaTipoPago' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}

function actualizarTipoPago(id) {
    $('#Nombre').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idTipoPago: id
    };
    $.ajax({
        url: 'formapago.aspx/TraerTipoPago',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjTipoPago = data.d;
            $("#listTipoPago").slideUp(500, function () {
                $("#newTipoPago").slideDown(500);
            });
            $('#Nombre').val(ObjTipoPago.Nombre);
            $('#ContentPlaceHolder1_hdnIdTipoPago').val(ObjTipoPago.IdTipoPago);
        }
    });
}

function guardarTipoPago() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdTipoPago').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            id: $('#ContentPlaceHolder1_hdnIdTipoPago').val()
        };
        $.ajax({
            url: 'formapago.aspx/ActualizarTipoPago',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objTipoPago = data.d;
                var linkActualizar = $('.actualizarFilaTipoPago' + objTipoPago.IdTipoPago);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objTipoPago.IdTipoPago + '</td>' +
                    '<td>' + objTipoPago.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaTipoPago' + objTipoPago.IdTipoPago + '" href="javascript:actualizarTipoPago(' + objTipoPago.IdTipoPago + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaTipoPago' + objTipoPago.IdTipoPago + '" href="javascript:eliminarTipoPago(' + objTipoPago.IdTipoPago + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdTipoPago').val('');
                mensajeConfirmacion("Bien!", "Tipo de Pago Actualizado", "success");
                $("#newTipoPago").slideUp(500, function () {
                    $("#listTipoPago").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val()
        };
        $.ajax({
            url: 'formapago.aspx/InsertarTipoPago',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objTipoPago = data.d;
                var tr = '<tr>' +
                    '<td>' + objTipoPago.IdTipoPago + '</td>' +
                    '<td>' + objTipoPago.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaTipoPago' + objTipoPago.IdTipoPago + '" href="javascript:actualizarTipoPago(' + objTipoPago.IdTipoPago + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle actualizarFilaTipoPago' + objTipoPago.IdTipoPago + '" href="javascript:eliminarTipoPago(' + objTipoPago.IdTipoPago + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Tipo de Pago Guardado", "success");
                $("#newTipoPago").slideUp(500, function () {
                    $("#listTipoPago").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    }
}