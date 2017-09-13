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

function cancelnewProducto() {
    $("#newProducto").slideUp(500, function () {
        $("#listProducto").slideDown(500);
    });
}

function newProducto() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $('#PrecioVenta').val('');
    $('#Medida').val('');
    $('#ContentPlaceHolder1_hdnIdProducto').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listProducto").slideUp(500, function () {
        $("#newProducto").slideDown(500);
    });
}

function eliminarProducto(id) {
    var parametros = {
        idProducto: id
    };
    $.ajax({
        url: 'Productos.aspx/EliminarProducto',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                console.log("Error al eliminar");
                alert("Hubo un error al eliminar el Producto");
                return;
            }
            var linkEliminar = $('.eliminarFilaProducto' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarProducto(id) {
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $('#PrecioVenta').val('');
    $('#Medida').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idProducto: id
    };
    $.ajax({
        url: 'Productos.aspx/TraerProducto',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjProducto = data.d;
            $("#listProducto").slideUp(500, function () {
                $("#newProducto").slideDown(500);
            });
            $('#Nombre').val(ObjProducto.Nombre);
            $('#Descripcion').val(ObjProducto.Descripcion);
            $('#PrecioVenta').val(ObjProducto.PrecioVenta);
            $('#Medida').val(ObjProducto.Medida);
            $('#ContentPlaceHolder1_IdCategoria').val(ObjProducto.IdCategoria).trigger('change');
            $('#ContentPlaceHolder1_hdnIdProducto').val(ObjProducto.IdProducto);
        }
    });
}

function guardarProducto() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if (!$('#Descripcion').val() || !$('#Descripcion').val().trim().length) {
        $("#Descripcion").parent().addClass("has-error");
        return false;
    } else {
        $("#Descripcion").parent().removeClass('has-error');
    }
    if (!$('#PrecioVenta').val() || !$('#PrecioVenta').val().trim().length) {
        $("#PrecioVenta").parent().addClass("has-error");
        return false;
    } else {
        $("#PrecioVenta").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdProducto').val() != "") {
        //Actualizar
        var parametros = {
            descripcion: $('#Descripcion').val(),
            nombre: $('#Nombre').val(),
            idcategoria: $('#ContentPlaceHolder1_IdCategoria').val(),
            id: $('#ContentPlaceHolder1_hdnIdProducto').val(),
            precio: $('#PrecioVenta').val(),
            medida: $('#Medida').val()
        };
        $.ajax({
            url: 'Productos.aspx/ActualizarProducto',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objProducto = data.d;
                var linkActualizar = $('.actualizarFilaProducto' + objProducto.IdProducto);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaProducto' + objProducto.IdProducto + '" href="javascript:actualizarProducto(' + objProducto.IdProducto + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaProducto' + objProducto.IdProducto + '" href="javascript:eliminarProducto(' + objProducto.IdProducto + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-warning" href="SubirImagenProducto.aspx?ID=' + objProducto.IdProducto + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objProducto.Nombre + '</td>' +
                    '<td>' + objProducto.PrecioVenta + '</td>' +
                    '<td>' + objProducto.Categoria.Nombre + '</td>' +
                    '<td>' + objProducto.Medida + '</td>'
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdProducto').val('');
                $("#newProducto").slideUp(500, function () {
                    $("#listProducto").slideDown(500);
                });
            },
            error: function () {
                $("#Descripcion").parent().addClass("has-error");
                $("#Nombre").parent().addClass("has-error");
                $("#PrecioVenta").parent().addClass("has-error");
                $("#Medida").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            descripcion: $('#Descripcion').val(),
            nombre: $('#Nombre').val(),
            idcategoria: $('#ContentPlaceHolder1_IdCategoria').val(),
            precio: $('#PrecioVenta').val(),
            medida: $('#Medida').val()
        };
        $.ajax({
            url: 'Productos.aspx/InsertarProducto',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objProducto = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaProducto' + objProducto.IdProducto + '" href="javascript:actualizarProducto(' + objProducto.IdProducto + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaProducto' + objProducto.IdProducto + '" href="javascript:eliminarProducto(' + objProducto.IdProducto + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-warning" href="SubirImagenProducto.aspx?ID=' + objProducto.IdProducto + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objProducto.Nombre + '</td>' +
                    '<td>' + objProducto.PrecioVenta + '</td>' +
                    '<td>' + objProducto.Categoria.Nombre + '</td>' +
                    '<td>' + objProducto.Medida + '</td>'
                '   </tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                $("#newProducto").slideUp(500, function () {
                    $("#listProducto").slideDown(500);
                });
            },
            error: function () {
                $("#Descripcion").parent().addClass("has-error");
                $("#Nombre").parent().addClass("has-error");
                $("#PrecioVenta").parent().addClass("has-error");
                $("#Medida").parent().addClass("has-error");
            }
        });
    }
}