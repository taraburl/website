<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="caracteristicas.aspx.cs" Inherits="carrito_caracteristicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA- Caracteristicas del Producto</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Catálodo de Productos</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li>
                        <a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>
                        <a href="inicio.aspx">Catálogo de Productos</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Detalle de Producto</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-1">
        <div class="row">
            <asp:Repeater runat="server" ID="repeaterProducto" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <div class="col-md-6">
                        <div class="product-gallery">
                            <div class="product-carousel owl-carousel">
                                <div data-hash="one">
                                    <img src="../images/productos/<%# Eval("IdProducto") %>.jpg" alt="Product" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h2 class="padding-top-1x text-normal"><%# Eval("Nombre") %></h2>
                        <span class="h2 d-block">Bs. <%# Eval("PrecioVenta") %></span>
                        <p><%# Eval("Descripcion") %></p>
                        <div class="row margin-top-1x">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="quantity">Cantidad:</label>
                                    <select class="form-control" id="quantity">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="padding-bottom-1x mb-2">
                            <span class="text-medium">Talla/Tamaño:&nbsp;</span>
                            <a class="navi-link" href="#"><%# Eval("medida") %></a>
                        </div>
                        <div class="padding-bottom-1x mb-2">
                            <span class="text-medium">Cantidad Disponible:&nbsp;</span>
                            <a class="navi-link" href="#"><%# Eval("stock") %></a>
                        </div>
                        <div class="padding-bottom-1x mb-2">
                            <span class="text-medium">Categoria:&nbsp;</span>
                            <a class="navi-link" href="productos.aspx?ID=<%# Eval("Categoria.IdCategoria") %>"><%# Eval("Categoria.Nombre") %></a>
                        </div>
                        <hr class="mb-3">
                        <div class="d-flex flex-wrap justify-content-between">
                            <div class="sp-buttons mt-2 mb-2">
                                <a class="btn btn-primary"
                                    href="javascript:agregarProducto(<%# Eval("IdProducto") %>)">
                                    <i class="icon-bag"></i>Agregar
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectById" TypeName="ProductoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <script src="js/carrito.js"></script>
</asp:Content>

