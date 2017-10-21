<%@ Page Title="" Language="C#" MasterPageFile="~/servicios/Servicios.master" AutoEventWireup="true" CodeFile="SoccerAcademy.aspx.cs" Inherits="servicios_SoccerAcademy" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SEA - Santa Cruz Soccer Academy</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper row3">
        <div id="group">
            <section class="center slider">
                <div>
                    <img src="../images/eventos/1.jpg" alt="eventos-sea" />
                </div>
                <div>
                    <img src="../images/eventos/2.jpg" alt="eventos-sea" />
                </div>
                <div>
                    <img src="../images/eventos/3.jpg" alt="eventos-sea" />
                </div>
                <div>
                    <img src="../images/eventos/4.jpg" alt="eventos-sea" />
                </div>
                <div>
                    <img src="../images/eventos/5.jpg" alt="eventos-sea" />
                </div>
            </section>
        </div>
    </div>
    <div class="wrapper row3">
        <main class="hoc container clear">
            <div class="content" id="">
                <div class="iconserv wow rotateIn" data-wow-delay="0.5s">
                    <img alt="logo" src="../images/atletico.png" style="height: 100px;" />
                </div>
                <p class="wow bounceInLeft" data-wow-delay="0.7s">
                    Academia de fútbol basada en una metodología de superación personal en la cual los niños y jóvenes son los protagonistas.
                </p>
                <p class="wow bounceInLeft" data-wow-delay="0.7s">
                    Santa Cruz Juniors Soccer Academy, afiliada a la academia JCJSA <a href="http://www.jcjsa.org/" target="_blank" style="color: #47AEC5;">www.jcjsa.org</a> en Estados Unidos.
                </p>
                <p class="wow bounceInLeft" data-wow-delay="0.7s">
                    Oportunidad de conseguir intercambios deportivos a colegios de USA.
                </p>
                <p class="wow bounceInLeft" data-wow-delay="0.7s">
                    Oportunidad de poder estudiar y jugar fútbol en universidades de USA mediante becas deportivas universitarias.

                </p>
                <h2 class="wow bounceInLeft subtitulo" data-wow-delay="0.7s">NUESTRAS CATEGORIAS</h2>
                <ul>
                    <asp:Repeater runat="server" ID="CategoriaRepeater" DataSourceID="ObjectDataSource4">
                        <ItemTemplate>
                            <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong><%#Eval("Nombre") %></strong> - <%#Eval("Descripcion") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectAll" TypeName="CategoriaAcademiaBLL"></asp:ObjectDataSource>
                </ul>
            </div>
        </main>
    </div>
    <!--<div class="wrapper row3">
        <div class=" container clear">
            <div class="content">
                <div class="group btmspace-50 demo " id="">
                    <div class="cbp-item one_half first" style="margin: 0px !important;">
                        <a href="#" class="cbp-caption cbp-singlePage" rel="">
                            <div class=""
                                style="background-image: url(/images/background2.jpg); height: 250px; background-attachment: fixed; background-size: cover; margin-right: -50px;">
                            </div>
                        </a>
                        <a href="#" class="cbp-l-grid-work-title" rel="">Catalogo de Productos</a>
                    </div>
                    <div class="cbp-item one_half" style="margin: 0px !important;">
                        <a href="#" class="cbp-caption cbp-singlePage" rel="">
                            <div class=""
                                style="background-image: url(/images/background3.jpg); height: 250px; background-attachment: fixed; background-size: cover; margin-right: -50px;">
                            </div>
                        </a>
                        <a href="#" class="cbp-l-grid-work-title " rel="">Inscripciones</a>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
    <div class="wrapper row3">
        <div class="group">
            <div class="content-lg container">
                <div class="col-xs-12 col-lg-6 col-md-6">
                    <div class="card">
                        <img class="card-img-top" src="../images/background3.jpg" alt="Card image cap" />
                        <div class="card-block">
                            <h4 class="card-title">CATALOGO DE PRODUCTOS</h4>
                            <p class="card-text">Puedes comprar tus unifomes.</p>
                            <a href="../carrito/inicio.aspx" class="btn btn-primary">IR AL CATALOGO DE PRODUCTOS</a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-6 col-md-6">
                    <div class="card">
                        <img class="card-img-top" src="../images/background3.jpg" alt="Card image cap" />
                        <div class="card-block">
                            <h4 class="card-title">INSCRIPCIONES</h4>
                            <p class="card-text">Puedes Inscribirte a nuestros diferentes curs`</p>
                            <a href="../carrito/Inscripciones.aspx" class="btn btn-primary">IR AL FORMULARIO DE INSCRIPCIONES</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--<div-- class="content">
                <div class="bgimg-1 one_half first" style="background-image: url(/images/background2.jpg) !important;">
                    <div class="caption">
                        <span class="border">
                            <a href="/carrito/inicio.aspx" class="boton-pi">PRODUCTOS</a>
                        </span>
                    </div>
                </div>
                <div class="bgimg-1 one_half" style="background-image: url(/images/background3.jpg) !important;">
                    <div class="caption" style="color: #48AEC5 !important;">
                        <span class="border">
                            <a href="/carrito/Inscripciones.aspx" class="boton-pi">INSCRIPCIONES</a>
                        </span>
                    </div>
                </div>
            </div-->
        </div>
    </div>
    <!--<div class="wrapper row5">
        <div class="bgimg-1">
            <div class="caption">
                <span class="border">
                    <img src="/images/logo.png" alt="logosea" style="width: 50px !important;" />IMAGENES</span>
            </div>
        </div>
    </div>-->
    <div class="wrapper row5" style="margin: 0px 0 20px 0;">
        <div id="" class="hoc clear">
            <div class="caption2 caption">
                <span class="">
                    <img src="/images/logo.png" alt="logosea" style="width: 50px !important;" />IMAGENES</span>
            </div>
        </div>
    </div>
    <div class="wrapper row3">
        <div class="clear" style="margin: 0 1% 1% 1%;">
            <div id="js-grid-masonry" class="cbp">
                <asp:Repeater ID="repaterGallery" runat="server" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <div class="cbp-item">
                            <a href="/images/galeria/<%# Eval("ID") %>.jpg" class="cbp-caption cbp-lightbox" data-title="<%# Eval("Descripcion") %>">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="/images/galeria/<%# Eval("ID") %>.jpg" alt="<%# Eval("Descripcion") %>">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-desc"><%# Eval("Descripcion") %></div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByModulo" TypeName="ImagenDSTableAdapters.tbl_imagenesTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <!--<div class="wrapper row5">
        <div class="bgimg-1">
            <div class="caption">
                <span class="border">
                    <img src="../images/logo.png" alt="logosea" style="width: 50px !important;" />VIDEOS</span>
            </div>
        </div>
    </div>-->
    <div class="wrapper row5" style="margin: 0px 0 20px 0; margin-top: 100px;">
        <div id="" class="hoc clear">
            <div class="caption2 caption">
                <span class="">
                    <img src="/images/logo.png" alt="logosea" style="width: 50px !important;" />VIDEOS</span>
            </div>
        </div>
    </div>
    <div class="wrapper row3">
        <div class="clear" style="margin: 0 1% 1% 1%;">
            <div id="js-grid-masonry2" class="cbp">
                <asp:Repeater runat="server" ID="repeaterVideos" DataSourceID="ObjectDataSource3">
                    <ItemTemplate>
                        <div class="cbp-item graphic">
                            <div class="cbp-caption">
                                <a href="<%# Eval("URL") %>" class="cbp-caption cbp-lightbox" data-title="<%# Eval("Descripcion") %>">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="http://img.youtube.com/vi/<%# Eval("Imagen") %>/0.jpg" alt="imagen-video" />
                                    </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <div class="cbp-l-caption-desc"><%# Eval("Descripcion") %></div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectByModulo" TypeName="VideoDSTableAdapters.tbl_videoTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectByModulo" TypeName="VideoBLL">
                    <SelectParameters>
                        <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
