$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelJugador() {
    $("#newJugador").slideUp(500, function () {
        $("#listJugadores").slideDown(500);
    });
}

function newJugador() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdJugador').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listJugadores").slideUp(500, function () {
        $("#newJugador").slideDown(500);
    });
}
