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

$(document).ready(function () {
    if (!localStorage.getItem("carrito")) {
        (localStorage.setItem("carrito", "{}"));
    }
    if (!sessionStorage.getItem("fullName")) {
        $("#UseriIcons").hide();
        $("#loginIcons").show();
        $(".user-name").text("Mi Perfil");
        $(".imgPerfil").attr("src", "../images/profile.png");
    } else {
        $(".user-name").text(sessionStorage.getItem("fullName"));
        $("#nombre-perfil-carrito").text(sessionStorage.getItem("fullName"));
        $("#nombre-carrito-user").text(sessionStorage.getItem("fullName"));
        $(".imgPerfil").attr("src", "/images/usuarios/" + sessionStorage.getItem("idUsuario") + ".png");
    }
    if (sessionStorage.getItem("tipouser") == "Administrador") {
        $("#admin").show();
        $("#admincell").show();
    } else {
        $("#admin").hide();
        $("#admincell").hide();
    }
    loadCart();
    cargarMiCarrito();
    loadCartPay();
    $('body').on('click', '#videos .embed', function (e) {
        e.preventDefault();
        var dataVideo = $('#videos .embed img').attr('data-video');
        $('#loader').fadeIn(400);
        $('#videos .embed').html('').append('<iframe frameborder="0" allowfullscreen></iframe>');
        $('#videos .embed iframe').attr({ src: dataVideo }).load(function () { });
        return false;
    });
    $('body').on('click', '#videos li a', function (e) {
        e.preventDefault();

        $('#videos li a').removeClass('active').filter(this).addClass('active');

        $('#loader').fadeIn(400);
        $('#videos .embed').html('').append('<iframe frameborder="0" allowfullscreen></iframe>');
        $('#videos .embed iframe').attr({ src: $(this).attr('data-video') }).load(function () { });

        return false;

    });
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
    iziToast.show({
        title: 'Bien!',
        message: 'Producto eliminado del carrito',
        position: 'topRight',
        color: 'green'
    });
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
    iziToast.show({
        title: 'Bien!',
        message: 'Carrito vaciado correctamente',
        position: 'topRight',
        color: 'green'
    });
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
