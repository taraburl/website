$(document).ready(function () {
    cargar();
});

function cargar() {
    var id = sessionStorage.getItem('idUsuario');
    var parametros = {
        idUser: id
    };
    $.ajax({
        url: 'MyProfile.aspx/TraerUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUser = data.d;
            $('#nombrep').text(objUser.Nombre + " " + objUser.Apellido);
            $("#emailp").text(objUser.Email);
            $('#telefonop').text(objUser.Telefono);
            $('#celularp').text(objUser.Celular);
            $("#usernamep").text(objUser.Username);
            document.getElementById("imagenp").src = "../" + sessionStorage.getItem('imagen');
        }
    });
}


function actualizarUser() {
    var id = sessionStorage.getItem('idUsuario');
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
        url: 'MyProfile.aspx/TraerUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUser = data.d;
            $("#actual").slideUp(500, function () {
                $("#editar").slideDown(500);
            });
            $('#Nombre').val(objUser.Nombre);
            $('#Apellidos').val(objUser.Apellido);
            $("#Email").val(objUser.Email);
            $('#Telefono').val(objUser.Telefono);
            $('#Celular').val(objUser.Celular);
            $("#Direccion").val(objUser.Direccion);
            $("#UserName").val(objUser.Username);
            $("#Password").val(objUser.Password);
            $('#ContentPlaceHolder1_hdnIdUser').val(objUser.IdUsuario);
        }
    });
}

function cancelnewuser() {
    $("#editar").slideUp(500, function () {
        $("#actual").slideDown(500);
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
    if (!$('#Password2').val() || !$('#Password2').val().trim().length) {
        $("#Password2").parent().addClass("has-error");
        return false;
    } else {
        $("#Password2").parent().removeClass('has-error');
    }
    if ($('#Password2').val() !== $('#Password').val()) {
        $("#Password2").parent().addClass("has-error");
        $("#Password").parent().addClass("has-error");
    } else {
        $("#Password2").parent().removeClass('has-error');
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
        tipo: sessionStorage.getItem("tipouser"),
        idUser: sessionStorage.getItem("idUsuario")
    };
    $.ajax({
        url: '../admin/Usuarios.aspx/ActualizarUser',
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
            $("#editar").slideUp(500, function () {
                $("#actual").slideDown(500);
            });
            cargar();
            $("#miperfil a").text(objInsertado.Nombre + " " + objInsertado.Apellido);
        },
        error: function () {
            $("#UserName").parent().addClass("has-error");
            $("#Email").parent().addClass("has-error");
        }
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}