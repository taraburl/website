<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="ProcesarPedido.aspx.cs" Inherits="carrito_ProcesarPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Procesar Pedido</title>
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
                    <li>Procesar Pedido</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-xl-12">
                <div class="checkout-steps">
                    <a href="#">3. Pedido Finalizado</a>
                    <a href="#">
                        <span class="angle"></span>2. Procesar Pedido</a>
                    <a class="active" href="#">
                        <span class="angle"></span>1. Revisar Detalle</a>
                </div>
                <h4>Lista de Productos</h4>
                <hr class="padding-bottom-1x" />
                <div class="table-responsive shopping-cart">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th class="text-center">Subtotal</th>
                            </tr>
                        </thead>
                        <tbody id="detalleCart">
                        </tbody>
                    </table>
                </div>
                <div class="shopping-cart-footer text-white">
                    <div class="column"></div>
                    <div class="column text-lg">Total: <span class="text-medium" id="totalCartDet"></span></div>
                </div>
                <asp:HiddenField runat="server" ID="totalHdn" />
                <h4>Seleccione el Metodo de Pago</h4>
                <hr class="padding-bottom-1x" />
                <div class="row padding-top-1x mt-3">
                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:Repeater runat="server" ID="RepeaterFormaPago" DataSourceID="ObjectDataSource2">
                                <ItemTemplate>
                                    <label class="custom-control custom-radio">
                                        <input class="custom-control-input formaPago" type="radio"
                                            name="TipoPago" id="tipoPago<%# Eval("idtipoPago") %>" value="<%# Eval("idtipoPago") %>" />
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description"><%# Eval("nombre") %></span>
                                    </label>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                                OldValuesParameterFormatString="original_{0}"
                                SelectMethod="selectNoEliminados"
                                TypeName="TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter"></asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
                <div class="checkout-footer margin-top-1x">
                    <div class="column hidden-xs-down">
                        <a class="btn btn-outline-secondary" href="MiCarrito.aspx">
                            <i class="icon-arrow-left"></i>&nbsp;Volver al Carrito</a>
                    </div>
                    <div class="column">
                        <a class="btn btn-primary" href="javascript:procesarPedido()">Finalizar Orden</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/finalizarpedido.js"></script>
</asp:Content>

