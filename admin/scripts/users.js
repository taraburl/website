$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function nuewuser() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#Apellidos').val('');
    $("#Email").val('');
    $('#Telefono').val('');
    $('#Celular').val('');
    $("#Direccion").val('');
    $("#UserName").val('');
    $("#Password").val('');
    $('#ContentPlaceHolder1_hdnIdUser').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listauser").slideUp(500, function () {
        $("#nuevouser").slideDown(500);
    });
}

function cancelnewuser() {
    $("#nuevouser").slideUp(500, function () {
        $("#listauser").slideDown(500);
    });
}

function actualizarUser(id) {
    $('#Nombre').val('');
    $('#Apellidos').val('');
    $("#Email").val('');
    $('#Telefono').val('');
    $('#Celular').val('');
    $("#Direccion").val('');
    $("#UserName").val('');
    $("#Password").val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idUser: id
    };
    $.ajax({
        url: 'usuarios.aspx/TraerUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUser = data.d;
            $("#listauser").slideUp(500, function () {
                $("#nuevouser").slideDown(500);
            });
            $('#Nombre').val(objUser.Nombre);
            $('#Apellidos').val(objUser.Apellido);
            $("#Email").val(objUser.Email);
            $('#Telefono').val(objUser.Telefono);
            $('#Celular').val(objUser.Celular);
            $("#Direccion").val(objUser.Direccion);
            $("#UserName").val(objUser.Username);
            $("#Password").val(objUser.Password);
            if (objUser.Tipo == "Administrador") {
                $('#ContentPlaceHolder1_TipoUser').val("Administrador");
            } else {
                $('#ContentPlaceHolder1_TipoUser').val("Usuario Normal");
            }
            $('#ContentPlaceHolder1_hdnIdUser').val(objUser.IdUsuario);
        }
    });
}

function eliminarUsuario(id) {
    var parametros = {
        idUsuario: id
    };
    $.ajax({
        url: 'usuarios.aspx/EliminarUsuario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al eliminar el usuario", "error");
                return;
            }
            var linkEliminar = $('.eliminarFilaUsuario' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
            mensajeConfirmacion("Bien!", "Usuario Eliminado", "success");
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
    if ($('#ContentPlaceHolder1_hdnIdUser').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            apellido: $('#Apellidos').val(),
            email: $("#Email").val(),
            telefono: $('#Telefono').val(),
            celular: $('#Celular').val(),
            direccion: $("#Direccion").val(),
            username: $("#UserName").val(),
            password: $("#Password").val(),
            tipo: $('#ContentPlaceHolder1_TipoUser option:selected').text(),
            idUser: $('#ContentPlaceHolder1_hdnIdUser').val()
        };
        $.ajax({
            url: 'usuarios.aspx/ActualizarUser',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objUsuario = data.d;
                var linkActualizar = $('.actualizarFilaUsuario' + objUsuario.IdUsuario);
                var trActualizado = linkActualizar.parent().parent();
                var tr = '<td>' + objUsuario.Nombre + '</td>' +
                    '<td>' + objUsuario.Apellido + '</td>' +
                    '<td>' + objUsuario.Email + '</td>' +
                    '<td>' + objUsuario.Celular + '</td>' +
                    '<td>' + objUsuario.Direccion + '</td>' +
                    '<td>' + objUsuario.Username + '</td>' +
                    '<td>' + objUsuario.TipoCliente + '</td>' +
                    '<td><a class="btn btn-block btn-info btn-circle actualizarFilaUsuario' + objUsuario.IdUsuario + '" href="javascript:actualizarUser(' + objUsuario.IdUsuario + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaTransporte' + objUsuario.IdUsuario + '" href="javascript:eliminarUsuario(' + objUsuario.IdUsuario + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                mensajeConfirmacion("Bien!", "Usuario Actualizado", "success");
                $('#ContentPlaceHolder1_hdnIdUser').val('');
                $("#nuevouser").slideUp(500, function () {
                    $("#listauser").slideDown(500);
                });
            },
            error: function () {
                $("#UserName").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            apellido: $('#Apellidos').val(),
            email: $("#Email").val(),
            telefono: $('#Telefono').val(),
            celular: $('#Celular').val(),
            direccion: $("#Direccion").val(),
            username: $("#UserName").val(),
            password: $("#Password").val(),
            tipo: $('#ContentPlaceHolder1_TipoUser option:selected').text()
        };
        $.ajax({
            url: 'usuarios.aspx/InsertarUsuario',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objUsuario = data.d;
                var tr = '<tr>' +
                    '<td>' + objUsuario.Nombre + '</td>' +
                    '<td>' + objUsuario.Apellido + '</td>' +
                    '<td>' + objUsuario.Email + '</td>' +
                    '<td>' + objUsuario.Celular + '</td>' +
                    '<td>' + objUsuario.Direccion + '</td>' +
                    '<td>' + objUsuario.Username + '</td>' +
                    '<td>' + objUsuario.TipoCliente + '</td>' +
                    '<td><a class="btn btn-block btn-circle btn-info actualizarFilaUsuario' + objUsuario.Id + '" href="javascript:actualizarUser(' + objUsuario.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaTransporte' + objUsuario.Id + '" href="javascript:eliminarUsuario(' + objUsuario.Id + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Usuario Creado", "success");
                $("#nuevouser").slideUp(500, function () {
                    $("#listauser").slideDown(500);
                });
            },
            error: function () {
                $("#UserName").parent().addClass("has-error");
            }
        });
    }
}