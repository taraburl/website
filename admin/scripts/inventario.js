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
                '<td>' + objInventario.IdInventario + '</td>' +
                '<td>' + objInventario.Tipo + '</td>' +
                '<td>' + objInventario.Usuario.Username + '</td>' +
                '<td>' + objInventario.Glosa + '</td>' +
                '<td>' + objInventario.FechaForDisplay + '</td>' +
                '<td>' + objInventario.HoraForDisplay + '</td>' +
                '<td><span class="label label-info">Guardado</span></td>' +
                '<td><a class="btn btn-circle btn-info actualizarFilaInventario' + objInventario.IdInventario + '" href="javascript:actualizarInventario(' + objInventario.IdInventario + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                '<td><a class="btn btn-circle btn-danger eliminarFilaInventario' + objInventario.IdInventario + '" href="javascript:eliminarInventario(' + objInventario.IdInventario + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                '</tr>';
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
                return ensajeConfirmacion("Advertencia!", "Error al Eliminar el Inventario, intentelo Nuevamente", "warning");
            }
            var linkEliminar = $('.eliminarFilaInventario' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
            location.reload();
        }
    });
}

function guardarInventario() {
    var si = true;
    var glosa = $("#Glosa").val();
    var Tipo = $("#TipoInventario").val();
    var idInventario = $("#ContentPlaceHolder1_hdnIdInventario").val();
    if (Tipo == "Egreso") {
        if (!validarEgreso()) {
            return mensajeConfirmacion("Advertencia!", "Las cantidades que desea Egresar deben ser Menor o Igual al stock Actual del Producto", "warning");
        }
    }
    $(".CantProd").parent('td').parent("tr").find("td:first-child").each(function () {
        var idProcucto = $(this).html();
        var cantidad = $("#Pro" + idProcucto).val();
        cantidad = parseInt(cantidad);
        if ((cantidad > 0) && si) {
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
                    if (objInventario.IdInventario == -100) {
                        si = false;
                    }
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
                '<td>' + objInventario.IdInventario + '</td>' +
                '<td>' + objInventario.Tipo + '</td>' +
                '<td>' + objInventario.Usuario.Username + '</td>' +
                '<td>' + objInventario.Glosa + '</td>' +
                '<td>' + objInventario.FechaForDisplay + '</td>' +
                '<td>' + objInventario.HoraForDisplay + '</td>' +
                '<td>' + objInventario.EstadoForDisplay + '</td>' +
                '<td></td>' +
                '<td><a class="btn btn-block btn-danger eliminarFilaInventario' + objInventario.IdInventario + '" href="javascript:eliminarInventario(' + objInventario.idInventario + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
            trActualizado.html(tr);
            $("#newInventario").slideUp(500, function () {
                $("#listInventario").slideDown(500);
            });
            location.reload();
        }
    });
}

function validarEgreso() {
    var bool = true;
    $(".CantProd").parent('td').parent("tr").find("td:first-child").each(function () {
        var idProcucto = $(this).html();
        var cantidad = $("#Pro" + idProcucto).val();
        var stockActual = $("#stock" + idProcucto).val();
        if (stockActual >= cantidad) {
            bool = true;
        } else {
            bool = false;
        }
    });
    return bool;
}