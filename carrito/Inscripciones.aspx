<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="Inscripciones.aspx.cs" Inherits="carrito_Inscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Inscripciones</title>
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
                    <li>Inscripciones a la Academia de Futbol SEA</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <div class="col-lg-12">
                <div class="padding-top-2x mt-2 hidden-lg-up"></div>
                <div class="row">
                    <asp:HiddenField runat="server" ID="hdnIdUser" />
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Nombre">Nombre:</label>
                            <input disabled class="form-control" type="text" id="Nombre" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Apellido">Apellidos</label>
                            <input disabled class="form-control" type="text" id="Apellido" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Email">E-mail</label>
                            <input disabled class="form-control" type="email" id="Email" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Telefono">Telefono</label>
                            <input disabled class="form-control" type="text" id="Telefono" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Celular">Celular</label>
                            <input disabled class="form-control" type="text" id="Celular" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Direccion">Direccion</label>
                            <input disabled class="form-control" type="text" id="Direccion" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="Inscrito">Nombre del Inscrito</label>
                            <input class="form-control" type="text" id="Inscrito" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-confirm-pass">Categoria</label>
                            <asp:DropDownList runat="server" ID="IdCategoria"
                                CssClass="form-control" DataSourceID="ObjectDataSource1" DataTextField="Nombre" DataValueField="IdCategoriaAcademia">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="CategoriaAcademiaBLL"></asp:ObjectDataSource>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="Precio">Precio</label>
                            <input disabled class="form-control" type="text" id="Precio" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Metodo de Pago</label>
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
                    <div class="col-12">
                        <hr class="mt-2 mb-3" />
                        <div class="d-flex flex-wrap justify-content-between
                             align-items-center">
                            <a class="btn btn-primary margin-right-none"
                                href="javascript:inscripcion();">Finalizar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/inscripcion.js"></script>
</asp:Content>

