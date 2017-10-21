$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelnewCategoria() {
    $("#newCategoria").slideUp(500, function () {
        $("#listCategoria").slideDown(500);
    });
}

function newCategoria() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $("#Precio").val('');
    $('#ContentPlaceHolder1_hdnIdCategoria').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listCategoria").slideUp(500, function () {
        $("#newCategoria").slideDown(500);
    });
}

function eliminarCategoria(id) {
    var parametros = {
        idCategoria: id
    };
    $.ajax({
        url: 'categorias.aspx/EliminarCategoria',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                console.log("Error al eliminar");
                alert("Hubo un error al eliminar la categoria");
                return;
            }
            var linkEliminar = $('.eliminarFilaCategoria' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}

function actualizarCategoria(id) {
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $("#Precio").val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idCategoria: id
    };
    $.ajax({
        url: 'categorias.aspx/TraerCategoria',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjCategoria = data.d;
            $("#listCategoria").slideUp(500, function () {
                $("#newCategoria").slideDown(500);
            });
            $('#Nombre').val(ObjCategoria.Nombre);
            $('#Descripcion').val(ObjCategoria.Descripcion);
            $("#Precio").val(ObjCategoria.PrecioVenta);
            $('#ContentPlaceHolder1_hdnIdCategoria').val(ObjCategoria.IdCategoriaAcademia);
        }
    });
}

function guardarCategoria() {
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
    if (!$('#Precio').val() || !$('#Precio').val().trim().length) {
        $("#Precio").parent().addClass("has-error");
        return false;
    } else {
        $("#Precio").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdCategoria').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            descripcion: $('#Descripcion').val(),
            precio: $("#Precio").val(),
            id: $('#ContentPlaceHolder1_hdnIdCategoria').val()
        };
        $.ajax({
            url: 'categorias.aspx/ActualizarCategoria',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCategoria = data.d;
                var linkActualizar = $('.actualizarFilaCategoria' + objCategoria.IdCategoriaAcademia);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaCategoria' + objCategoria.IdCategoriaAcademia + '" href="javascript:actualizarCategoria(' + objCategoria.IdCategoriaAcademia + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaCategoria' + objCategoria.IdCategoriaAcademia + '" href="javascript:eliminarCategoria(' + objCategoria.IdCategoriaAcademia + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objCategoria.Nombre + '</td>' +
                    '<td>' + objCategoria.Descripcion + '</td>' +
                    '<td>' + objCategoria.PrecioVenta + '</td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdCategoria').val('');
                $("#newCategoria").slideUp(500, function () {
                    $("#listCategoria").slideDown(500);
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
            descripcion: $('#Descripcion').val(),
            precio: $('#Precio').val()
        };
        $.ajax({
            url: 'categorias.aspx/InsertarCategoria',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCategoria = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaCategoria' + objCategoria.IdCategoriaAcademia + '" href="javascript:actualizarCategoria(' + objCategoria.IdCategoriaAcademia + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaCategoria' + objCategoria.IdCategoriaAcademia + '" href="javascript:eliminarCategoria(' + objCategoria.IdCategoriaAcademia + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objCategoria.Nombre + '</td>' +
                    '<td>' + objCategoria.Descripcion + '</td>' +
                    '<td>' + objCategoria.PrecioVenta + '</td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                $("#newCategoria").slideUp(500, function () {
                    $("#listCategoria").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
                $("#Descripcion").parent().addClass("has-error");
                $("#Precio").parent().addClass("has-error");
            }
        });
    }
}