$(document).ready(function () {

});

function procesarPedido() {
    var Total = $("#ContentPlaceHolder1_totalHdn").val();
    var IdUsuario = sessionStorage.getItem("idUsuario");
    var IdTipoPago = $('input:radio[name=TipoPago]:checked').val();
    var estado = 2;
    if (!IdTipoPago || !IdTipoPago.trim().length) {
        return alert("Seleccione Metodo de Pago");
    }
    if (IdTipoPago == 3) {
        estado = 3;
    }
    var parametros = {
        idUsuario: IdUsuario,
        idTipoPago: IdTipoPago,
        estado: estado,
        total: Total
    };
    $.ajax({
        url: 'ProcesarPedido.aspx/InsertarOrdenCompra',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objOrdenCompra = data.d;
            insertarDetalle(objOrdenCompra.IdOrdenCompra);
            if (IdTipoPago == 1) {
                window.location.href = "ProcesarPagoTigoMoney.aspx?Nro=" + objOrdenCompra.IdOrdenCompra
                + "&Total=" + objOrdenCompra.Total;
            } else {
                localStorage.clear();
                window.location.href = "CompraCompleta.aspx?Nro=" + objOrdenCompra.IdOrdenCompra;
            }
        },
        error: function () {
            alert("Error al Realizar Transaccion");
        }
    });
}

function insertarDetalle(id) {
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    var total = 0;
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        var parametros = {
            idOrdenCompra: id,
            idProducto: obj.productoId,
            cantidadProducto: obj.cantidad,
            precio: obj.precio,
            subTotal: obj.subTotal
        };
        $.ajax({
            url: 'ProcesarPedido.aspx/InsertarCarrito',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objCarrito = data.d;
            },
            error: function () {
                alert("Error al ingresar detalle");
            }
        });
    }
}