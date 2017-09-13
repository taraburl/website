<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="carrito_inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA-Catalogo de Productos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- breadcrumbs -->
    <div class="breadcrumb_dress">
        <div class="container">
            <ul>
                <li><a href="/index.aspx">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>Inicio</a> <i>/</i></li>
                <li>Productos</li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="mobiles">
        <div class="container">
            <div class="w3ls_mobiles_grids">
                <div class="col-md-12 w3ls_mobiles_grid_right">
                    <div class="clearfix"></div>
                    <div class="w3ls_mobiles_grid_right_grid2">
                        <div class="w3ls_mobiles_grid_right_grid2_left">
                            <h3>Listado de Productos</h3>
                        </div>
                        <div class="w3ls_mobiles_grid_right_grid2_right">
                            <asp:DropDownList runat="server" ID="IdCategoria"
                                CssClass="select_item select2" DataSourceID="ObjectDataSource2"
                                DataTextField="nombre" DataValueField="id" AutoPostBack="True"
                                OnSelectedIndexChanged="Unnamed_Click">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="selectAll"
                                TypeName="CategoriaDSTableAdapters.tbl_categoriaTableAdapter"></asp:ObjectDataSource>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="w3ls_mobiles_grid_right_grid3" id="productos">
                        <asp:Repeater runat="server" ID="repaterProductos" DataSourceID="ObjectDataSource3">
                            <ItemTemplate>
                                <div class="col-md-3 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
                                    <div class="agile_ecommerce_tab_left mobiles_grid">
                                        <div class="hs-wrapper hs-wrapper2">
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <img src="/images/productos/<%# Eval("id") %>.jpg" alt=" " class="img-responsive" />
                                            <div class="w3_hs_bottom w3_hs_bottom_sub1">
                                                <ul>
                                                    <li>
                                                        <a href="javascript:traerproducto(<%# Eval("id") %>)"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <h5><a href="javascript:traerproducto(<%# Eval("id") %>)"><%# Eval("nombre") %></a></h5>
                                        <div class="simpleCart_shelfItem">
                                            <p><i class="fa fa-usd"><%# Eval("precio") %></i></p>
                                            <div>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" id="productoid<%# Eval("id") %>" value="<%# Eval("id") %>" />
                                                <input type="hidden" id="productonombre<%# Eval("id") %>" value="<%# Eval("nombre") %>" />
                                                <input type="hidden" id="productoprecio<%# Eval("id") %>" value="<%# Eval("precio") %>" />
                                                <a href="javascript:agregarCarrito2(<%# Eval("id") %>)" class="w3ls-cart">Agregar al Carrito</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByCategoria" TypeName="ProductoDSTableAdapters.tbl_productoTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="IdCategoria" Name="idcategoria" DefaultValue="" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectNoEliminados" TypeName="ProductoDSTableAdapters.tbl_productoTableAdapter"></asp:ObjectDataSource>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="modal video-modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModal9">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header2">
                        <a href="#" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                    </div>
                    <section>
                        <div class="modal-body">
                            <div class="col-md-5 modal_body_left">
                                <img src="" alt="logo-producto" class="img-responsive" id="img-producto" />
                            </div>
                            <div class="col-md-7 modal_body_right">
                                <h4 id="nombre-producto"></h4>
                                <p id="descripcion-producto"></p>
                                <h5>Talla:</h5>
                                <p id="medida"></p>
                                <h5>Categoria:</h5>
                                <p id="categoria"></p>
                                <div class="modal_body_right_cart simpleCart_shelfItem">
                                    <p><i class="fa fa-usd" id="precio-producto"></i></p>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" value="id-producto" id="idproducto" />
                                    <input type="hidden" value="" id="nombre-producto2" />
                                    <input type="hidden" value="" id="precio-producto2" />
                                    <a href="javascript:agregarCarrito();" class="w3ls-cart">Agregar Al Carrito</a>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="modalCarrito" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title">Carrito de Compras</h3>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="TotalCarrito" value="0"/>
                        <div class="table-responsive">
                            <table class="table" id="tbl_carrito">
                                <thead>
                                    <tr>
                                        <th>Eliminar</th>
                                        <th>Nombre Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <strong>TOTAL:</strong>
                                        </td>
                                        <td colspan="1" id="total-carrito">0
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:pagar();" class="btn btn-success pull-left">Pagar</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/carrito.js"></script>
</asp:Content>

