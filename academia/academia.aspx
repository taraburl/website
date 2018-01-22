<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="academia.aspx.cs" Inherits="academia_academia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Santa Cruz Soccer Academy</title>
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
            'http:/www.googletagmanager.com/gtm5445.html?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-T4DJFPZ');

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Title-->
    <div class="page-title ">
        <div class="container">
            <div class="column">
                <h1>Academia de Fútbol</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Academia de Futbol</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container padding-bottom-3x mb-1">
        <div class="row">
            <div class="col-lg-9 col-md-8 order-md-2">
                <div class="gallery-wrapper owl-carousel" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;margin&quot;: 30, &quot;autoplay&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;576&quot;:{&quot;items&quot;:2},&quot;991&quot;:{&quot;items&quot;:3},&quot;1200&quot;:{&quot;items&quot;:3}} }">
                    <asp:Repeater ID="repaterGallery" runat="server" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="gallery-item">
                                <a href="/images/galeria/<%# Eval("ID") %>.jpg" data-size="1000x667">
                                    <img src="/images/galeria/<%# Eval("ID") %>.jpg" alt="<%# Eval("Modulo") %>" class="slider-top" /></a><span class="caption"><%# Eval("Descripcion") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByModulo" TypeName="ImagenDSTableAdapters.tbl_imagenesTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <h6 class="text-normal text-uppercase">Academia de Fútbol - Categorias</h6>
                <hr class="margin-bottom-1x" />
                <nav class="list-group">
                    <asp:Repeater runat="server" ID="CategoriaRepeater" DataSourceID="ObjectDataSource4">
                        <ItemTemplate>
                            <a class="list-group-item with-badge text-white" href="#"><%#Eval("Nombre") %><span class="badge badge-primary badge-pill"><%#Eval("Descripcion") %></span></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectAll" TypeName="CategoriaAcademiaBLL"></asp:ObjectDataSource>
                </nav>
                <h6 class="text-normal text-uppercase">Galeria de Imágenes</h6>
                <hr class="margin-bottom-1x" />
                <div class="gallery-wrapper isotope-grid cols-3 grid-no-gap">
                    <div class="gutter-sizer"></div>
                    <div class="grid-sizer"></div>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="grid-item gallery-item">
                                <a href="/images/galeria/<%# Eval("ID") %>.jpg" data-size="1000x667">
                                    <img src="/images/galeria/<%# Eval("ID") %>.jpg" alt="<%# Eval("Modulo") %>"></a><span class="caption"><%# Eval("Descripcion") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <h6 class="text-normal text-uppercase">Galeria de Videos</h6>
                <hr class="margin-bottom-1x" />
                <div class="gallery-wrapper isotope-grid cols-3 grid-no-gap">
                    <div class="gutter-sizer"></div>
                    <div class="grid-sizer"></div>
                    <asp:Repeater runat="server" ID="repeaterVideos" DataSourceID="ObjectDataSource3">
                        <ItemTemplate>
                            <div class="grid-item gallery-item">
                                <a href="#" data-type="video" data-video="&lt;div class=&quot;wrapper&quot;&gt;&lt;div class=&quot;
                                    video-wrapper&quot;&gt;&lt;iframe class=&quot;pswp__video&quot;width=&quot;960&quot; height=&quot;640&quot; 
                                    src=//www.youtube.com/embed/<%# Eval("Imagen") %> frameborder=&quot;0&quot;allowfullscreen&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;">
                                    <img src="http://img.youtube.com/vi/<%# Eval("Imagen") %>/0.jpg" alt="<%# Eval("Modulo") %>" />
                                </a>
                                <span class="caption"><%# Eval("Descripcion") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByModulo" TypeName="VideoBLL">
                        <SelectParameters>
                            <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 order-md-1">
                <div class="padding-top-3x hidden-md-up"></div>
                <section class="promo-box" style="background-image: url(/images/background1.jpg);">
                    <span class="overlay-dark" style="opacity: .4;"></span>
                    <div class="promo-box-content text-center padding-top-2x padding-bottom-2x">
                        <h3 class="text-bold text-light text-shadow">Catálogo de Productos</h3>
                        <a class="btn btn-primary" href="../carrito/inicio.aspx">Compra Ahora</a>
                    </div>
                </section>
                <div class="padding-top-1x"></div>
                <section class="promo-box" style="background-image: url(/images/background2.jpg);">
                    <span class="overlay-dark" style="opacity: .4;"></span>
                    <div class="promo-box-content text-center padding-top-2x padding-bottom-2x">
                        <h3 class="text-bold text-light text-shadow">Inscripcones a la Academia de Fútbol SEA</h3>
                        <a class="btn btn-primary" href="../carrito/Inscripciones.aspx">Inscribete Ahora</a>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

