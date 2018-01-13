$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
    $('#ContentPlaceHolder1_IdCategoria').on('change', function () {
        cargarPrecio();
    });
    cargarPrecio();
});

function eliminarInscripcion(id) {
    var parametros = {
        idInscripcion: id
    };
    $.ajax({
        url: 'inscripciones.aspx/EliminarInscripcion',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar la Inscripcion", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Inscripcion Eliminada Correctamente", "success");
            var linkEliminar = $('.eliminarFilaInscripcion' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarInscripcion(id) {
    var parametros = {
        idInscripcion: id
    };
    $.ajax({
        url: 'inscripciones.aspx/ActualizarInscripcion',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInscripcion = data.d;
            mensajeConfirmacion("Bien!", "Inscripcion Finalizada", "success");
            var linkActualizar = $('.actualizarFilaInscripcion' + objInscripcion.IdInscripcion);
            var trActualizado = linkActualizar.parent().parent();
            var tr =
                '<td>' + objInscripcion.IdInscripcion + '</td>' +
                '<td>' + objInscripcion.Categoria.Nombre + '</td>' +
                '<td>' + objInscripcion.Usuario.Nombre + '</td>' +
                '<td>' + objInscripcion.Usuario.Apellido + '</td>' +
                '<td>' + objInscripcion.Inscrito + '</td>' +
                '<td>' + objInscripcion.TipoPago.Nombre + '</td>' +
                '<td>Consolidado</td>' +
                '<td></td>' +
                '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaInscripcion' + objInscripcion.IdInscripcion + '" href="javascript:eliminarInscripcion(' + objInscripcion.IdInscripcion + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
            trActualizado.html(tr);
        },
        error: function () {
            mensajeConfirmacion("Error", "Error al Finalizar la Inscripcion", "error");

        }
    });
}

function cancelnewInscripcion() {
    $("#newInscripcion").slideUp(500, function () {
        $("#listInscripcion").slideDown(500);
    });
}

function newInscripcion() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#Descripcion').val('');
    $("#new").show();
    $("#upd").hide();
    $("#Inscrito").val("");
    $("#listInscripcion").slideUp(500, function () {
        $("#newInscripcion").slideDown(500);
    });
}

function guardarInscripcion() {
    var IdCategoria = $("#ContentPlaceHolder1_IdCategoria").val();
    var IdUsuario = $("#ContentPlaceHolder1_IdUsuario").val();
    var Inscrito = $("#Inscrito").val();
    if (!Inscrito || !Inscrito.trim().length) {
        return alert("Falta nombe del Inscrito");
    }
    var IdTipoPago = $('input:radio[name=TipoPago]:checked').val();
    if (!IdTipoPago || !IdTipoPago.trim().length) {
        return mensajeConfirmacion("Advertencia", "Seleccione Metodo de Pago", "warning");
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
        url: '../../carrito/Inscripciones.aspx/InsertarInscripcion',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objInscripcion = data.d;
            if (IdTipoPago == 1) {
                $("#modalTigo").modal('show');
                $("#TotalTigo").val(Total);
                $("#NroTigo").val(objInscripcion.IdInscripcion);
            } else {
                mensajeConfirmacion("Bien!", "InscripcionFinalizada", "success");
                var tr = '<tr>' +
                            '<td>' + objInscripcion.IdInscripcion + '</td>' +
                            '<td>' + objInscripcion.Categoria.Nombre + '</td>' +
                            '<td>' + objInscripcion.Usuario.Nombre + '</td>' +
                            '<td>' + objInscripcion.Usuario.Apellido + '</td>' +
                            '<td>' + objInscripcion.Inscrito + '</td>' +
                            '<td>' + objInscripcion.TipoPago.Nombre + '</td>' +
                            '<td>Consolidado</td>' +
                            '<td></td>' +
                            '<td><a class="btn btn-block btn-danger btn-circle eliminarFilaInscripcion' + objInscripcion.IdInscripcion + '" href="javascript:eliminarInscripcion(' + objInscripcion.IdInscripcion + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                          '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                actualizarInscripcion(objInscripcion.IdInscripcion);
                cancelnewInscripcion();
                var parametros = {
                    emaila: objInscripcion.Usuario.Email,
                    nombrea: objInscripcion.Usuario.Nombre + " " + objInscripcion.Usuario.Apellido,
                    codInscripcion: objInscripcion.IdInscripcion
                }
                $.ajax({
                    url: '../../carrito/Inscripciones.aspx/EnviarMail',
                    dataType: 'json',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(parametros),
                    success: function () {
                    },
                    error: function () {
                        mensajeConfirmacion("Error", "Error al Enviar Mail", "error");
                    }
                });
            }
        },
        error: function () {
            mensajeConfirmacion("Error", "Error al Enviar Mail", "error");
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

function guardarUsuario() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if (!$('#Apellidos').val() || !$('#Apellidos').val().trim().length) {
        $("#Apellidos").parent().addClass("has-error");
        return false;
    } else {
        $("#Apellidos").parent().removeClass('has-error');
    }
    if (!$('#Email').val() || !$('#Email').val().trim().length) {
        $("#Email").parent().addClass("has-error");
        return false;
    } else {
        $("#Email").parent().removeClass('has-error');
    }
    if (!valEmail($('#Email').val())) {
        $("#Email").parent().addClass("has-error");
        return false;
    } else {
        $("#Email").parent().removeClass('has-error');
    }
    if (!$('#UserName').val() || !$('#UserName').val().trim().length) {
        $("#UserName").parent().addClass("has-error");
        return false;
    } else {
        $("#UserName").parent().removeClass('has-error');
    }
    if (!$('#Password').val() || !$('#Password').val().trim().length) {
        $("#Password").parent().addClass("has-error");
        return false;
    } else {
        $("#Password").parent().removeClass('has-error');
    }
    var parametros = {
        nombre: $('#Nombre').val(),
        apellido: $('#Apellidos').val(),
        email: $("#Email").val(),
        telefono: $('#Telefono').val(),
        celular: $('#Celular').val(),
        direccion: $("#Direccion").val(),
        username: $("#UserName").val(),
        password: $("#Password").val(),
        tipo: "Usuario Normal"
    };
    $.ajax({
        url: '../usuarios.aspx/InsertarUsuario',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUsuario = data.d;
            $('#ContentPlaceHolder1_IdUsuario').append($("<option value='" + objUsuario.IdUsuario + "'></option>").text(objUsuario.Nombre + " " + objUsuario.Apellido));
            $('#ContentPlaceHolder1_IdUsuario').val(objUsuario.IdUsuario).trigger('change');
            mensajeConfirmacion("Bien!", "Usuario Creado", "success");
            $('#nuevoCliente').modal('hide');
            $('#Nombre').val('');
            $('#Apellidos').val('');
            $("#Email").val('');
            $('#Telefono').val('');
            $('#Celular').val('');
            $("#Direccion").val('');
            $("#UserName").val('');
            $("#Password").val('');
        },
        error: function () {
            $("#UserName").parent().addClass("has-error");
        }
    });
}