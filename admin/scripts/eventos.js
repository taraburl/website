$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
    $('#FechaInicio').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#FechaFin').datetimepicker({
        format: 'YYYY-MM-DD'
    });
});

function cancelEvento() {
    $("#newEvento").slideUp(500, function () {
        $("#listEvento").slideDown(500);
    });
}

function newEvento() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdEvento').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listEvento").slideUp(500, function () {
        $("#newEvento").slideDown(500);
    });
}
