$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
});

function cancelCancha() {
    $("#newCancha").slideUp(500, function () {
        $("#listCancha").slideDown(500);
    });
}

function newCancha() {
    $(".input-group").removeClass('has-error');
    $('#input-group').val('');
    $('#ContentPlaceHolder1_hdnIdCancha').val('');
    $("#new").show();
    $("#upd").hide();
    $("#listCancha").slideUp(500, function () {
        $("#newCancha").slideDown(500);
    });
}
