$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
    } else {
        return window.location.href = "index.aspx";
    }
    $('.form-control').keypress(function () {
        $(".log-name").removeClass('wrong-entry');
        $(".log-pass").removeClass('wrong-entry');
        $('.sign-name').removeClass('wrong-entry');
        $('.sign-last').removeClass('wrong-entry');
        $('.sign-user').removeClass('wrong-entry');
        $('.sign-pass').removeClass('wrong-entry');
        $('.sign-pass2').removeClass('wrong-entry');
        $('.sign-email').removeClass('wrong-entry');
        $('.email-change').removeClass('worng-entry');
    });
});

function logInUser() {
    var usern = $('#UserName').val();
    var pass = $('#Password').val();
    if (usern == "") {
        $(".log-name").addClass('wrong-entry');
        return false;
    }
    if (pass == "") {
        $(".log-pass").addClass('wrong-entry');
        return false;
    }
    var parametros = {
        username: usern,
        password: pass
    };
    $.ajax({
        url: 'login.aspx/LogInUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInsertado = data.d;
            if (objInsertado != null) {
                sessionStorage.setItem("idUsuario", objInsertado.IdUsuario);
                sessionStorage.setItem("nombre", objInsertado.Username);
                sessionStorage.setItem("fullName", objInsertado.Nombre + " " + objInsertado.Apellido);
                sessionStorage.setItem("tipouser", objInsertado.TipoCliente);
                sessionStorage.setItem("imagen", objInsertado.Imagen);
                if (objInsertado.TipoCliente == "Administrador") {
                    window.location.href = "admin/index.aspx";
                } else {
                    window.location.href = "index.aspx";
                }
            } else {
                $(".log-name").addClass('wrong-entry');
                $(".log-pass").addClass('wrong-entry');
            }
        }
    });
}

function insertUser() {
    var nombre = $('#Nombre').val();
    var apellidos = $('#Apellidos').val();
    var nombreUsuario = $('#NombreUsuario').val();
    var contrasena = $('#Contrasena').val();
    var contrasena2 = $('#Contrasena2').val();
    var email = $('#Email').val();
    if (nombre == '') {
        $('.sign-name').addClass('wrong-entry');
        return false;
    }
    if (apellidos == '') {
        $('.sign-last').addClass('wrong-entry');
        return false;
    }
    if (nombreUsuario == '') {
        $('.sign-user').addClass('wrong-entry');
        return false
    }
    if (contrasena == '') {
        $('.sign-pass').addClass('wrong-entry');
        return false;
    }
    if (contrasena2 == '') {
        $('.sign-pass2').addClass('wrong-entry');
        return false;
    }
    if (contrasena != contrasena2) {
        $('.sign-pass').addClass('wrong-entry');
        $('.sign-pass2').addClass('wrong-entry');
        return false;
    }
    if (email == '') {
        $('.sign-email').addClass('wrong-entry');
        return false;
    }
    if (!valEmail(email)) {
        $('.sign-email').addClass('wrong-entry');
        return false;
    }
    var parametros = {
        nombre: nombre,
        apellido: apellidos,
        email: email,
        username: nombreUsuario,
        password: contrasena
    };
    $.ajax({
        url: 'LogIn.aspx/SignUpUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInsertado = data.d;
            if (objInsertado != null) {
                sessionStorage.setItem("idUsuario", objInsertado.IdUsuario);
                sessionStorage.setItem("nombre", objInsertado.Username);
                sessionStorage.setItem("fullName", objInsertado.Nombre + " " + objInsertado.Apellido);
                sessionStorage.setItem("tipouser", objInsertado.TipoCliente);
                sessionStorage.setItem("imagen", objInsertado.Imagen);
                if (objInsertado.TipoUser == "Administrador") {
                    window.location.href = "admin/index.aspx";
                } else {
                    window.location.href = "index.aspx";
                }
            } else {
                $('.sign-user').addClass('wrong-entry');
                $('.sign-email').addClass('wrong-entry');
            }
        },
        error: function () {
            $('.sign-user').addClass('wrong-entry');
            $('.sign-email').addClass('wrong-entry');
        }
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}

function mostrarSignUp() {
    $('#Nombre').val('');
    $('#Apellidos').val('');
    $('#NombreUSuario').val('');
    $('#Contrasena').val('');
    $('#Contrasena2').val('');
    $('#Email').val('');
    $("#LogIn").slideUp(500, function () {
        $("#changePassword").slideUp(500, function () {
            $("#SignUp").slideDown(500);
        });
    });
}

function mostrarLogIn() {
    $('#UserName').val('');
    $('#Password').val('');
    $("#SignUp").slideUp(500, function () {
        $("#changePassword").slideUp(500, function () {
            $("#LogIn").slideDown(500);
        });
    });
}

function mostrarChangePassword() {
    $("emailpassword").val('');
    $("#SignUp").slideUp(500, function () {
        $("#LogIn").slideUp(500, function () {
            $("#changePassword").slideDown(500);
        });
    });
}

function changePassword() {
    var nombre = $('#emailpassword').val();
    if (nombre == '') {
        $('.email-change').addClass('wrong-entry');
        return false;
    }
}