$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
});

jQuery('#ContentPlaceHolder1_uploader').on('change', function (e) {
    var Lector,
            oFileInput = this;
    if (oFileInput.files.length === 0) {
        return;
    }
    Lector = new FileReader();
    Lector.onloadend = function (e) {
        jQuery('#ContentPlaceHolder1_imgPrincipal').attr('src', e.target.result);
    }
    Lector.readAsDataURL(oFileInput.files[0]);
});

function cancelnewSponsor() {
    $("#newsponsor").slideUp(500, function () {
        $("#listsponsors").slideDown(500);
    });
}

function newSponsor() {
    $(".input-group").removeClass('has-error');
    $('#Nombre').val('');
    $('#ContentPlaceHolder1_hdnIdSponsor').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listsponsors").slideUp(500, function () {
        $("#newsponsor").slideDown(500);
    });
}

function actualizarSponsor(id) {
    $('#Nombre').val('');
    $("#new").hide();
    $("#upd").show();
    $(".input-group").removeClass('has-error');
    var parametros = {
        idSponsor: id
    };
    $.ajax({
        url: 'Sponsors.aspx/TraerSponsor',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var ObjSponsor = data.d;
            $("#listsponsors").slideUp(500, function () {
                $("#newsponsor").slideDown(500);
            });
            $('#Nombre').val(ObjSponsor.Nombre);
            $('#Modulo').val(ObjSponsor.Modulo).trigger('change');
            $('#ContentPlaceHolder1_hdnIdSponsor').val(ObjSponsor.IdSponsor);
        }
    });
}

function guardarSponsor() {
    if (!$('#Nombre').val() || !$('#Nombre').val().trim().length) {
        $("#Nombre").parent().addClass("has-error");
        return false;
    } else {
        $("#Nombre").parent().removeClass('has-error');
    }
    if ($('#ContentPlaceHolder1_hdnIdSponsor').val() != "") {
        //Actualizar
        var parametros = {
            nombre: $('#Nombre').val(),
            modulo: $('#Modulo').val(),
            id: $('#ContentPlaceHolder1_hdnIdSponsor').val()
        };
        $.ajax({
            url: 'Sponsors.aspx/ActualizarSponsor',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objSponsor = data.d;
                var linkActualizar = $('.actualizarFilaSponsor' + objSponsor.IdSponsor);
                var trActualizado = linkActualizar.parent().parent();
                var tr =
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaSponsor' + objSponsor.IdSponsor + '" href="javascript:actualizarSponsor(' + objSponsor.IdSponsor + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaSponsor' + objSponsor.IdSponsor + '" href="javascript:eliminarSponsor(' + objSponsor.IdSponsor + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-warning" href="SubirFotoSponsor.aspx?ID=' + objSponsor.IdSponsor + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objSponsor.Nombre + '</td>' +
                    '<td>' + objSponsor.Modulo + '</td>'
                trActualizado.html(tr);
                $('#ContentPlaceHolder1_hdnIdSponsor').val('');
                $("#newsponsor").slideUp(500, function () {
                    $("#listsponsors").slideDown(500);
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
            modulo: $('#Modulo').val()
        };
        $.ajax({
            url: 'Sponsors.aspx/InsertarSponsor',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(parametros),
            success: function (data) {
                var objSponsor = data.d;
                var tr = '<tr>' +
                    '<td><a class="btn btn-block btn-social-icon btn-info actualizarFilaSponsor' + objSponsor.IdSponsor + '" href="javascript:actualizarSponsor(' + objSponsor.IdSponsor + ')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-danger actualizarFilaSponsor' + objSponsor.IdSponsor + '" href="javascript:eliminarSponsor(' + objSponsor.IdSponsor + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                    '<td><a class="btn btn-block btn-social-icon btn-warning" href="SubirFotoSponsor.aspx?ID=' + objSponsor.IdSponsor + '"><i class="fa fa-file-photo-o" aria-hidden="true"></i></a></td>' +
                    '<td>' + objSponsor.Nombre + '</td>' +
                    '<td>' + objSponsor.Modulo + '</td>' +
                    '</tr>';
                var table = $('#ContentPlaceHolder1_GridView1');
                table.find('tbody').append(tr);
                $("#newsponsor").slideUp(500, function () {
                    $("#listsponsors").slideDown(500);
                });
            },
            error: function () {
                $("#Nombre").parent().addClass("has-error");
            }
        });
    }
}

function eliminarSponsor(id) {
    var parametros = {
        idSponsor: id
    };
    $.ajax({
        url: 'Sponsors.aspx/EliminarSponsor',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var resultado = data.d;
            if (resultado == -1) {
                console.log("Error al eliminar");
                alert("Hubo un error al eliminar el transporte");
                return;
            }
            var linkEliminar = $('.eliminarFilaSponsor' + resultado);
            var trActualizado = linkEliminar.parent().parent();
            trActualizado.remove();

        }
    });
}