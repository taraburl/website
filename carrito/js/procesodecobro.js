function pagar(id) {
    if (id = 1) {
        $("#pagos").slideUp(500, function () {
            $("#tigomoney").slideDown(500);
        });
    }
}

function cancelar() {
    $("#tigomoney").slideUp(500, function () {
        $("#pagos").slideDown(500);
    });
}