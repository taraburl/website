$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelCancha() {
    $("#newCancha").slideUp(500, function () {
        $("#listCancha").slideDown(500);
    });
}

function newCancha() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdCancha').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listCancha").slideUp(500, function () {
        $("#newCancha").slideDown(500);
    });
}

function eliminarCancha(id) {
    var parametros = {
        idCancha: id
    };
    $.ajax({
        url: 'canchas.aspx/EliminarCancha',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Cancha", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Cancha Eliminada", "success");
            var linkEliminar = $('.eliminarFilaCancha' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarCancha(id) {
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idCancha: id
    };
    $.ajax({
        url: 'canchas.aspx/TraerCancha',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjCancha = data.d;
            $("#listCancha").slideUp(500, function () {
                $("#newCancha").slideDown(500);
            });
            $('#Nombre').val(ObjCancha.Nombre);
            $('#Descripcion').val(ObjCancha.Descripcion);
            $('#ContentPlaceHolder1_hdnIdCancha').val(ObjCancha.IdCancha);
        }
    });
}

function guardarCancha() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdCancha').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            descripcion: $('#Descripcion').val(),
            id: $('#ContentPlaceHolder1_hdnIdCancha').val()
        };
        $.ajax({
            url: 'canchas.aspx/ActualizarCancha',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCancha = data.d;
                var linkActualizar = $('.actualizarFilaCancha' + objCancha.IdCancha);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block   btn-info actualizarFilaCancha' + objCancha.IdCancha + '" href="javascript:actualizarCancha(' + objCancha.IdCancha + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block   btn-danger eliminarFilaCancha' + objCancha.IdCancha + '" href="javascript:eliminarCancha(' + objCancha.IdCancha + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objCancha.Nombre + '</td>' +
                    '<td>' + objCancha.Descripcion + '</td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdCancha').val('');
                mensajeConfirmacion("Bien!", "CCancha Actualizada", "success");
                $("#newCancha").slideUp(500, function () {
                    $("#listCancha").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            descripcion: $('#Descripcion').val()
        };
        $.ajax({
            url: 'canchas.aspx/InsertarCancha',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCancha = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block   btn-info actualizarFilaCancha' + objCancha.IdCancha + '" href="javascript:actualizarCancha(' + objCancha.IdCancha + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block   btn-danger actualizarFilaCancha' + objCancha.IdCancha + '" href="javascript:eliminarCancha(' + objCancha.IdCancha + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objCancha.Nombre + '</td>' +
                    '<td>' + objCancha.Descripcion + '</td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Cancha Gruardad", "success");
                $("#newCancha").slideUp(500, function () {
                    $("#listCancha").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    }
}