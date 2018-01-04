$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

function cancelGrupo() {
    $("#newGrupo, #newEquipo").slideUp(500, function () {
        $("#listGrupo").slideDown(500);
    });
}

function newGrupo() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdGrupo').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listGrupo").slideUp(500, function () {
        $("#newGrupo").slideDown(500);
    });
    $("#Nombre").val('');
}

function eliminarGrupo(id) {
    var parametros = {
        idGrupo: id
    };
    $.ajax({
        url: 'grupo.aspx/EliminarGrupo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Grupo", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Grupo Eliminado", "success");
            var linkEliminar = $('.eliminarFilaGrupo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarGrupo(id) {
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idGrupo: id
    };
    $.ajax({
        url: 'grupo.aspx/TraerGrupo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjGrupo = data.d;
            $("#listGrupo").slideUp(500, function () {
                $("#newGrupo").slideDown(500);
            });
            $('#Nombre').val(ObjGrupo.Nombre);
            $('#Descripcion').val(ObjGrupo.Descripcion);
            $('#ContentPlaceHolder1_hdnIdGrupo').val(ObjGrupo.IdGrupo);
            $('#ContentPlaceHolder1_IdEvento').val(ObjGrupo.IdEvento).trigger('change');
        }
    });
}

function guardarGrupo() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdGrupo').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val(),
            id: $('#ContentPlaceHolder1_hdnIdGrupo').val()
        };
        $.ajax({
            url: 'grupo.aspx/ActualizarGrupo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objGrupo = data.d;
                if (objGrupo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "No puede crear mas grupos para el evento seleccionado", "warning");
                }
                var linkActualizar = $('.actualizarFilaGrupo' + objGrupo.IdGrupo);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-info actualizarFilaGrupo' + objGrupo.IdGrupo + '" href="javascript:actualizarGrupo(' + objGrupo.IdGrupo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger eliminarFilaGrupo' + objGrupo.IdGrupo + '" href="javascript:eliminarGrupo(' + objGrupo.IdGrupo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objGrupo.Nombre + '</td>' +
                    '<td>' + objGrupo.Evento.Nombre + '</td>';
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdGrupo').val('');
                mensajeConfirmacion("Bien!", "Grupo Actualizado", "success");
                $("#newGrupo").slideUp(500, function () {
                    $("#listGrupo").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    } else {
        //Insertar
        var parametros = {
            nombre: $('#Nombre').val(),
            idEvento: $('#ContentPlaceHolder1_IdEvento').val()
        };
        $.ajax({
            url: 'grupo.aspx/InsertarGrupo',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objGrupo = data.d;
                if (objGrupo.Nombre == "NO") {
                    return mensajeConfirmacion("Advertencia!", "No puede crear mas grupos para el evento seleccionado", "warning");
                }
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-info actualizarFilaGrupo' + objGrupo.IdGrupo + '" href="javascript:actualizarGrupo(' + objGrupo.IdGrupo + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-danger eliminarFilaGrupo' + objGrupo.IdGrupo + '" href="javascript:eliminarGrupo(' + objGrupo.IdGrupo + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objGrupo.Nombre + '</td>' +
                    '<td>' + objGrupo.Evento.Nombre + '</td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                mensajeConfirmacion("Bien!", "Grupo Creado", "success");
                $("#newGrupo").slideUp(500, function () {
                    $("#listGrupo").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    }
}

function agregarEquipo(id) {
    cargarEquipos(id);
    cargarEquiposGrupo(id);
    $("#ContentPlaceHolder1_hdnEquipo").val(id);
    $("#listGrupo").slideUp(500, function () {
        $("#addEquipo").slideDown(500);
    });
}

function cancelEquipo() {
    $("#addEquipo").slideUp(500, function () {
        $("#listGrupo").slideDown(500);
    });
}

function cargarEquipos(id) {
    $('#ContentPlaceHolder1_Equipo').empty();
    var parametros = {
        idGrupo: id
    };
    $.ajax({
        url: 'grupo.aspx/TraerEquipos',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjEquipo = data.d;
            ObjEquipo.forEach(function (element) {
                $('#ContentPlaceHolder1_Equipo').append('<option value=' + element.IdEquipo + ' >'
                    + element.Nombre + '</option>');
            });
        }
    });
}

function cargarEquiposGrupo(idEquipo) {
    $("#body").empty();
    var parametros = {
        idGrupo: idEquipo
    };
    $.ajax({
        url: 'grupo.aspx/TraerEquiposGrupo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objEquipo = data.d;
            objEquipo.forEach(function (element) {
                var tr = '<tr>' +
                       '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaJugadorEquipo' + element.Id + '" href="javascript:eliminarEquipoGrupo(' + element.Id + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                       '<td>' + element.Equipo.Nombre + '</td>' +
                       '</tr>';
                $("#body").append(tr);
            });

        },
        error: function () {
            alert("Error al cargar los jugadores");
        }
    });
}

function nuevoEquipo() {
    var parametros = {
        idGrupo: $("#ContentPlaceHolder1_hdnEquipo").val(),
        idEquipo: $("#ContentPlaceHolder1_Equipo").val()
    }
    $.ajax({
        url: 'grupo.aspx/InsertarGrupoEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objJugadorEquipo = data.d;
            var tr = '<tr>' +
                        '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaJugadorEquipo' + objJugadorEquipo.Id + '" href="javascript:eliminarEquipoGrupo(' + objJugadorEquipo.Id + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                        '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                     '</tr>';
            $("#body").append(tr);
            mensajeConfirmacion("Bien!", "Equipo Agregado al Quipo con Exito", "success");
        },
        error: function () {
            mensajeConfirmacion("Advertencia!", "El Equipo ya esta en el Grupo", "warning");
        }
    });
}

function eliminarEquipoGrupo(id) {
    var parametros = {
        idGrupoEquipo: id
    };
    $.ajax({
        url: 'grupo.aspx/EliminarGrupoEquipo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar el Equipo del Grupo", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Equipo ELiminado del Grupo Correctamente", "success");
            var linkEliminar = $('.actualizarFilaJugadorEquipo' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}