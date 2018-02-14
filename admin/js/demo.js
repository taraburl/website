(function () {
    function estadosPartidos() {
        var parametros = {};
        $.ajax({
            url: '../../index.aspx/EstadosPartidos',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                console.log("ejecutado correctamente");
            },
            error: function (data) {
                console.log("error al ejecutar");
            }
        });
    }
    estadosPartidos();
    setInterval(estadosPartidos, 600000);
})();

function logout() {
    sessionStorage.clear();
    window.location.reload();
}

$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        window.location.href = "../index.aspx";
    } else {
        $("#usernamelog3").text(sessionStorage.getItem('fullName'));
        $("#usernamelog2").text(sessionStorage.getItem('fullName'));
        $("#usernamelog").text(sessionStorage.getItem('fullName'));
        document.getElementById("userimglog3").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
        document.getElementById("userimglog2").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
        document.getElementById("userimglog").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
    }
    if (sessionStorage.getItem("tipouser") != "Administrador") {
        window.location.href = "../login.aspx";
    }
});

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function NumCheck(e, field) {
    key = e.keyCode ? e.keyCode : e.which
    // backspace
    if (key == 8)
        return true
    // 0-9
    if (key > 47 && key < 58) {
        if (field.value == "")
            return true
        regexp = /.[0-9]{10}$/
        return !(regexp.test(field.value))
    }
    // .
    if (key == 44) {
        if (field.value == "")
            return false
        regexp = /^[0-9]+$/
        return regexp.test(field.value)
    }
    // other key
    return false
}

function mensajeConfirmacion(titulo, mensaje, tipo) {
    swal({
        title: titulo,
        text: mensaje,
        type: tipo,
        showConfirmButton: true,
        closeOnConfirm: true
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}

function RealizarPago() {
    iconsultar = 0;
    var data = {
        nroorden: $("#OrdenTigo").val(),
        linea: $("#TelefonoTigo").val(),
        monto: $("#Precio").val()
    };
    data = JSON.stringify(data);

    // Example E - call a function that returns an object.  .net will serialise the object as JSON for us.
    // Params are sent in JSON format, data that comes back is a JSON object
    $.ajax({
        url: "/realizarpago.aspx/RealizarPago",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        // DesbloquearPantalla();
        // alert('Complet');
        console.log('Completado RealizarPago');
    }).done(function (respuesta) {
        var res = respuesta.d;
        $("#hmensaje").html('Respuesta RP: ' + res.resultado);
        console.log('Done RealizarPago', res.resultado);
        snroOrden = res.orderId;
        ProgramarConsultarEstadoPago();
    }).error(function (er) {
        alert('Erorrrrrr');
    });
}

function ProgramarConsultarEstadoPago() {
    var itime = 30;
    if (iconsultar > 0) {
        itime = 10;
    }
    setTimeout(ConsultarEstadoPago, (itime * 1000));
}

function ConsultarEstadoPago() {
    var data = {
        nroorden: snroOrden
    };
    data = JSON.stringify(data);

    $.ajax({
        url: "/realizarpago.aspx/ConsultarEstado",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        console.log('Completado ConsultarEstado');
    }).done(function (respuesta) {
        iconsultar++;
        var res = respuesta.d;
        $("#hmensaje").html('Respuesta CE: ' + res.resultado);
        console.log('Done ConsultarEstado, Nro intentos: ' + iconsultar, res.resultado);
        console.log('Done ConsultarEstado', res);
        // Verificar estado de pago
        if (res.exito == false && iconsultar < 6 && res.codRes == '3') {
            ProgramarConsultarEstadoPago();
            console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
        }
        else if (res.exito == true) {
            console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
        }
        else {
            console.log('Limite de pedidos ConsultarEstado, Nro intentos: ' + iconsultar);
        }
    }).error(function (er) {
        alert('Erorrrrrr');
    });
}


function fechaCorrecta(fecha) {
    var date = fecha.split("/");
    return date[0] + "/" + date[1] + "/" + date[2];
}