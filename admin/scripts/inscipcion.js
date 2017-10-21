$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $(".select2").select2();
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
                console.log("Error al eliminar");
                alert("Hubo un error al eliminar el Inventario");
                return;
            }
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
            var linkActualizar = $('.actualizarFilaInscripcion' + objInscripcion.IdInscripcion);
            var trActualizado = linkActualizar.parent().parent();
            var tr =
                '<td></td>' +
                '<td><a class="btn btn-block btn-social-icon btn-danger eliminarFilaInscripcion' + objInscripcion.IdInscripcion + '" href="javascript:eliminarInscripcion(' + objInscripcion.IdInscripcion + ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>' +
                '<td>' + objInscripcion.IdInscripcion + '</td>' +
                '<td>' + objInscripcion.Categoria.Nombre + '</td>' +
                '<td>' + objInscripcion.Usuario.Username + '</td>' +
                '<td>' + objInscripcion.Usuario.Apellido + '</td>' +
                '<td>' + objInscripcion.Inscrito + '</td>' +
                '<td>' + objInscripcion.TipoPago.Nombre + '</td>' +
                '<td>Consolidado</td>';
            trActualizado.html(tr);
        }
    });
}
