$(document).ready(function () {
    $("#CartIcons").hide();
    if (sessionStorage.getItem("idUsuario")) {
        $("#signup").hide();
        $("#login").hide();
        $("#miperfil").show();
        $("#logout").show();
        $("#miperfil a").text(sessionStorage.getItem('fullName'));
        var img1 = document.getElementById("imagenperfil");
        if (img1 !== null) {
            document.getElementById("imagenperfil").src = sessionStorage.getItem('imagen');
        }
        var img2 = document.getElementById("imagenperfil2");
        if (img2 !== null) {
            document.getElementById("imagenperfil2").src = "/" + sessionStorage.getItem('imagen');
        }
    } else {
        $("#miperfil").hide();
        $("#logout").hide();
        $("#signup").show();
        $("#login").show();
    }
    if (sessionStorage.getItem("tipouser") == "Administrador") {
        $("#admin").show();
        $("#admincell").show();
    } else {
        $("#admin").hide();
        $("#admincell").hide();
    }
});

function logout() {
    sessionStorage.clear();
    window.location.href = "index.aspx";
}

function logout2() {
    sessionStorage.clear();
    window.location.href = "../index.aspx";
}