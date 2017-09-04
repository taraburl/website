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
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Baby Juniors</strong> - 3 a 5 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Little Juniors</strong> - 5 a 7 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Rookie Juniors</strong> - 8 a 10 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Pre Juniors</strong> - 11 a 13 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Juniors</strong> - 14 a16 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Pro Juniors</strong> - 17 a 22 años</li>
                    <li class="wow bounceInLeft" data-wow-delay="0.8s"><strong>Pink Juniors</strong> - Damas Arqueros Juniors</li>
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
        <div class=" container clear">
            <div class="content">
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
                            <a href="#" class="boton-pi">INSCRIPCIONES</a>
                        </span>
                    </div>
                </div>
            </div>
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
                <asp:repeater id="repaterGallery" runat="server" datasourceid="ObjectDataSource1">
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
                </asp:repeater>
                <asp:objectdatasource id="ObjectDataSource1" runat="server" oldvaluesparameterformatstring="original_{0}" selectmethod="selectByModulo" typename="ImagenDSTableAdapters.tbl_imagenesTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                    </SelectParameters>
                </asp:objectdatasource>
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
    <div class="wrapper row5" style="margin: 0px 0 20px 0;">
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
                <asp:repeater runat="server" datasourceid="ObjectDataSource2">
                    <ItemTemplate>
                        <div class="cbp-item graphic">
                            <div class="cbp-caption">
                                <a href="<%# Eval("URL") %>" class="cbp-caption cbp-lightbox" data-title="<%# Eval("Descripcion") %>">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="/images/video.png" alt="imagen-video" />
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
                </asp:repeater>
                <asp:objectdatasource id="ObjectDataSource2" runat="server" oldvaluesparameterformatstring="original_{0}" selectmethod="selectByModulo" typename="VideoDSTableAdapters.tbl_videoTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="modulo" SessionField="modulo" Type="String" />
                    </SelectParameters>
                </asp:objectdatasource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
