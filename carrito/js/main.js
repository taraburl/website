$(document).ready(function () {
    if (!localStorage.getItem("carrito")) {
        (localStorage.setItem("carrito", "{}"));
    }
    if (!sessionStorage.getItem("fullName")) {
        $(".user-name").text("Mi Perfil");
        $(".imgPerfil").attr("src", "../images/profile.png");
    } else {
        $(".user-name").text(sessionStorage.getItem("fullName"));
        $(".imgPerfil").attr("src", "../" + sessionStorage.getItem("imagen"));
    }
    loadCart();
    cargarMiCarrito();
    loadCartPay();
});

function logout() {
    sessionStorage.clear();
    localStorage.clear();
    window.location.href = "../index.aspx";
}

function loadCart() {
    var detallePedido = $("#detallePedido");
    detallePedido.empty();
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    var total = 0;
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        total = total + obj.precio;
        detallePedido.append(
            "<div class='dropdown-product-item' id='cart" + obj.productoId + "'>" +
                                "<span class='dropdown-product-remove'>" +
                                    "<a href='javascript:eliminar(" + obj.productoId + ")'>" +
                                        "<i class='icon-cross'></i>" +
                                    "</a>" +
                                "</span>" +
                                "<a class='dropdown-product-thumb' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" +
                                    "<img src='../images/productos/" + obj.productoId + ".jpg' alt='Product' /></a>" +
                                " <div class='dropdown-product-info'>" +
                                    "<a class='dropdown-product-title' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" + obj.nombre + "</a>" +
                                    "<span class='dropdown-product-details'>" +
                                                obj.cantidad + " x BS. " + obj.precio +
                                    "</span>" +
                                "</div>" +
              "</div>");
    }
    $("#cantProductos").text(ids.length);
    $("#Total").text("Bs. " + total);
    $("#TotalDetalle").text("Bs. " + total);
    $("#totalCartDet").text("Bs. " + total);
    $("#ContentPlaceHolder1_totalHdn").val(total);
}

function eliminar(id) {
    var carrito = JSON.parse(localStorage.getItem("carrito"));
    delete carrito[id];
    $("#cart" + id).remove();
    $("#detCart" + id).remove();
    localStorage.setItem("carrito", JSON.stringify(carrito));
    loadTotales();
}

function loadTotales() {
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    var total = 0;
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        total = total + obj.precio;
    }
    $("#cantProductos").text(ids.length);
    $("#Total").text("Bs. " + total);
    $("#TotalDetalle").text("Bs. " + total);
    $("#SubTotalBs").text("Bs. " + total);
}

function cargarMiCarrito() {
    var detallePedido = $("#detalle");
    detallePedido.empty();
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    var total = 0;
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        total = total + obj.precio;
        detallePedido.append("<tr id='detCart" + obj.productoId + "'>" +
                "<td><div class='product-item'>" +
                    "<a class='product-thumb' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" +
                    "<img src='../images/productos/" + obj.productoId + ".jpg' alt='Product' /></a>" +
                    "<div class='product-info'><h4 class='product-title'><a href='caracteristicas.aspx?ID=" + obj.productoId + "'>" + obj.nombre + "</a></h4>" +
                    "</div></div>" +
                "</td>" +
                "<td class='text-center text-lg text-medium'>" + obj.cantidad + "</td>" +
                "<td class='text-center text-lg text-medium> Bs. " + obj.precio + "</td>" +
                "<td class='text-center text-lg text-medium'>Bs. " + obj.subTotal + "</td>" +
                "<td class='text-center'><a class='remove-from-cart' href='javascript:eliminarDetalle(" + obj.productoId + ")' title='Eliminar Item'>" +
                "<i class='icon-cross'></i></a></td>" +
              "</tr>"
            );
    }
    $("#cantProductos").text(ids.length);
    $("#Total").text("Bs. " + total);
    $("#TotalDetalle").text("Bs. " + total);
    $("#SubTotalBs").text("Bs. " + total);
}

function eliminarDetalle(id) {
    var carrito = JSON.parse(localStorage.getItem("carrito"));
    delete carrito[id];
    $("#cart" + id).remove();
    $("#detCart" + id).remove();
    localStorage.setItem("carrito", JSON.stringify(carrito));
    loadTotales();
}

function limpiarCarrito() {
    localStorage.setItem("carrito", "{}");
    $("#detalle").empty();
    $("#detallePedido").empty();
    loadTotales();
}

function finalizar() {
    var total = $("#TotalDetalle").text();
    if (total == "Bs. 0") {
        alert("Carrito Vacio");
    } else {
        if (!sessionStorage.getItem("idUsuario")) {
            return window.location.href = "/Login.aspx";
        }
        window.location.href = "ProcesarPedido.aspx";
    }
}

function loadCartPay() {
    var detallePedido = $("#detalleCart");
    detallePedido.empty();
    var json = JSON.parse(localStorage.getItem("carrito"));
    var ids = Object.keys(json);
    for (var i = 0; i < ids.length; i++) {
        var valor = ids[i];
        var obj = json[valor];
        detallePedido.append("<tr id='detCart" + obj.productoId + "'>" +
                "<td><div class='product-item'>" +
                    "<a class='product-thumb' href='caracteristicas.aspx?ID=" + obj.productoId + "'>" +
                    "<img src='../images/productos/" + obj.productoId + ".jpg' alt='Product' /></a>" +
                    "<div class='product-info'><h4 class='product-title'><a href='caracteristicas.aspx?ID=" + obj.productoId + "'>" + obj.nombre + "</a></h4>" +
                    "</div></div>" +
                "</td>" +
                "<td class='text-center text-lg text-medium'>Bs. " + obj.subTotal + "</td>" +
              "</tr>"
            );
    }
}
