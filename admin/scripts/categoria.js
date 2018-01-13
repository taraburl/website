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
        url: 'Categoria.aspx/EliminarCategoria',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al ELiminar la Categoria", "error");;
                return;
            }
            mensajeConfirmacion("Bien!", "Categoria Eliminada", "success");
            var linkEliminar = $('.eliminarFilaCategoria' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}

function actualizarCategoria(id) {
    $('#Nombre').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idCategoria: id
    };
    $.ajax({
        url: 'Categoria.aspx/TraerCategoria',
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
            $('#ContentPlaceHolder1_hdnIdCategoria').val(ObjCategoria.IdCategoria);
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
    if ($('#ContentPlaceHolder1_hdnIdCategoria').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            id: $('#ContentPlaceHolder1_hdnIdCategoria').val()
        };
        $.ajax({
            url: 'Categoria.aspx/ActualizarCategoria',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCategoria = data.d;
                var linkActualizar = $('.actualizarFilaCategoria' + objCategoria.IdCategoria);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td>' + objCategoria.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaCategoria' + objCategoria.IdCategoria + '" href="javascript:actualizarCategoria(' + objCategoria.IdCategoria + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaCategoria' + objCategoria.IdCategoria + '" href="javascript:eliminarCategoria(' + objCategoria.IdCategoria + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdCategoria').val('');
                mensajeConfirmacion("Bien!", "Categoria Actualizada", "success");
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
            nombre: $('#Nombre').val()
        };
        $.ajax({
            url: 'Categoria.aspx/InsertarCategoria',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCategoria = data.d;
                var tr = '<tr>' +
                    '<td>' + objCategoria.Nombre + '</td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-info btn-circle actualizarFilaCategoria' + objCategoria.IdCategoria + '" href="javascript:actualizarCategoria(' + objCategoria.IdCategoria + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger btn-circle actualizarFilaCategoria' + objCategoria.IdCategoria + '" href="javascript:eliminarCategoria(' + objCategoria.IdCategoria + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Categoria Creada", "success");
                $("#newCategoria").slideUp(500, function () {
                    $("#listCategoria").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    }
}