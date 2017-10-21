<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="productos.aspx.cs" Inherits="carrito_productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Catalogo de Productos</title>
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
                    <li>Productos por Categorias</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-1">
        <div class="row">
            <div class="col-xl-9 col-lg-8 order-lg-2">
                <div class="isotope-grid cols-4 mb-2">
                    <div class="gutter-sizer"></div>
                    <div class="grid-sizer"></div>
                    <asp:Repeater runat="server" ID="repaterProductos" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="grid-item">
                                <div class="product-card">
                                    <div class="hs-wrapper hs-wrapper2">
                                        <a class="product-thumb" href="caracteristicas.aspx?ID=<%# Eval("id") %>">
                                            <img src="../images/productos/<%# Eval("id") %>.jpg" alt="producto">
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h3 class="product-title">
                                            <a href="caracteristicas.aspx?ID=<%# Eval("id") %>">
                                                <%# Eval("nombre") %></a></h3>
                                        <h4 class="product-price">
                                            <%# Eval("precio") %> Bs.
                                        </h4>
                                        <span class="text-normal">Talla/Tamaño: <%# Eval("medida") %></span>
                                        <span class="text-normal align-content-center">Cantidad Disponible: <%# Eval("stock") %></span>
                                        
                                        <div class="product-buttons">
                                            <a href="javascript:agregarProducto(<%# Eval("id") %>)"
                                                class="btn btn-outline-primary btn-sm">Agregar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="selectByCategoria"
                        TypeName="ProductoDSTableAdapters.tbl_productoTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="idcategoria" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </div>
            </div>
            <div class="col-xl-3 col-lg-4 order-lg-1">
                <aside class="sidebar">
                    <div class="padding-top-2x hidden-lg-up"></div>
                    <!-- Widget Categories-->
                    <section class="widget widget-categories">
                        <h3 class="widget-title">Categorias</h3>
                        <ul>
                            <li><a href="/carrito/inicio.aspx">Ver todos </a></li>
                            <asp:Repeater runat="server" ID="repaterCategorias" DataSourceID="ObjectDataSource2">
                                <ItemTemplate>
                                    <li><a href="productos.aspx?ID=<%# Eval("id") %># "><%# Eval("nombre") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectNoEliminados" TypeName="CategoriaDSTableAdapters.tbl_categoriaTableAdapter"></asp:ObjectDataSource>
                        </ul>
                    </section>
                </aside>
            </div>
        </div>
    </div>
    <script src="js/carrito.js"></script>
</asp:Content>

