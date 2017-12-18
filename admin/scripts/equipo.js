$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelEquipo() {
    $("#newEquipo").slideUp(500, function () {
        $("#listEquipo").slideDown(500);
    });
}

function newEquipo() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdEquipo').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listEquipo").slideUp(500, function () {
        $("#newEquipo").slideDown(500);
    });
}
