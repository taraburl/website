<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="ProcesarPagoTigoMoney.aspx.cs" Inherits="carrito_ProcesarPagoTigoMoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA -Pago Tigo Money</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Procesar Pedido</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a></li>
                    <li class="separator">&nbsp;</li>
                    <li><a href="ProcesarPedido.aspx">Procesar Pedido</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>Procesar Pago Tigo Money</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-xl-12">
                <div class="checkout-steps">
                    <a href="#">3. Pedido Finalizado</a>
                    <a class="active" href="#">
                        <span class="angle"></span>2. Procesar Pedido</a>
                    <a class="completed" href="#">
                        <span class="step-indicator icon-circle-check"></span>
                        <span class="angle"></span>1. Revisar Detalle</a>
                </div>
            </div>
            <div class="col-xl-12  shopping-cart">
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
            <div class="checkout-footer margin-top-1x">
                <div class="column hidden-xs-down">
                    <a class="btn btn-outline-secondary" href="ProcesarPedido.aspx">
                        <i class="icon-arrow-left"></i>&nbsp;Volver al Carrito</a>
                </div>
                <div class="column">
                    <a class="btn btn-primary" href="javascript:FinalizarPago()">Finalizar Orden</a>
                </div>
            </div>
        </div>
    </div>
    <script src="js/procesodecobro.js"></script>
</asp:Content>

