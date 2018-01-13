$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $('#Fecha').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $(".select2").select2();
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
    $('#Titulo').val('');
    $('#Descripcion').val('');
    $('#Fecha input').val('');
    $('#ContentPlaceHolder1_hdnIdNoticia').val('');
    $("#listNoticia").slideUp(500, function () {
        $("#newNoticia").slideDown(500);
    });
}

function eliminarNoticia(id) {
    var parametros = {
        idNoticia: id
    };
    $.ajax({
        url: 'noticias.aspx/EliminarNoticia',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al ELiminar Noticia", "error");
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
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idNoticia: id
    };
    $.ajax({
        url: 'noticias.aspx/TraerNoticia',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEvento = data.d;
            $("#listNoticia").slideUp(500, function () {
                $("#newNoticia").slideDown(500);
            });
            $('#Titulo').val(ObjEvento.Titulo);
            $('#Fecha input').val(ObjEvento.FechaForDisplay);
            $('#Descripcion').val(ObjEvento.Descripcion);
            $('#ContentPlaceHolder1_IdEvento').val(ObjEvento.IdEvento).trigger('change');
            $('#ContentPlaceHolder1_hdnIdNoticia').val(ObjEvento.IdNoticia);
        }
    });
}

function guardarNoticia() {
    if (!$('#Titulo').val() || !$('#Titulo').val().trim().length) {
        $("#Titulo").parent().addClass("has-error");
        return false;
    } else {
        $("#Titulo").parent().removeClass('has-error');
    }
    if (!$('#Fecha input').val() || !$('#Fecha input').val().trim().length) {
        $("#Fecha input").parent().addClass("has-error");
        return false;
    } else {
        $("#Fecha input").parent().removeClass('has-error');
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
            titulo: $('#Titulo').val(),
            descripcion: $('#Descripcion').val(),
            fecha: $('#Fecha input').val(),
            id: $('#ContentPlaceHolder1_hdnIdNoticia').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val()
        };
        $.ajax({
            url: 'noticias.aspx/ActualizarNoticia',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objNoticia = data.d;
                var linkActualizar = $('.actualizarFilaNoticia' + objNoticia.IdNoticia);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-info  btn-circle actualizarFilaNoticia' + objNoticia.IdNoticia + '" href="javascript:actualizarEvento(' + objNoticia.IdNoticia + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger  btn-circle eliminarFilaNoticia' + objNoticia.IdNoticia + '" href="javascript:eliminarEvento(' + objNoticia.IdNoticia + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning  btn-circle" href="SubirImagenNoticia.aspx?ID=' + objNoticia.IdNoticia + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objNoticia.Titulo + '</td>' +
                    '<td>' + objNoticia.Evento.Nombre + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>';
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
            titulo: $('#Titulo').val(),
            descripcion: $('#Descripcion').val(),
            fecha: $('#Fecha input').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val()
        };
        $.ajax({
            url: 'noticias.aspx/InsertarNoticia',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objNoticia = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-info  btn-circle actualizarFilaNoticia' + objNoticia.IdNoticia + '" href="javascript:actualizarEvento(' + objNoticia.IdNoticia + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger  btn-circle eliminarFilaNoticia' + objNoticia.IdNoticia + '" href="javascript:eliminarEvento(' + objNoticia.IdNoticia + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-warning  btn-circle" href="SubirImagenNoticia.aspx?ID=' + objNoticia.IdNoticia + '"><i class="fa  fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objNoticia.Titulo + '</td>' +
                    '<td>' + objNoticia.Evento.Nombre + '</td>' +
                    '<td>' + objNoticia.FechaForDisplay + '</td>' +
                '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Noticia Creada", "success");
                $("#newNoticia").slideUp(500, function () {
                    $("#listNoticia").slideDown(500);
                });
            },
            error: function () {
                $(".input-group").parent().addClass("has-error"); k
            }
        });
    }
}
