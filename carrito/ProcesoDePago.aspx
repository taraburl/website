<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="ProcesoDePago.aspx.cs" Inherits="carrito_ProcesoDePago" %>

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
                <hr class="margin-bottom-1x pb-2">
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
                    <div class="step">
                        <div class="step-icon-wrap">
                            <div class="step-icon"><i class="pe-7s-check"></i></div>
                        </div>
                        <h4 class="step-title">Inscripcion Finalizada</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 order-md-2">
                <div class="row">
                    <div class="col-sm-12" style="text-align: center;">
                        <img style="width: 50%;"
                            src="http://promocionestigohn.com/saatchihn/tigo/landing-pages/2016/01-enero/refresh-tigo-smart/images/footer-03-logo-tigo-money.png" alt="logo tigo" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="OrdenNro">Numero de Inscripcion</label>
                            <input class="form-control" type="text" id="OrdenNro"
                                disabled runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="Total">Total</label>
                            <input class="form-control" type="text" id="Total"
                                disabled runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="Total">Numero de Telefono</label>
                            <input class="form-control" type="number" id="Telefono" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 order-md-2">
                <div class="checkout-footer margin-top-1x">
                    <div class="column">
                    </div>
                    <div class="column">
                        <a class="btn btn-primary" href="javascript:FinalizarPago();">
                            <span class="hidden-xs-down">Continuar&nbsp;</span>
                            <i class="icon-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/procesodecobro.js"></script>
</asp:Content>

