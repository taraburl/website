var iconsultar = 0;
var snroOrden;

$(document).ready(function () {
    cargarDatosCliente();
    cargarPrecio();
    $('#ContentPlaceHolder1_IdCategoria').on('change', function () {
        cargarPrecio();
    });
    var iconsultar = 0;
    var snroOrden;
});

function cargarDatosCliente() {
    var IdUsuario = sessionStorage.getItem("idUsuario");
    var parametros = {
        idUser: IdUsuario
    };
    $.ajax({
        url: '/admin/Usuarios.aspx/TraerUser',
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
            $('#hdnIdUser').val(objUser.IdUsuario);
        }
    });
}

function cargarPrecio() {
    var IdCategoria = $("#ContentPlaceHolder1_IdCategoria").val();
    var parametros = {
        idCategoria: IdCategoria
    };
    $.ajax({
        url: '/admin/academia/categorias.aspx/TraerCategoria',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjCategoria = data.d;
            $("#Precio").val(ObjCategoria.PrecioVenta);
        }
    });
}

function inscripcion() {
    var IdCategoria = $("#ContentPlaceHolder1_IdCategoria").val();
    var IdUsuario = sessionStorage.getItem("idUsuario");
    var Inscrito = $("#Inscrito").val();
    if (!Inscrito || !Inscrito.trim().length) {
        return alert("Falta nombe del Inscrito");
    }
    var IdTipoPago = $('input:radio[name=TipoPago]:checked').val();
    if (!IdTipoPago || !IdTipoPago.trim().length) {
        return alert("Seleccione Metodo de Pago");
    }
    var Total = $("#Precio").val();
    var parametros = {
        idCategoria: IdCategoria,
        idUsuario: IdUsuario,
        idTipoPago: IdTipoPago,
        estado: 0,
        total: Total,
        inscrito: Inscrito
    };
    $.ajax({
        url: 'Inscripciones.aspx/InsertarInscripcion',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInscripciones = data.d;
            if (IdTipoPago == 1) {
                window.location.href = "ProcesoDePago.aspx?Nro=" + objInscripciones.IdInscripcion
                + "&Total=" + objInscripciones.Total;
            } else {
                window.location.href = "InscripcionCompleta.aspx?Nro=" + objInscripciones.IdInscripcion;
            }
        },
        error: function () {
            alert("Error al Realizar Transaccion");
        }
    });

}

function RealizarPago() {
    iconsultar = 0;
    var data = {
        nroorden: sessionStorage.getItem("idUsuario"),
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