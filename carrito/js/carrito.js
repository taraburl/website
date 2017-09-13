$(document).ready(function () {
    $(".select2").select2();
});

function traerproducto(id) {
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
            $('#nombre-producto').text(ObjProducto.Nombre);
            $("#nombre-producto2").val(ObjProducto.Nombre);
            $('#descripcion-producto').text(ObjProducto.Descripcion);
            $('#precio-producto').text(ObjProducto.PrecioVenta);
            $("#precio-producto2").val(ObjProducto.PrecioVenta);
            $('#id-producto').val(ObjProducto.IdProducto);
            $("#medida").text(ObjProducto.Medida);
            $("#categoria").text(ObjProducto.Categoria.Nombre);
            $("#img-producto").attr("src", "/images/productos/" + ObjProducto.IdProducto + ".jpg");
            $('#myModal9').modal('show');
        }
    });
}

function agregarCarrito2(id) {
    var NombreProducto = $("#productonombre" + id).val();
    var PrecioProducto = $("#productoprecio" + id).val();
    var IdProducto = id;
    var existe = $("#tbl_carrito").find('tr:contains(' + NombreProducto + ')');
    if (existe.length > 0) {
        return;
    }
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
}

function agregarCarrito(id) {
    var PrecioProducto = $("#precio-producto2").val();
    var NombreProducto = $("#nombre-producto2").val();
    var IdProducto = $("#idproducto").val();
    var existe = $("#tbl_carrito").find('tr:contains(' + NombreProducto + ')');
    if (existe.length > 0) {
        return;
    }
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
        window.location.href = "/carrito/ProcesoDePago.aspx?Total=" + Total;
    }
}