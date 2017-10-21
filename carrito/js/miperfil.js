$(document).ready(function () {
    cargarDatosCliente();
});

function cargarDatosCliente() {
    var IdUsuario = sessionStorage.getItem("idUsuario");
    var parametros = {
        idUser: IdUsuario
    };
    $.ajax({
        url: '../../admin/Usuarios.aspx/TraerUser',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(parametros),
        success: function (data) {
            var objUser = data.d;
            $('#Nombre').val(objUser.Nombre);
            $('#Apellido').val(objUser.Apellido);
            $("#Email").val(objUser.Email);
            $('#Telefono').val(objUser.Telefono);
            $('#Celular').val(objUser.Celular);
            $("#Direccion").val(objUser.Direccion);
        }
    });
}