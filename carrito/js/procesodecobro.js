var iconsultar = 0;
var snroOrden;
function pagar(id) {
    RealizarPago();
}


function cancelar() {
    return window.location.href = "../index.aspx";
}

function FinalizarPago() {
    if (!$("#Telefono").val() || !$("#Telefono").val().trim().length) {
        return alert("Inserte el Telefono");
    }
    iconsultar = 0;
    var data = {
        nroorden: $("#ContentPlaceHolder1_OrdenNro").val(),
        linea: $("#Telefono").val(),
        monto: $("#ContentPlaceHolder1_Total").val()
    };
    data = JSON.stringify(data);

    // Example E - call a function that returns an object.  .net will serialise the object as JSON for us.
    // Params are sent in JSON format, data that comes back is a JSON object
    $.ajax({
        url: "../realizarpago.aspx/RealizarPago",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        // DesbloquearPantalla();
        // alert('Complet');
        console.log('Completado RealizarPago');
        window.location.href = "ProcesarPagoTigoMoney.aspx?Nro=" + nroorden;
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

function RealizarPago() {
    if (!$("#Telefono").val() || !$("#Telefono").val().trim().length) {
        return alert("Inserte el Telefono");
    }
    iconsultar = 0;
    var data = {
        nroorden: $("#ContentPlaceHolder1_OrdenNro").val(),
        linea: $("#Telefono").val(),
        monto: $("#ContentPlaceHolder1_Total").val()
    };
    data = JSON.stringify(data);

    // Example E - call a function that returns an object.  .net will serialise the object as JSON for us.
    // Params are sent in JSON format, data that comes back is a JSON object
    $.ajax({
        url: "../realizarpago.aspx/RealizarPago",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        // DesbloquearPantalla();
        // alert('Complet');
        console.log('Completado RealizarPago');
        window.location.href = "InscripcionCompleta.aspx?Nro=" + nroorden;
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