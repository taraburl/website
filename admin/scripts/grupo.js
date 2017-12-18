$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        return window.location.href = "/Login.aspx";
    }
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
}