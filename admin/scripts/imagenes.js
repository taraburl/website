$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
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

function cancelnewImagen() {
    $("#newImage").slideUp(500, function () {
        $("#listimages").slideDown(500);
    });
}

function newImagen() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $('#ContentPlaceHolder1_hdnIdImagen').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listimages").slideUp(500, function () {
        $("#newImage").slideDown(500);
    });
}

function eliminarImagen(id) {
    var parametros = {
        idImagen: id
    };
    $.ajax({
        url: 'Imagenes.aspx/EliminarImagen',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                return mensajeConfirmacion("Error", "Error al crear la imagen", "error");
            }
            mensajeConfirmacion("Bien!", "Imagen Eliminada", "success");
            var linkEliminar = $('.eliminarFilaImagen' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}

function actualizarImagen(id) {
    $('#Descripcion').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idImagen: id
    };
    $.ajax({
        url: 'Imagenes.aspx/TraerImagen',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjImagen = data.d;
            $("#listimages").slideUp(500, function () {
                $("#newImage").slideDown(500);
            });
            $('#Descripcion').val(ObjImagen.Descripcion);
            $('#Modulo').val(ObjImagen.Modulo).trigger('change');
            $('#ContentPlaceHolder1_hdnIdImagen').val(ObjImagen.IdImagen);
        }
    });
}

function guardarImagen() {
    if (!$('#Descripcion').val() || !$('#Descripcion').val().trim().length) {
        $("#Descripcion").parent().addClass("has-error");
        return false;
    } else {
        $("#Descripcion").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdImagen').val() != "") {
        //Actualizar
        var parametros = {
            descripcion: $('#Descripcion').val(),
            modulo: $('#Modulo').val(),
            id: $('#ContentPlaceHolder1_hdnIdImagen').val()
        };
        $.ajax({
            url: 'Imagenes.aspx/ActualizarImagen',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objImagen = data.d;
                var linkActualizar = $('.actualizarFilaImagen' + objImagen.IdImagen);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><img class="profile-user-img img-responsive" alt="SEA-IMG" src="/images/galeria/' + objImagen.IdImagen + '.jpg"/></td>' +
                    '<td>' + objImagen.Descripcion + '</td>' +
                    '<td>' + objImagen.Modulo + '</td>' +
                    '<td><a class="btn btn-circle btn-info btn-circle actualizarFilaImagen' + objImagen.IdImagen + '" href="javascript:actualizarImagen(' + objImagen.IdImagen + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-danger btn-circle actualizarFilaImagen' + objImagen.IdImagen + '" href="javascript:eliminarImagen(' + objImagen.IdImagen + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-warning btn-circle" href="SubirFotoImagen.aspx?ID=' + objImagen.IdImagen + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdImagen').val('');
                mensajeConfirmacion("Bien!", "Imagen Actualizada", "success");
                $("#newImage").slideUp(500, function () {
                    $("#listimages").slideDown(500);
                });
            },
            error: function () {
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            descripcion: $('#Descripcion').val(),
            modulo: $('#Modulo').val()
        };
        $.ajax({
            url: 'Imagenes.aspx/InsertarImagen',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objImagen = data.d;
                var tr = '<tr>' +
                    '<td><img class="profile-user-img img-responsive" alt="SEA-IMG" src="/images/galeria/' + objImagen.IdImagen + '.jpg"/></td>' +
                    '<td>' + objImagen.Descripcion + '</td>' +
                    '<td>' + objImagen.Modulo + '</td>' +
                    '<td><a class="btn btn-circle btn-info actualizarFilaImagen' + objImagen.IdImagen + '" href="javascript:actualizarImagen(' + objImagen.IdImagen + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-danger actualizarFilaImagen' + objImagen.IdImagen + '" href="javascript:eliminarImagen(' + objImagen.IdImagen + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-circle btn-warning" href="SubirFotoImagen.aspx?ID=' + objImagen.IdImagen + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Imagen Creada", "success");
                $("#newImage").slideUp(500, function () {
                    $("#listimages").slideDown(500);
                });
            },
            error: function () {
                $("#Descripcion").parent().addClass("has-error");
            }
        });
    }
}