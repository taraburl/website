$(document).ready(function () {

});

function agregarProducto(id) {
    var parametros = {
        idProducto: id
    };
    $.ajax({
        url: 'inicio.aspx/TraerProducto',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjProducto = data.d;
            var id = ObjProducto.IdProducto;
            var stock = ObjProducto.Stock;
            if (stock >= 1) {
                var carrito = JSON.parse(localStorage.getItem("carrito"));
                carrito[id] = {
                    pedidoId: 0,
                    productoId: id,
                    cantidad: 1,
                    nombre: ObjProducto.Nombre,
                    precio: ObjProducto.PrecioVenta,
                    subTotal: (ObjProducto.PrecioVenta * 1)
                };
                var json = JSON.parse(localStorage.getItem("carrito"));
                var obj = json[id];
                if (typeof obj == "undefined") {
                    localStorage.setItem("carrito", JSON.stringify(carrito));
                    cargarProdcuto(id);
                }
                iziToast.show({
                    title: 'Bien!',
                    message: 'Producto agregado con exito',
                    position: 'topRight',
                    color: 'green'
                });

            } else {
                iziToast.show({
                    title: 'Advertencia!',
                    message: 'No hay stock disponible',
                    position: 'topRight',
                    color: 'red'
                });

            }
        }
    });
}

function cargarProdcuto(id) {
    var detallePedido = $("#detallePedido");
    var parametros = {
        idProducto: id
    };
    $.ajax({
        url: 'inicio.aspx/TraerProducto',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjProducto = data.d;
            var json = JSON.parse(localStorage.getItem("carrito"));
            var obj = json[ObjProducto.IdProducto];
            var ids = Object.keys(json);
            detallePedido.append("<div class='dropdown-product-item' id='cart" + ObjProducto.IdProducto + "'>" +
                "<span class='dropdown-product-remove'>" +
                     "<a href='javascript:eliminar(" + obj.productoId + ")'>" +
                        "<i class='icon-cross'></i>" +
                     "</a>" +
                "</span>" +
                "<a class='dropdown-product-thumb' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" +
                "<img src='../images/productos/" + ObjProducto.IdProducto + ".jpg' alt='Product' /></a>" +
                " <div class='dropdown-product-info'>" +
                "<a class='dropdown-product-title' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" + ObjProducto.Nombre + "</a>" +
                "<span class='dropdown-product-details'>" + obj.cantidad + " x BS. " + obj.precio + "</span>" +
                "</div></div>"
                );
            $("#cantProductos").text(ids.length);
            cargarTotal();
        }
    });
}

function cargarTotal() {
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    var total = 0;
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        total = total + obj.precio;
    }
    $("#Total").text("Bs. " + total);
    $("#TotalDetalle").text("Bs. " + total);
}

function agregarCarrito2(id) {
    var IdCompra = $("#ContentPlaceHolder1_hdnIdCompra").val();
    if (IdCompra == "") {
        var IdUsuario = sessionStorage.getItem("idUsuario");
        var parametros = {
            idUsuario: IdUsuario
        };
        $.ajax({
            url: 'inicio.aspx/InsertarOrdenCompra',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objOrdenCompra = data.d;
                $("#ContentPlaceHolder1_hdnIdCompra").val(objOrdenCompra.IdOrdenCompra);
            },
            error: function () {
            }
        });
    }
    var NombreProducto = $("#productonombre" + id).val();
    var PrecioProducto = $("#productoprecio" + id).val();
    var IdProducto = id;
    var existe = $("#tbl_carrito").find('tr:contains(' + NombreProducto + ')');
    if (existe.length > 0) {
        alertify.set('notifier', 'delay', 2);
        alertify.set('notifier', 'position', 'top-center');
        alertify.error('El producto ya esta en el carrito');
        alertify.set('notifier', 'delay', delay);
        return;
    }
    var parametros = {
        idProducto: IdProducto,
        idOrdenCompra: $("#ContentPlaceHolder1_hdnIdCompra").val(),
        cantidad: 1
    };
    $.ajax({
        url: 'inicio.aspx/InsertarCarrito',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objCarrito = data.d;
            var TotalCarrito = $("#TotalCarrito").val();
            TotalCarrito = parseFloat(TotalCarrito) + parseFloat(PrecioProducto);
            var tr = '<tr>' +
                            '<td><a href="javascript:eliminarCarrito(' + IdProducto + ');" class="btn btn-danger eliminarFilaCarrito' + IdProducto + '"><i class="fa fa-trash"></i></a></td>' +
                            '<td><input type="hidden" value="carrito' + IdProducto + '" class="actualizarFila' + IdProducto + '"/>' + NombreProducto + '</td>' +
                            '<td>1</td>' +
                            '<td>' + PrecioProducto + '</td>' +
                            '<td><input type="hidden" value="' + PrecioProducto + '" id="carritoSub' + IdProducto + '"/>' + PrecioProducto + '</td>' +
                            '</tr>';
            var table = $('#tbl_carrito');
            table.find('tbody').append(tr);
            $("#total-carrito").text(TotalCarrito);
            $("#TotalCarrito").val(TotalCarrito);
            var delay = alertify.get('notifier', 'delay');
            alertify.set('notifier', 'delay', 2);
            alertify.set('notifier', 'position', 'top-center');
            alertify.success('Producto gregado Con Exito al Carrito');
            alertify.set('notifier', 'delay', delay);
        },
        error: function () {
        }
    });
}

function agregarCarrito(id) {
    var IdCompra = $("#ContentPlaceHolder1_hdnIdCompra").val();
    if (IdCompra == "") {
        var IdUsuario = sessionStorage.getItem("idUsuario");
        var parametros = {
            idUsuario: IdUsuario
        };
        $.ajax({
            url: 'inicio.aspx/InsertarOrdenCompra',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objOrdenCompra = data.d;
                $("#ContentPlaceHolder1_hdnIdCompra").val(objOrdenCompra.IdOrdenCompra);
            },
            error: function () {
            }
        });
    }
    var NombreProducto = $("#productonombre" + id).val();
    var PrecioProducto = $("#productoprecio" + id).val();
    var IdProducto = id;
    var existe = $("#tbl_carrito").find('tr:contains(' + NombreProducto + ')');
    if (existe.length > 0) {
        alertify.set('notifier', 'delay', 2);
        alertify.set('notifier', 'position', 'top-center');
        alertify.error('El producto ya esta en el carrito');
        alertify.set('notifier', 'delay', delay);
        return;
    }
    var parametros = {
        idProducto: IdProducto,
        idOrdenCompra: $("#ContentPlaceHolder1_hdnIdCompra").val(),
        cantidad: 1
    };
    $.ajax({
        url: 'inicio.aspx/InsertarCarrito',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objCarrito = data.d;
            var TotalCarrito = $("#TotalCarrito").val();
            TotalCarrito = parseFloat(TotalCarrito) + parseFloat(PrecioProducto);
            var tr = '<tr>' +
                            '<td><a href="javascript:eliminarCarrito(' + IdProducto + ');" class="btn btn-danger eliminarFilaCarrito' + IdProducto + '"><i class="fa fa-trash"></i></a></td>' +
                            '<td><input type="hidden" value="carrito' + IdProducto + '" class="actualizarFila' + IdProducto + '"/>' + NombreProducto + '</td>' +
                            '<td>1</td>' +
                            '<td>' + PrecioProducto + '</td>' +
                            '<td><input type="hidden" value="' + PrecioProducto + '" id="carritoSub' + IdProducto + '"/>' + PrecioProducto + '</td>' +
                            '</tr>';
            var table = $('#tbl_carrito');
            table.find('tbody').append(tr);
            $("#total-carrito").text(TotalCarrito);
            $("#TotalCarrito").val(TotalCarrito);
            var delay = alertify.get('notifier', 'delay');
            alertify.set('notifier', 'delay', 2);
            alertify.set('notifier', 'position', 'top-center');
            alertify.success('Producto gregado Con Exito al Carrito');
            alertify.set('notifier', 'delay', delay);
        },
        error: function () {
        }
    });
}

function eliminarCarrito(id) {
    var IdProducto = id;
    var SubTotal = $("#carritoSub" + IdProducto).val();
    var TotalCarrito = $("#TotalCarrito").val();
    TotalCarrito = parseFloat(TotalCarrito) - parseFloat(SubTotal);
    $("#TotalCarrito").val(TotalCarrito);
    $("#total-carrito").text(TotalCarrito);
    var linkEliminar = $('.eliminarFilaCarrito' + IdProducto);
    var trActualizado = linkEliminar.parent().parent();
    trActualizado.remove();
}

function pagar() {
    var Total = $("#TotalCarrito").val();
    Total = parseFloat(Total);
    if (Total <= 0) {
        return alert("Saldo 0");
    } else {
        window.location.href = "/carrito/ProcesoDePago.aspx?Total=" + Total + "&NrOrden=" + $("#ContentPlaceHolder1_hdnIdCompra").val();
    }
}