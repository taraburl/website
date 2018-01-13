$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

function cancelnewVenta() {
    $("#newVenta").slideUp(500, function () {
        $("#listVenta").slideDown(500);
    });
}

function newVenta() {
    $(".input-group").removeClass('has-error');
    $("#listVenta").slideUp(500, function () {
        $("#newVenta").slideDown(500);
    });
}

function actualizarVenta(id) {
    var parametros = {
        idVenta: id
    };
    $.ajax({
        url: 'ventas.aspx/ActualizarVenta',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objVenta = data.d;
            mensajeConfirmacion("Bien!", "Venta Finalizada", "success");
            var linkActualizar = $('.actualizarFilaVenta' + objVenta.IdOrdenCompra);
            var trActualizado = linkActualizar.parent().parent();
            var tr =
                '<td>' + objVenta.IdOrdenCompra + '</td>' +
                '<td>' + objVenta.Estado.Nombre + '</td>' +
                '<td>' + objVenta.TipoPago.Nombre + '</td>' +
                '<td>' + objVenta.Usuario.Nombre + '' + objVenta.Usuario.Apellido + '</td>' +
                '<td>' + objVenta.Total + '</td>' +
                '<td>' + objVenta.FechaForDisplay + '</td>' +
                '<td>' + objVenta.HoraForDisplay + '</td>' + 
                '<td></td>' +
                '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaVenta' + objVenta.IdOrdenCompra + '" href="javascript:eliminarVenta(' + objVenta.IdOrdenCompra + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
            trActualizado.html(tr);
        },
        error: function () {
            mensajeConfirmacion("Error", "Error al Finalizar la Venta", "error");

        }
    });
}

function guardarUsuario() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if (!$('#Apellidos').val() || !$('#Apellidos').val().trim().length) {
        $("#Apellidos").parent().addClass("has-error");
        return false;
    } else {
        $("#Apellidos").parent().removeClass('has-error');
    }
    if (!$('#Email').val() || !$('#Email').val().trim().length) {
        $("#Email").parent().addClass("has-error");
        return false;
    } else {
        $("#Email").parent().removeClass('has-error');
    }
    if (!valEmail($('#Email').val())) {
        $("#Email").parent().addClass("has-error");
        return false;
    } else {
        $("#Email").parent().removeClass('has-error');
    }
    if (!$('#UserName').val() || !$('#UserName').val().trim().length) {
        $("#UserName").parent().addClass("has-error");
        return false;
    } else {
        $("#UserName").parent().removeClass('has-error');
    }
    if (!$('#Password').val() || !$('#Password').val().trim().length) {
        $("#Password").parent().addClass("has-error");
        return false;
    } else {
        $("#Password").parent().removeClass('has-error');
    }
    var parametros = {
        nombre: $('#Nombre').val(),
        apellido: $('#Apellidos').val(),
        email: $("#Email").val(),
        telefono: $('#Telefono').val(),
        celular: $('#Celular').val(),
        direccion: $("#Direccion").val(),
        username: $("#UserName").val(),
        password: $("#Password").val(),
        tipo: "Usuario Normal"
    };
    $.ajax({
        url: '../usuarios.aspx/InsertarUsuario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUsuario = data.d;
            $('#ContentPlaceHolder1_IdUsuario').append($("<option value='" + objUsuario.IdUsuario + "'></option>").text(objUsuario.Nombre + " " + objUsuario.Apellido));
            $('#ContentPlaceHolder1_IdUsuario').val(objUsuario.IdUsuario).trigger('change');
            mensajeConfirmacion("Bien!", "Usuario Creado", "success");
            $('#nuevoCliente').modal('hide');
            $('#Nombre').val('');
            $('#Apellidos').val('');
            $("#Email").val('');
            $('#Telefono').val('');
            $('#Celular').val('');
            $("#Direccion").val('');
            $("#UserName").val('');
            $("#Password").val('');
        },
        error: function () {
            $("#UserName").parent().addClass("has-error");
        }
    });
}