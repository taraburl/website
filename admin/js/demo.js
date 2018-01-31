/**
 * AdminLTE Demo Menu
 * ------------------
 * You should not use this file in production.
 * This file is for demo purposes only.
 */
(function ($, AdminLTE) {

    "use strict";

    /**
     * List of all the available skins
     *
     * @type Array
     */
    var my_skins = [
      "skin-blue",
      "skin-black",
      "skin-red",
      "skin-yellow",
      "skin-purple",
      "skin-green",
      "skin-blue-light",
      "skin-black-light",
      "skin-red-light",
      "skin-yellow-light",
      "skin-purple-light",
      "skin-green-light"
    ];

    //Create the new tab
    var tab_pane = $("<div />", {
        "id": "control-sidebar-theme-demo-options-tab",
        "class": "tab-pane active"
    });

    //Create the tab button
    var tab_button = $("<li />", { "class": "active" })
        .html("<a href='#control-sidebar-theme-demo-options-tab' data-toggle='tab'>"
        + "<i class='fa fa-wrench'></i>"
        + "</a>");

    //Add the tab button to the right sidebar tabs
    $("[href='#control-sidebar-home-tab']")
        .parent()
        .before(tab_button);

    //Create the menu
    var demo_settings = $("<div />");

    //Layout options
    demo_settings.append(
        "<h4 class='control-sidebar-heading'>"
        + "Layout Options"
        + "</h4>"
          //Fixed layout
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-layout='fixed' class='pull-right'/> "
        + "Fixed layout"
        + "</label>"
        + "<p>Activate the fixed layout. You can't use fixed and boxed layouts together</p>"
        + "</div>"
          //Boxed layout
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-layout='layout-boxed'class='pull-right'/> "
        + "Boxed Layout"
        + "</label>"
        + "<p>Activate the boxed layout</p>"
        + "</div>"
          //Sidebar Toggle
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-layout='sidebar-collapse' class='pull-right'/> "
        + "Toggle Sidebar"
        + "</label>"
        + "<p>Toggle the left sidebar's state (open or collapse)</p>"
        + "</div>"
          //Sidebar mini expand on hover toggle
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-enable='expandOnHover' class='pull-right'/> "
        + "Sidebar Expand on Hover"
        + "</label>"
        + "<p>Let the sidebar mini expand on hover</p>"
        + "</div>"
          //Control Sidebar Toggle
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-controlsidebar='control-sidebar-open' class='pull-right'/> "
        + "Toggle Right Sidebar Slide"
        + "</label>"
        + "<p>Toggle between slide over content and push content effects</p>"
        + "</div>"
          //Control Sidebar Skin Toggle
        + "<div class='form-group'>"
        + "<label class='control-sidebar-subheading'>"
        + "<input type='checkbox' data-sidebarskin='toggle' class='pull-right'/> "
        + "Toggle Right Sidebar Skin"
        + "</label>"
        + "<p>Toggle between dark and light skins for the right sidebar</p>"
        + "</div>"
    );
    var skins_list = $("<ul />", { "class": 'list-unstyled clearfix' });

    //Dark sidebar skins
    var skin_blue =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-blue' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px; background: #367fa9;'></span><span class='bg-light-blue' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Blue</p>");
    skins_list.append(skin_blue);
    var skin_black =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-black' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div style='box-shadow: 0 0 2px rgba(0,0,0,0.1)' class='clearfix'><span style='display:block; width: 20%; float: left; height: 7px; background: #fefefe;'></span><span style='display:block; width: 80%; float: left; height: 7px; background: #fefefe;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Black</p>");
    skins_list.append(skin_black);
    var skin_purple =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-purple' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-purple-active'></span><span class='bg-purple' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Purple</p>");
    skins_list.append(skin_purple);
    var skin_green =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-green' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-green-active'></span><span class='bg-green' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Green</p>");
    skins_list.append(skin_green);
    var skin_red =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-red' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-red-active'></span><span class='bg-red' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Red</p>");
    skins_list.append(skin_red);
    var skin_yellow =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-yellow' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-yellow-active'></span><span class='bg-yellow' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin'>Yellow</p>");
    skins_list.append(skin_yellow);

    //Light sidebar skins
    var skin_blue_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-blue-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px; background: #367fa9;'></span><span class='bg-light-blue' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px'>Blue Light</p>");
    skins_list.append(skin_blue_light);
    var skin_black_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-black-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div style='box-shadow: 0 0 2px rgba(0,0,0,0.1)' class='clearfix'><span style='display:block; width: 20%; float: left; height: 7px; background: #fefefe;'></span><span style='display:block; width: 80%; float: left; height: 7px; background: #fefefe;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px'>Black Light</p>");
    skins_list.append(skin_black_light);
    var skin_purple_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-purple-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-purple-active'></span><span class='bg-purple' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px'>Purple Light</p>");
    skins_list.append(skin_purple_light);
    var skin_green_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-green-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-green-active'></span><span class='bg-green' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px'>Green Light</p>");
    skins_list.append(skin_green_light);
    var skin_red_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-red-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-red-active'></span><span class='bg-red' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px'>Red Light</p>");
    skins_list.append(skin_red_light);
    var skin_yellow_light =
        $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-yellow-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
            + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-yellow-active'></span><span class='bg-yellow' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
            + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
            + "</a>"
            + "<p class='text-center no-margin' style='font-size: 12px;'>Yellow Light</p>");
    skins_list.append(skin_yellow_light);

    demo_settings.append("<h4 class='control-sidebar-heading'>Skins</h4>");
    demo_settings.append(skins_list);

    tab_pane.append(demo_settings);
    $("#control-sidebar-home-tab").after(tab_pane);

    setup();

    /**
     * Toggles layout classes
     *
     * @param String cls the layout class to toggle
     * @returns void
     */
    function change_layout(cls) {
        $("body").toggleClass(cls);
        AdminLTE.layout.fixSidebar();
        //Fix the problem with right sidebar and layout boxed
        if (cls == "layout-boxed")
            AdminLTE.controlSidebar._fix($(".control-sidebar-bg"));
        if ($('body').hasClass('fixed') && cls == 'fixed') {
            AdminLTE.pushMenu.expandOnHover();
            AdminLTE.layout.activate();
        }
        AdminLTE.controlSidebar._fix($(".control-sidebar-bg"));
        AdminLTE.controlSidebar._fix($(".control-sidebar"));
    }

    /**
     * Replaces the old skin with the new skin
     * @param String cls the new skin class
     * @returns Boolean false to prevent link's default action
     */
    function change_skin(cls) {
        $.each(my_skins, function (i) {
            $("body").removeClass(my_skins[i]);
        });

        $("body").addClass(cls);
        store('skin', cls);
        return false;
    }

    /**
     * Store a new settings in the browser
     *
     * @param String name Name of the setting
     * @param String val Value of the setting
     * @returns void
     */
    function store(name, val) {
        if (typeof (Storage) !== "undefined") {
            localStorage.setItem(name, val);
        } else {
            window.alert('Please use a modern browser to properly view this template!');
        }
    }

    /**
     * Get a prestored setting
     *
     * @param String name Name of of the setting
     * @returns String The value of the setting | null
     */
    function get(name) {
        if (typeof (Storage) !== "undefined") {
            return localStorage.getItem(name);
        } else {
            window.alert('Please use a modern browser to properly view this template!');
        }
    }

    /**
     * Retrieve default settings and apply them to the template
     *
     * @returns void
     */
    function setup() {
        var tmp = get('skin');
        if (tmp && $.inArray(tmp, my_skins))
            change_skin(tmp);

        //Add the change skin listener
        $("[data-skin]").on('click', function (e) {
            if ($(this).hasClass('knob'))
                return;
            e.preventDefault();
            change_skin($(this).data('skin'));
        });

        //Add the layout manager
        $("[data-layout]").on('click', function () {
            change_layout($(this).data('layout'));
        });

        $("[data-controlsidebar]").on('click', function () {
            change_layout($(this).data('controlsidebar'));
            var slide = !AdminLTE.options.controlSidebarOptions.slide;
            AdminLTE.options.controlSidebarOptions.slide = slide;
            if (!slide)
                $('.control-sidebar').removeClass('control-sidebar-open');
        });

        $("[data-sidebarskin='toggle']").on('click', function () {
            var sidebar = $(".control-sidebar");
            if (sidebar.hasClass("control-sidebar-dark")) {
                sidebar.removeClass("control-sidebar-dark")
                sidebar.addClass("control-sidebar-light")
            } else {
                sidebar.removeClass("control-sidebar-light")
                sidebar.addClass("control-sidebar-dark")
            }
        });

        $("[data-enable='expandOnHover']").on('click', function () {
            $(this).attr('disabled', true);
            AdminLTE.pushMenu.expandOnHover();
            if (!$('body').hasClass('sidebar-collapse'))
                $("[data-layout='sidebar-collapse']").click();
        });

        // Reset options
        if ($('body').hasClass('fixed')) {
            $("[data-layout='fixed']").attr('checked', 'checked');
        }
        if ($('body').hasClass('layout-boxed')) {
            $("[data-layout='layout-boxed']").attr('checked', 'checked');
        }
        if ($('body').hasClass('sidebar-collapse')) {
            $("[data-layout='sidebar-collapse']").attr('checked', 'checked');
        }

    }
})(jQuery, $.AdminLTE);


function logout() {
    sessionStorage.clear();
    window.location.reload();
}

$(document).ready(function () {
    if (!sessionStorage.getItem("idUsuario")) {
        window.location.href = "../index.aspx";
    } else {
        $("#usernamelog3").text(sessionStorage.getItem('fullName'));
        $("#usernamelog2").text(sessionStorage.getItem('fullName'));
        $("#usernamelog").text(sessionStorage.getItem('fullName'));
        document.getElementById("userimglog3").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
        document.getElementById("userimglog2").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
        document.getElementById("userimglog").src = "/images/usuarios/" + sessionStorage.getItem('idUsuario') + ".png";
    }
    if (sessionStorage.getItem("tipouser") != "Administrador") {
        window.location.href = "../login.aspx";
    }
});

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function NumCheck(e, field) {
    key = e.keyCode ? e.keyCode : e.which
    // backspace
    if (key == 8)
        return true
    // 0-9
    if (key > 47 && key < 58) {
        if (field.value == "")
            return true
        regexp = /.[0-9]{10}$/
        return !(regexp.test(field.value))
    }
    // .
    if (key == 44) {
        if (field.value == "")
            return false
        regexp = /^[0-9]+$/
        return regexp.test(field.value)
    }
    // other key
    return false
}

function mensajeConfirmacion(titulo, mensaje, tipo) {
    swal({
        title: titulo,
        text: mensaje,
        type: tipo,
        showConfirmButton: true,
        closeOnConfirm: true
    });
}

function valEmail(valor) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(valor);
}

function RealizarPago() {
    iconsultar = 0;
    var data = {
        nroorden: $("#OrdenTigo").val(),
        linea: $("#TelefonoTigo").val(),
        monto: $("#Precio").val()
    };
    data = JSON.stringify(data);

    // Example E - call a function that returns an object.  .net will serialise the object as JSON for us.
    // Params are sent in JSON format, data that comes back is a JSON object
    $.ajax({
        url: "/realizarpago.aspx/RealizarPago",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        // DesbloquearPantalla();
        // alert('Complet');
        console.log('Completado RealizarPago');
    }).done(function (respuesta) {
        var res = respuesta.d;
        $("#hmensaje").html('Respuesta RP: ' + res.resultado);
        console.log('Done RealizarPago', res.resultado);
        snroOrden = res.orderId;
        ProgramarConsultarEstadoPago();
    }).error(function (er) {
        alert('Erorrrrrr');
    });
}

function ProgramarConsultarEstadoPago() {
    var itime = 30;
    if (iconsultar > 0) {
        itime = 10;
    }
    setTimeout(ConsultarEstadoPago, (itime * 1000));
}

function ConsultarEstadoPago() {
    var data = {
        nroorden: snroOrden
    };
    data = JSON.stringify(data);

    $.ajax({
        url: "/realizarpago.aspx/ConsultarEstado",
        cache: false,
        data: data,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    }).complete(function () {
        console.log('Completado ConsultarEstado');
    }).done(function (respuesta) {
        iconsultar++;
        var res = respuesta.d;
        $("#hmensaje").html('Respuesta CE: ' + res.resultado);
        console.log('Done ConsultarEstado, Nro intentos: ' + iconsultar, res.resultado);
        console.log('Done ConsultarEstado', res);
        // Verificar estado de pago
        if (res.exito == false && iconsultar < 6 && res.codRes == '3') {
            ProgramarConsultarEstadoPago();
            console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
        }
        else if (res.exito == true) {
            console.log('COMPLETADO ConsultarEstado, Nro intentos: ' + iconsultar);
        }
        else {
            console.log('Limite de pedidos ConsultarEstado, Nro intentos: ' + iconsultar);
        }
    }).error(function (er) {
        alert('Erorrrrrr');
    });
}


function fechaCorrecta(fecha) {
    var date = fecha.split("/");
    return date[1] + "/" + date[0] + "/" + date[2];
}