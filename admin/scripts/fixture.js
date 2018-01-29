$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
    $('#hora').datetimepicker({
        format: 'HH:mm:ss'
    });
    $('#fecha').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    $('#ContentPlaceHolder1_SelectGrupo').on('change', function () {
        cargarEquipos();
        cargarPartidos($("#ContentPlaceHolder1_SelectGrupo").val());
    });
});

function cancelFixture() {
    $("#addFixture").slideUp(500, function () {
        $("#listFixture").slideDown(500);
    });
}

function gestionarFixture(id) {
    $("#listFixture").slideUp(500, function () {
        $("#addFixture").slideDown(500);
    });
    cargarGrupos(id);
}

function cargarGrupos(id) {
    $('#ContentPlaceHolder1_SelectGrupo').empty();
    var parametros = {
        idEvento: id
    };
    $.ajax({
        async: true,
        url: 'grupo.aspx/TraerGruposEvento',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_SelectGrupo').append('<option value=' + element.IdGrupo + ' >'
                    + element.Nombre + '</option>');
            });
            cargarEquipos();
            cargarPartidos($("#ContentPlaceHolder1_SelectGrupo").val());
        }
    });
}

function cargarEquipos() {
    $('#ContentPlaceHolder1_EquipoRival1').empty();
    $('#ContentPlaceHolder1_EquipoRival2').empty();
    var parametros = {
        idGrupo: $('#ContentPlaceHolder1_SelectGrupo').val()
    };
    $.ajax({
        async: true,
        url: 'grupo.aspx/TraerEquiposGrupo',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objGrupo = data.d;
            objGrupo.forEach(function (element) {
                $('#ContentPlaceHolder1_EquipoRival1').append('<option value=' + element.IdEquipo + ' >'
                    + element.Equipo.Nombre + '</option>');
                $('#ContentPlaceHolder1_EquipoRival2').append('<option value=' + element.IdEquipo + ' >'
                    + element.Equipo.Nombre + '</option>');
            });
        }
    });
}

function nuevoEquipo() {
    if ($("#ContentPlaceHolder1_FixtureID").val() !== "") {
        //actualizar
        var parametros = {
            idEquipo: $("#ContentPlaceHolder1_EquipoRival1").val(),
            idRival: $("#ContentPlaceHolder1_EquipoRival2").val(),
            idCancha: $("#ContentPlaceHolder1_Cancha").val(),
            fecha: $("#fecha input").val(),
            hora: $("#hora input").val(),
            idGrupo: $("#ContentPlaceHolder1_SelectGrupo").val(),
            estado: $("#ContentPlaceHolder1_Estado").val(),
            scoreEquipo: $("#ScoreEquipo").val(),
            scoreRival: $("#ScoreRival").val(),
            idFixture: $("#ContentPlaceHolder1_FixtureID").val(),
            puntos: $("#Puntos").val()
        }
        $.ajax({
            url: 'fixture.aspx/ActualizarFixture',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugadorEquipo = data.d;
                var estado = etiquetaEstado(objJugadorEquipo.Estado);
                var linkActualizar = $('.actualizarFilaPartido' + objJugadorEquipo.IdFixture);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                     '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Rival.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Cancha.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.FechaForDisplay + '</td>' +
                     '<td>' + objJugadorEquipo.HoraForDisplay + '</td>' +
                     '<td>' + estado + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreEquipo + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreRival + '</td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-warning" href="javascript:agregarArbitros(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-plus" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:actualizarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:eliminarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';
                trActualizado.html(tr);
                $("#ContentPlaceHolder1_FixtureID").val('');
                mensajeConfirmacion("Bien!", "Partido Actualizado", "success");
                $('#cerrarPanel').click();
            },
            error: function () {
                mensajeConfirmacion("Advertencia!", "Partido Repetido", "warning");
            }
        });
    } else {
        //Nuevo
        var parametros = {
            idEquipo: $("#ContentPlaceHolder1_EquipoRival1").val(),
            idRival: $("#ContentPlaceHolder1_EquipoRival2").val(),
            idCancha: $("#ContentPlaceHolder1_Cancha").val(),
            fecha: $("#fecha input").val(),
            hora: $("#hora input").val(),
            idGrupo: $("#ContentPlaceHolder1_SelectGrupo").val(),
            estado: $("#ContentPlaceHolder1_Estado").val(),
            scoreEquipo: $("#ScoreEquipo").val(),
            scoreRival: $("#ScoreRival").val(),
            puntos: $("#Puntos").val()
        }
        $.ajax({
            url: 'fixture.aspx/InsertarFixture',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objJugadorEquipo = data.d;
                var estado = etiquetaEstado(objJugadorEquipo.Estado);
                var tr = '<tr>' +
                     '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Rival.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Cancha.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.FechaForDisplay + '</td>' +
                     '<td>' + objJugadorEquipo.HoraForDisplay + '</td>' +
                     '<td>' + estado + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreEquipo + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreRival + '</td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-warning" href="javascript:agregarArbitros(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-plus" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:actualizarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:eliminarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                     '</tr>';
                $("#partidos").append(tr);
                mensajeConfirmacion("Bien!", "Partido Agregado", "success");
                $('#cerrarPanel').click();
            },
            error: function () {
                mensajeConfirmacion("Advertencia!", "Partido Repetido", "warning");
            }
        });
    }
}

function cargarPartidos(id) {
    $("#partidos").empty();
    var parametros = {
        idGrupo: id
    }
    $.ajax({
        url: 'fixture.aspx/ListFixture',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objgrup = data.d;
            objgrup.forEach(function (objJugadorEquipo) {
                var estado = etiquetaEstado(objJugadorEquipo.Estado);
                var tr = '<tr>' +
                     '<td>' + objJugadorEquipo.Equipo.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Rival.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.Cancha.Nombre + '</td>' +
                     '<td>' + objJugadorEquipo.FechaForDisplay + '</td>' +
                     '<td>' + objJugadorEquipo.HoraForDisplay + '</td>' +
                     '<td>' + estado + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreEquipo + '</td>' +
                     '<td>' + objJugadorEquipo.ScoreRival + '</td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-warning" href="javascript:agregarArbitros(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-plus" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:actualizarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaPartido' + objJugadorEquipo.IdFixture + '" href="javascript:eliminarPartido(' + objJugadorEquipo.IdFixture + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                     '</tr>';
                $("#partidos").append(tr);
            });
        },
        error: function () {
        }
    });
}

function etiquetaEstado(estado) {
    if (estado == "Pendiente") {
        return "<span class='label label-info'>" + estado + "</span>";
    } else if (estado == "En Curso") {
        return "<span class='label label-success'>" + estado + "</span>";
    } else if (estado == "Finalizado") {
        return "<span class='label label-warning'>" + estado + "</span>";
    } else if (estado == "Suspendido") {
        return "<span class='label label-danger'>" + estado + "</span>";
    }
}

function eliminarPartido(id) {
    var parametros = {
        idPartido: id
    };
    $.ajax({
        url: 'fixture.aspx/EliminarPartido',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Prtido", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Partido Eliminado", "success");
            var linkEliminar = $('.eliminarFilaPartido' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function actualizarPartido(id) {
    var parametros = {
        idFixture: id
    };
    $.ajax({
        url: 'fixture.aspx/TraerFixture',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objFixture = data.d;
            $("#Puntos").val(objFixture.Puntos);
            $("#ContentPlaceHolder1_FixtureID").val(objFixture.IdFixture);
            $("#ContentPlaceHolder1_EquipoRival1").val(objFixture.IdEquipo).trigger('change');
            $('#ContentPlaceHolder1_EquipoRival2').val(objFixture.IdRival).trigger('change');
            $("#ContentPlaceHolder1_Cancha").val(objFixture.idCancha).trigger('change');
            $("#fecha input").val(objFixture.FechaForDisplay);
            $("#hora input").val(objFixture.HoraForDisplay);
            $("#ContentPlaceHolder1_Estado").val(objFixture.Estado).trigger('change');
            $("#ScoreEquipo").val(objFixture.ScoreEquipo);
            $("#ScoreRival").val(objFixture.ScoreRival);
            $('#cerrarPanel').click();
        }
    });
}

function agregarArbitros(id) {
    $("#ContentPlaceHolder1_hdnIdFixture").val(id);
    cargarArbitros(id);
    $("#AddArbitros").modal("show");
}

function cargarArbitros(id) {
    $("#tblArbitros").empty();
    var parametros = {
        idPartido: id
    }
    $.ajax({
        url: 'fixture.aspx/ListArbitros',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var listArbitros = data.d;
            listArbitros.forEach(function (objArbitros) {
                var tr = '<tr>' +
                     '<td>' + objArbitros.Arbitro.Nombre + '</td>' +
                     '<td>' + objArbitros.Arbitro.Edad + '</td>' +
                     '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaArbitroPartido' + objArbitros.IdArbitroPartido + '" href="javascript:eliminarArbitroPartido(' + objArbitros.IdArbitroPartido + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                     '</tr>';
                $("#tblArbitros").append(tr);
            });
        },
        error: function () {
        }
    });
}

function guardarArbitro() {
    var parametros = {
        idPartido: $("#ContentPlaceHolder1_hdnIdFixture").val(),
        idArbitro: $("#ContentPlaceHolder1_Arbitro").val()
    }
    $.ajax({
        url: 'fixture.aspx/InsertarArbitro',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objArbitro = data.d;
            var tr = '<tr>' +
                 '<td>' + objArbitro.Arbitro.Nombre + '</td>' +
                 '<td>' + objArbitro.Arbitro.Edad + '</td>' +
                 '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaArbitroPartido' + objArbitro.IdArbitroPartido + '" href="javascript:eliminarArbitroPartido(' + objArbitro.IdArbitroPartido + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>' +
                 '</tr>';
            $("#tblArbitros").append(tr);
            mensajeConfirmacion("Bien!", "Arbitro Agregado al Partido", "success");
        },
        error: function () {
            mensajeConfirmacion("Advertencia!", "El Arbitro ya esta en el Partido", "warning");
        }
    });
}

function eliminarArbitroPartido(id) {
    var parametros = {
        idArbitro: id
    };
    $.ajax({
        url: 'fixture.aspx/EliminarArbitro',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                mensajeConfirmacion("Error", "Error al Eliminar Arbtitro", "error");
                return;
            }
            mensajeConfirmacion("Bien!", "Arbitro Eliminado", "success");
            var linkEliminar = $('.eliminarFilaArbitroPartido' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();
        }
    });
}

function cancelNuevoEquipo() {
    $("#ContentPlaceHolder1_FixtureID").val('');
    $('#cerrarPanel').click();
}