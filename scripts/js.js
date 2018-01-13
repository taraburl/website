$(document).ready(function () {
    $(".center").slick({
        infinite: true,
        centerMode: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            }
        ]
    });
    $(".center2").slick({
        infinite: true,
        centerMode: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: $("#CantidadSponsors").val(),
                    slidesToScroll: $("#CantidadSponsors").val(),
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: false,
                    autoplay: true,
                    autoplaySpeed: 2000
                }
            }
        ]
    });
    $('.scroll a').smoothScroll(500);
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
        $("#miperfil a").text("Mi Perfil");
    }
    if (sessionStorage.getItem("tipouser") == "Administrador") {
        $("#pnladmin").show();
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