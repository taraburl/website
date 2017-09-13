<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="ProcesoDePago.aspx.cs" Inherits="carrito_ProcesoDePago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Proceso De Pago</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- breadcrumbs -->
    <div class="breadcrumb_dress">
        <div class="container">
            <ul>
                <li><a href="/index.aspx">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>Inicio</a> <i>/</i></li>
                <li><a href="/carrito/inicio.aspx">Productos</a> <i>/</i></li>
                <li>Proceso de Pago</li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="faq">
        <div class="container">
            <div class="w3ls_mobiles_grids">
                <div class="col-md-12 w3ls_mobiles_grid_right" id="pagos">
                    <asp:Repeater ID="RepeaterTipoPago" runat="server" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="col-md-6 w3ls_mobiles_grid_right_left">
                                <div class="w3ls_mobiles_grid_right_grid1">
                                    <%#Eval("Nombre").ToString() == "Tigo Money" ?
                                       "<img src='/images/tigo.jpg' alt='' class='img-responsive' />" :
                                       "<img src='/images/deposito.jpg' alt='' class='img-responsive' />"%>
                                    <div class="w3ls_mobiles_grid_right_grid1_pos1">
                                        <h3>
                                            <a href="javascript:pagar(<%# Eval("IdTipoPago") %>);"><%# Eval("Nombre") %><i class="fa fa-link"></i></a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="TipoPagoBLL"></asp:ObjectDataSource>
                </div>
                <div class="clearfix"></div>
                <div class="grid_3 grid_4" id="tigomoney" style="display: none;">
                    <h3 class="w3ls-hdg">Pagar Compra Con Tigo Money</h3>
                    <div class="tab-content">
                        <div class="tab-pane active" id="horizontal-form">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Telefono:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control1" id="focusedinput" placeholder="Numero de Telefono" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="disabledinput" class="col-sm-2 control-label">Total</label>
                                    <div class="col-sm-8">
                                        <input runat="server" disabled="" type="text" class="form-control1" id="totalventa" placeholder="Total" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class=" col-sm-8 col-md-offset-2">
                                        <a href="#" class="btn btn-success">Realizar Pago</a>
                                        <a href="javascript:cancelar();" class="btn btn-default pull-right">Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/procesodecobro.js"></script>
</asp:Content>

