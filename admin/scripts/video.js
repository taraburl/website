$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

function cancelnewVideo() {
    $("#newVideo").slideUp(500, function () {
        $("#listVideo").slideDown(500);
    });
}

function newVideo() {
    $(".input-group").removeClass('has-error');
    $('#URL').val('');
    $('#Descripcion').val('');
    $('#ContentPlaceHolder1_hdnIdVideo').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listVideo").slideUp(500, function () {
        $("#newVideo").slideDown(500);
    });
}

function eliminarVideo(id) {
    var parametros = {
        idVideo: id
    };
    $.ajax({
        url: 'Videos.aspx/EliminarVideo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar el Video", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Video Eliminado", "success");
            var linkEliminar = $('.eliminarFilaVideo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}

function actualizarVideo(id) {
    $("#URL").val('');
    $('#Descripcion').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idVideo: id
    };
    $.ajax({
        url: 'Videos.aspx/TraerVideo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjVideo = data.d;
            $("#listVideo").slideUp(500, function () {
                $("#newVideo").slideDown(500);
            });
            $("#URL").val(ObjVideo.URL);
            $('#Descripcion').val(ObjVideo.Descripcion);
            $('#Modulo').val(ObjVideo.Modulo).trigger('change');
            $('#ContentPlaceHolder1_hdnIdVideo').val(ObjVideo.IdVideo);
        }
    });
}

function guardarVideo() {
    if (!$('#URL').val() || !$('#URL').val().trim().length) {
        $("#URL").parent().addClass("has-error");
        return false;
    } else {
        $("#URL").parent().removeClass('has-error');
    }
    if (!$('#Descripcion').val() || !$('#Descripcion').val().trim().length) {
        $("#Descripcion").parent().addClass("has-error");
        return false;
    } else {
        $("#Descripcion").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdVideo').val() != "") {
        //Actualizar
        var parametros = {
            url: $("#URL").val(),
            descripcion: $('#Descripcion').val(),
            modulo: $('#Modulo').val(),
            id: $('#ContentPlaceHolder1_hdnIdVideo').val()
        };
        $.ajax({
            url: 'Videos.aspx/ActualizarVideo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objVideo = data.d;
                var linkActualizar = $('.actualizarFilaVideo' + objVideo.IdVideo);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-info actualizarFilaVideo' + objVideo.IdVideo + '" href="javascript:actualizarVideo(' + objVideo.IdVideo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger actualizarFilaVideo' + objVideo.IdVideo + '" href="javascript:eliminarVideo(' + objVideo.IdVideo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objVideo.URL + '</td>' +
                    '<td>' + objVideo.Descripcion + '</td>' +
                    '<td>' + objVideo.Modulo + '</td>'
                trActualizado.html(tr);
                mensajeConfirmacion("Bien!", "Video Actualizado", "success");
                $('#ContentPlaceHolder1_hdnIdVideo').val('');
                $("#newVideo").slideUp(500, function () {
                    $("#listVideo").slideDown(500);
                });
            },
            error: function () {
                $("#URL").parent().addClass("has-error");
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            url: $("#URL").val(),
            descripcion: $('#Descripcion').val(),
            modulo: $('#Modulo').val()
        };
        $.ajax({
            url: 'Videos.aspx/InsertarVideo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objVideo = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-info actualizarFilaVideo' + objVideo.IdVideo + '" href="javascript:actualizarVideo(' + objVideo.IdVideo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger actualizarFilaVideo' + objVideo.IdVideo + '" href="javascript:eliminarVideo(' + objVideo.IdVideo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objVideo.URL + '</td>' +
                    '<td>' + objVideo.Descripcion + '</td>' +
                    '<td>' + objVideo.Modulo + '</td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Video Creado", "success");
                $("#newVideo").slideUp(500, function () {
                    $("#listVideo").slideDown(500);
                });
            },
            error: function () {
                $("#URL").parent().addClass("has-error");
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    }
}