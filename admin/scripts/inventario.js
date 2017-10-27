$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

function cancelnewInventario() {
    $("#newInventario").slideUp(500, function () {
        $("#listInventario").slideDown(500);
    });
}

function newInventario() {
    $("#new").show();
    $("#upd").hide();
    var parametros = {
        idUsuario: sessionStorage.getItem('idUsuario'),
        tipo: "Ingreso",
        glosa: "S/G"
    };
    $.ajax({
        url: 'Inventario.aspx/InsertarInventario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInventario = data.d;
            var tr = '<tr>' +
                '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaInventario' + objInventario.IdInventario + '" href="javascript:actualizarInventario(' + objInventario.IdInventario + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaInventario' + objInventario.IdInventario + '" href="javascript:eliminarInventario(' + objInventario.IdInventario + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                '<td>' + objInventario.IdInventario + '</td>' +
                '<td>' + objInventario.Tipo + '</td>' +
                '<td>' + objInventario.Usuario.Username + '</td>' +
                '<td>' + objInventario.Glosa + '</td>' +
                '<td>' + objInventario.FechaForDisplay + '</td>' +
                '<td>' + objInventario.HoraForDisplay + '</td>' +
                '<td>' + objInventario.EstadoForDisplay + '</td>'
            '   </tr>';
            var table = $('#ContentPlaceHolder1_GridView1');
            table.find('tbody').append(tr);
            $("#Glosa").val(objInventario.Glosa);
            $('#TipoInventario').val(objInventario.Tipo).trigger('change');
            $("#ContentPlaceHolder1_hdnIdInventario").val(objInventario.IdInventario);
            $("#listInventario").slideUp(500, function () {
                $("#newInventario").slideDown(500);
            });
        },
        error: function () {
        }
    });
}

function actualizarInventario(id) {
    $('#Glosa').val('');
    $('#ContentPlaceHolder1_hdnIdInventario').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idInventario: id
    };
    $.ajax({
        url: 'Inventario.aspx/TraerInventario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInventario = data.d;
            $("#Glosa").val(objInventario.Glosa);
            $('#TipoInventario').val(objInventario.Tipo).trigger('change');
            $("#ContentPlaceHolder1_hdnIdInventario").val(objInventario.IdInventario);
            $("#listInventario").slideUp(500, function () {
                $("#newInventario").slideDown(500);
            });
        }
    });
}

function eliminarInventario(id) {
    var parametros = {
        idInventario: id
    };
    $.ajax({
        url: 'Inventario.aspx/EliminarInventario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                console.log("Error al eliminar");
                alert("Hubo un error al eliminar el Inventario");
                return;
            }
            var linkEliminar = $('.eliminarFilaInventario' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function guardarInventario() {
    var glosa = $("#Glosa").val();
    var Tipo = $("#TipoInventario").val();
    var idInventario = $("#ContentPlaceHolder1_hdnIdInventario").val();
    $(".CantProd").parent('td').parent("tr").find("td:first-child").each(function () {
        var idProcucto = $(this).html()
        var cantidad = $("#Pro" + idProcucto).val();
        cantidad = parseInt(cantidad);
        if (cantidad > 0) {
            var parametros = {
                idInventario: idInventario,
                idProducto: idProcucto,
                cantidad: cantidad,
                tipo: Tipo
            };
            $.ajax({
                url: 'Inventario.aspx/InsertarDetalle',
                dataType: 'json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(parametros),
                success: function (data) {
                    var objInventario = data.d;
                }
            });
        }
    });
    var parametros = {
        idUsuario: sessionStorage.getItem('idUsuario'),
        tipo: Tipo,
        glosa: glosa,
        id: idInventario
    };
    $.ajax({
        url: 'Inventario.aspx/ActualizarInventario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInventario = data.d;
            var linkActualizar = $('.actualizarFilaInventario' + objInventario.IdInventario);
            var trActualizado = linkActualizar.parent().parent();
            var tr =
                '<td></td>' +
                '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaInventario' + objInventario.IdInventario + '" href="javascript:eliminarInventario(' + objInventario.idInventario + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                '<td>' + objInventario.IdInventario + '</td>' +
                '<td>' + objInventario.Tipo + '</td>' +
                '<td>' + objInventario.Usuario.Username + '</td>' +
                '<td>' + objInventario.Glosa + '</td>' +
                '<td>' + objInventario.FechaForDisplay + '</td>' +
                '<td>' + objInventario.HoraForDisplay + '</td>' +
                '<td>' + objInventario.EstadoForDisplay + '</td>'
            trActualizado.html(tr);
            $("#newInventario").slideUp(500, function () {
                $("#listInventario").slideDown(500);
            });
        }
    });
}