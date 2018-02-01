<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="evento_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Title-->
    <div class="page-title ">
        <div class="container">
            <div class="column">
                <h1>Eventos Deportivos</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Eventos Deportivos</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container padding-bottom-3x mb-1">
        <div class="row">
            <div class="col-lg-9 col-md-8 order-md-2">
                <div class="gallery-wrapper owl-carousel" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;margin&quot;: 30, &quot;autoplay&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;576&quot;:{&quot;items&quot;:2},&quot;991&quot;:{&quot;items&quot;:3},&quot;1200&quot;:{&quot;items&quot;:3}} }">
                    <asp:repeater id="repaterGallery" runat="server" datasourceid="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="gallery-item">
                                <a href="/images/galeria/<%# Eval("ID") %>.jpg" data-size="1000x667">
                                    <img src="/images/galeria/<%# Eval("ID") %>.jpg" alt="<%# Eval("Modulo") %>" class="slider-top" /></a><span class="caption"><%# Eval("Descripcion") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:repeater>
                    <asp:objectdatasource id="ObjectDataSource1" runat="server" oldvaluesparameterformatstring="original_{0}" selectmethod="selectByModulo" typename="ImagenDSTableAdapters.tbl_imagenesTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                        </SelectParameters>
                    </asp:objectdatasource>
                </div>
                <h6 class="text-normal text-uppercase">Nuestros Servicios</h6>
                <hr class="margin-bottom-1x" />
                <nav class="list-group">
                    <a class="list-group-item with-badge text-white" href="#">Organización y difusión de conferencias de prensas.</a>
                    <a class="list-group-item with-badge text-white" href="#">Organización, monitoreo y supervisión en los actos de apertura, clausura o premiaciones.</a>
                    <a class="list-group-item with-badge text-white" href="#">Publicación, seguimientos, control y actualización de nuestros eventos en las redes sociales, plataforma web y nuestra App móvil.</a>
                    <a class="list-group-item with-badge text-white" href="#">Diseño y elaboración de toda la imagen corporativa del evento.</a>
                    <a class="list-group-item with-badge text-white" href="#">Servicio arbitraje, jueces y planillas. Entrega de trofeos, medallas, certificados o diplomas.</a>
                    <a class="list-group-item with-badge text-white" href="#">Fotografía y video corporativo.</a>
                    <a class="list-group-item with-badge text-white" href="#">Servicios de catering.</a>
                </nav>
                <h6 class="text-normal text-uppercase">Galeria de Imágenes</h6>
                <hr class="margin-bottom-1x" />
                <div class="gallery-wrapper isotope-grid cols-3 grid-no-gap">
                    <div class="gutter-sizer"></div>
                    <div class="grid-sizer"></div>
                    <asp:repeater id="Repeater1" runat="server" datasourceid="ObjectDataSource1">
                        <ItemTemplate>
                            <div class="grid-item gallery-item">
                                <a href="/images/galeria/<%# Eval("ID") %>.jpg" data-size="1000x667">
                                    <img src="/images/galeria/<%# Eval("ID") %>.jpg" alt="<%# Eval("Modulo") %>"></a><span class="caption"><%# Eval("Descripcion") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:repeater>
                </div>
                <h6 class="text-normal text-uppercase">Galeria de Videos</h6>
                <hr class="margin-bottom-1x" />
                <div class="gallery-wrapper isotope-grid cols-3 grid-no-gap">
                    <div class="gutter-sizer"></div>
                    <div class="grid-sizer"></div>
                    <asp:repeater runat="server" id="repeaterVideos" datasourceid="ObjectDataSource3">
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
                    </asp:repeater>
                    <asp:objectdatasource id="ObjectDataSource3" runat="server" selectmethod="SelectByModulo" typename="VideoBLL">
                        <SelectParameters>
                            <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                        </SelectParameters>
                    </asp:objectdatasource>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 order-md-1">
                <div class="padding-top-3x hidden-md-up"></div>
                <img src="../images/logo.png" alt="atletico" class="" />
                <div class="padding-top-1x"></div>
                <h6 class="text-normal text-uppercase text-center">Acerca de Nuestros Eventos Deportivos</h6>
                <hr class="margin-bottom-1x" />
                <div class="text-white text-justify">
                    Nuestra unidad de negocios “Eventos Deportivos” busca la integración, motivación, fidelización de los participantes, fortaleciendo el vínculo de las personas con los sponsors.
                    Proporcionamos el soporte necesario para organizar tu evento deportivo, abarcando cualquier tipo de proyecto, desde olimpiadas internas, carreras pedestres, campeonatos de fútbol, tenis, wally, natación, racquet, ciclismo, entre otros.
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#CartIcons").hide();
    </script>
</asp:Content>

