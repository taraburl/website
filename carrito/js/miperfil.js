$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    cargarDatosCliente();
});

function cargarDatosCliente() {
    var IdUsuario = sessionStorage.getItem("idUsuario");
    var parametros = {
        idUser: IdUsuario
    };
    $.ajax({
        url: '../../admin/Usuarios.aspx/TraerUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUser = data.d;
            $('#Nombre').val(objUser.Nombre);
            $('#Apellido').val(objUser.Apellido);
            $("#Email").val(objUser.Email);
            $('#Telefono').val(objUser.Telefono);
            $('#Celular').val(objUser.Celular);
            $("#Direccion").val(objUser.Direccion);
            $("#Ciudad").val(objUser.IdCiudad);
            $("#UserName").val(objUser.Username);
            $("#ContentPlaceHolder1_IdUsuario").val(objUser.IdUsuario);
            $("#Password").val(objUser.Password);
            $("#TipoCliente").val(objUser.TipoCliente);
            $("#IdUsuario").val(objUser.IdUsuario);
        }
    });
}

function actualizarPerfil() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-danger");
        $("#Nombre").addClass("form-control-danger");
        return false;
    } else {
        $("#Nombre").parent().removeClass("has-danger");
        $("#Nombre").removeClass('form-control-danger');
    }
    if (!$('#Apellido').val() || !$('#Apellido').val().trim().length) {
        $("#Apellido").parent().addClass("has-danger");
        $("#Apellido").addClass("form-control-danger");
        return false;
    } else {
        $("#Apellido").parent().removeClass("has-danger");
        $("#Apellido").removeClass('form-control-danger');
    }
    if (!$('#Email').val() || !$('#Email').val().trim().length) {
        $("#Email").parent().addClass("has-danger");
        $("#Email").addClass("form-control-danger");
        return false;
    } else {
        $("#Email").parent().removeClass("has-danger");
        $("#Email").removeClass('form-control-danger');
    }
    if (!valEmail($('#Email').val())) {
        $("#Email").parent().addClass("has-danger");
        $("#Email").addClass("form-control-danger");
        return false;
    } else {
        $("#Email").parent().removeClass("has-danger");
        $("#Email").removeClass('form-control-danger');
    }
    if (!$('#UserName').val() || !$('#UserName').val().trim().length) {
        $("#UserName").parent().addClass("has-danger");
        $("#UserName").addClass("form-control-danger");
        return false;
    } else {
        $("#UserName").parent().removeClass("has-danger");
        $("#UserName").removeClass('form-control-danger');
    }
    var parametros = {
        nombre: $('#Nombre').val(),
        apellido: $('#Apellido').val(),
        email: $("#Email").val(),
        telefono: $('#Telefono').val(),
        celular: $('#Celular').val(),
        direccion: $("#Direccion").val(),
        username: $("#UserName").val(),
        password: $("#Password").val(),
        tipo: $("#TipoCliente").val(),
        idUser: $("#ContentPlaceHolder1_IdUsuario").val()
    };
    $.ajax({
        url: '../../admin/Usuarios.aspx/ActualizarUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInsertado = data.d;
            sessionStorage.setItem("idUsuario", objInsertado.IdUsuario);
            sessionStorage.setItem("nombre", objInsertado.Username);
            sessionStorage.setItem("fullName", objInsertado.Nombre + " " + objInsertado.Apellido);
            sessionStorage.setItem("tipouser", objInsertado.TipoCliente);
            sessionStorage.setItem("imagen", objInsertado.Imagen);
            $("#nombre-completo").text(objInsertado.Nombre + " " + objInsertado.Apellido);

            $("#nombre-perfil-carrito").text(objInsertado.Nombre + " " + objInsertado.Apellido);
            $("#nombre-carrito-user").text(objInsertado.Nombre + " " + objInsertado.Apellido);

        },
        error: function () {
            $("#UserName").parent().addClass("has-danger");
            $("#UserName").addClass("form-control-danger");
            $("#UserName").parent().addClass("has-danger");
            $("#UserName").addClass("form-control-danger");
        }
    });
}

function actualizarPassword() {
    if (!$('#PasswordActual').val() || !$('#PasswordActual').val().trim().length) {
        $("#PasswordActual").parent().addClass("has-danger");
        $("#PasswordActual").addClass("form-control-danger");
        return false;
    } else {
        $("#PasswordActual").parent().removeClass("has-danger");
        $("#PasswordActual").removeClass('form-control-danger');
    }
    if (!$('#NewPassword').val() || !$('#NewPassword').val().trim().length) {
        $("#NewPassword").parent().addClass("has-danger");
        $("#NewPassword").addClass("form-control-danger");
        return false;
    } else {
        $("#NewPassword").parent().removeClass("has-danger");
        $("#NewPassword").removeClass('form-control-danger');
    }
    if (!$('#NewPassword2').val() || !$('#NewPassword2').val().trim().length) {
        $("#NewPassword2").parent().addClass("has-danger");
        $("#NewPassword2").addClass("form-control-danger");
        return false;
    } else {
        $("#NewPassword2").parent().removeClass("has-danger");
        $("#NewPassword2").removeClass('form-control-danger');
    }
    if ($('#PasswordActual').val() !== $("#Password").val()) {
        $("#PasswordActual").parent().addClass("has-danger");
        $("#PasswordActual").addClass("form-control-danger");
        return false;
    } else {
        $("#PasswordActual").parent().removeClass("has-danger");
        $("#PasswordActual").removeClass('form-control-danger');
    }
    if ($('#NewPassword').val() !== $("#NewPassword2").val()) {
        $("#NewPassword").parent().addClass("has-danger");
        $("#NewPassword").addClass("form-control-danger");
        $("#NewPassword2").parent().addClass("has-danger");
        $("#NewPassword2").addClass("form-control-danger");
        return false;
    } else {
        $("#NewPassword").parent().removeClass("has-danger");
        $("#NewPassword").removeClass('form-control-danger');
        $("#NewPassword2").parent().addClass("has-danger");
        $("#NewPassword2").addClass("form-control-danger");
    }
    var parametros = {
        password: $("#NewPassword").val(),
        idUser: $("#IdUsuario").val()
    };
    $.ajax({
        url: '../../admin/Usuarios.aspx/ActualizarPassword',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInsertado = data.d;
            window.location.href = "MiPerfil.aspx"
        },
        error: function () {
            $("#PasswordActual").parent().addClass("has-danger");
            $("#PasswordActual").addClass("form-control-danger");
            $("#NewPassword").parent().addClass("has-danger");
            $("#NewPassword").addClass("form-control-danger");
            $("#NewPassword2").parent().addClass("has-danger");
        }
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}

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

function subirFoto() {
    window.location.href = "SubirFotoUsuario.aspx?ID=" + sessionStorage.getItem("idUsuario");
}