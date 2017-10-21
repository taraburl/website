<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="InscripcionCompleta.aspx.cs" Inherits="carrito_InscripionCompleta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Proceso De Pago</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Inscripciones a la Academia de Futbol SEA</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li>
                        <a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>
                        <a href="Inscripciones.aspx">Inscripciones a la Academia de Futbol SEA</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Proceso de Pago</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-lg-12 col-md-12 order-md-2">
                <h6 class="text-muted text-normal text-uppercase">Pago con Tigo Money</h6>
                <hr class="margin-bottom-1x pb-2" />
                <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between">
                    <div class="step completed">
                        <div class="step-icon-wrap">
                            <div class="step-icon"><i class="pe-7s-cart"></i></div>
                        </div>
                        <h4 class="step-title">Confirmar Inscripcion</h4>
                    </div>
                    <div class="step completed">
                        <div class="step-icon-wrap">
                            <div class="step-icon"><i class="pe-7s-credit"></i></div>
                        </div>
                        <h4 class="step-title">Procesar Pago</h4>
                    </div>
                    <div class="step completed">
                        <div class="step-icon-wrap">
                            <div class="step-icon"><i class="pe-7s-check"></i></div>
                        </div>
                        <h4 class="step-title">Inscripcion Finalizada</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="card text-center">
            <div class="card-block padding-top-2x">
                <h3 class="card-title">Muchas Gracias por Inscribirte a Nuestra Academia!</h3>
                <p class="card-text">
                    Asegurate de tener tu numero de Inscripcion, que es 
                    <asp:Label ID="COD" runat="server" Text="" CssClass="text-medium"></asp:Label>
                </p>
                <p class="card-text">
                    Recibiras un mail con un comprobante de inscripion.
                </p>
                <div class="padding-top-1x padding-bottom-1x">
                    <a href="../index.aspx" class="btn btn-outline-primary">
                        <i class="pe-7s-back"></i>&nbsp;Volver al Inicio</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

