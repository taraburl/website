<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="CompraCompleta.aspx.cs" Inherits="carrito_CompraCompleta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Procesar Pedido</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Pedido Finalizado</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a></li>
                    <li class="separator">&nbsp;</li>
                    <li><a href="MiCarrito.aspx">Mi Carrito</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>Pedido Finalizado</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-xl-12">
                <div class="checkout-steps">
                    <a class="active" href="#">3. Pedido Finalizado</a>
                    <a class="completed" href="#">
                        <span class="step-indicator icon-circle-check"></span>
                        <span class="angle"></span>2. Procesar Pedido</a>
                    <a class="completed" href="#">
                        <span class="step-indicator icon-circle-check"></span>
                        <span class="angle"></span>1. Revisar Detalle</a>
                </div>
            </div>
        </div>
        <div class=" text-center">
            <div class="card-block padding-top-2x">
                <h3 class="card-title">Muchas Gracias por Comprar!</h3>
                <p class="card-text text-white">
                    Tu Codigo de compra es 
                    <asp:Label ID="COD" runat="server" Text="" CssClass="text-medium"></asp:Label>
                </p>
                <p class="card-text text-white">
                    Recibiras un mail con un comprobante de compras.
                </p>
                <div class="padding-top-1x padding-bottom-1x">
                    <a href="../index.aspx" class="btn btn-primary">
                        <i class="pe-7s-back"></i>&nbsp;Volver al Inicio</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

