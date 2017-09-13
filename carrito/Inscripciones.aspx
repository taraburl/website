<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="Inscripciones.aspx.cs" Inherits="carrito_Inscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Inscripciones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- breadcrumbs -->
    <div class="breadcrumb_dress">
        <div class="container">
            <ul>
                <li>
                    <a href="/index.aspx">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>Inicio</a>
                    <i>/</i>
                </li>
                <li>Inscripciones</li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="typo codes">
        <div class="container">
            <div class="grid_3 grid_4">
                <h3 class="w3ls-hdg">Formulario de Inscripción</h3>
                <div class="tab-content">
                    <div class="tab-pane active" id="horizontal-form">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Focused Input</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control1" id="focusedinput" placeholder="Default Input" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

