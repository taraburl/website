<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="carrito_inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA-Catalogo de Productos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- banner -->
    <div class="banner banner1">
        <div class="container">
            <h2>Great Offers on <span>Mobiles</span> Flat <i>35% Discount</i></h2>
        </div>
    </div>
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
                                onselectedindexchanged="Unnamed_Click"></asp:DropDownList>
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
                                                <input type="hidden" name="w3ls_item" value="<%# Eval("nombre") %>" />
                                                <input type="hidden" name="amount" value="<%# Eval("precio") %>" />
                                                <a href="#" class="w3ls-cart">Agregar al Carrito</a>
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
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <section>
                        <div class="modal-body">
                            <div class="col-md-5 modal_body_left">
                                <img src="" alt=" " class="img-responsive"  id="img-producto"/>
                            </div>
                            <div class="col-md-7 modal_body_right">
                                <h4 id="nombre-producto"></h4>
                                <p id="descripcion-producto"></p>
                                <div class="modal_body_right_cart simpleCart_shelfItem">
                                    <p><i class="fa fa-usd" id="precio-producto" ></i></p>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="idproducto" value="id-producto" />
                                    <input type="hidden" name="w3ls_item" value="" id="nombre-producto2"/>
                                    <input type="hidden" name="amount" value="" id="precio-producto2"/>
                                    <a href="#" class="w3ls-cart">Agregar Al Carrito</a>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script src="js/carrito.js"></script>
</asp:Content>

