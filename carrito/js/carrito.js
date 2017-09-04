$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
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
            $("#img-producto").attr("src", "/images/productos/" + ObjProducto.IdProducto + ".jpg");
            $('#myModal9').modal('show');
        }
    });
}