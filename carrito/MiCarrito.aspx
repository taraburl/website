<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="MiCarrito.aspx.cs" Inherits="carrito_MiCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Mi Carrito</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Mi Carrito</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>Mi Carrito</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-1">
        <div class="table-responsive shopping-cart">
            <table class="table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th class="text-center">Cantidad</th>
                        <th class="text-center">Subtotal</th>
                        <th class="text-center"><a class="btn btn-sm btn-outline-danger" href="javascript:limpiarCarrito()">
                            Limpiar Carrito</a></th>
                    </tr>
                </thead>
                <tbody id="detalle">
                </tbody>
            </table>
            <div class="shopping-cart-footer">
                <div class="column">
                </div>
                <div class="column text-lg">
                    Subtotal: 
                <span class="text-medium" id="SubTotalBs"></span>
                </div>
            </div>
            <div class="shopping-cart-footer">
                <div class="column">
                    <a class="btn btn-outline-secondary" href="inicio.aspx">
                        <i class="icon-arrow-left"></i>&nbsp;Seguir Comprando</a>
                </div>
                <div class="column">
                    <a class="btn btn-success" href="javascript:finalizar()">Finalizar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

