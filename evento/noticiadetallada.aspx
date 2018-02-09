<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="noticiadetallada.aspx.cs" Inherits="carrito_noticiadetallada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Noticias</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>Noticias</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="../index.aspx">Inicio</a>
                    </li>
                    <li class="separator">&nbsp;</li>
                    <li>Noticias</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x mb-2">
        <div class="row">
            <!-- Content-->
            <div class="col-xl-12 col-lg-12">
                <!-- Post-->
                <asp:Repeater runat="server" ID="repeaterNoticias" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <div class="single-post-meta">
                            <div class="column">
                                <div class="meta-link">
                                    <span>Evento</span><a href="Evento.aspx?ID=<%# Eval("IDEvento") %>"><%# Eval("Evento.Nombre") %></a>
                                </div>
                            </div>
                            <div class="column">
                                <div class="meta-link">
                                    <span>Fecha</span>
                                    <%# Eval("FechaForDisplay") %>
                                </div>
                            </div>
                        </div>
                        <div class="owl-carousel" data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: true, &quot;loop&quot;: true }">
                            <figure>
                                <img src="../images/noticia/<%# Eval("IdNoticia")  %>.png" alt="<%# Eval("Titulo") %>"
                                    style="border-radius: 5px;" />
                            </figure>
                        </div>
                        <h2><%# Eval("Titulo") %></h2>
                        <p class="text-white"><%# Eval("Descripcion") %></p>
                        <div class="single-post-footer">
                            <div class="column">
                                <div class="entry-share">
                                    <span class="text-white">Compartir Noticia:</span>
                                    <div class="share-links">
                                        <a class="social-button shape-circle sb-facebook fb text-white"
                                            href="#" data-toggle="tooltip"
                                            data-placement="top" title="Facebook"><i class="socicon-facebook"
                                                onclick="window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent('sport.sea.com.bo/evento/noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>'),
                                            'facebook-share-dialog','width=626,height=436'); return false;"></i></a>
                                        <a class="social-button shape-circle sb-twitter tw text-white"
                                            href="https://twitter.com/share"
                                            data-size="large"
                                            data-text="SEA"
                                            data-url="https://dev.twitter.com/web/tweet-button"
                                            data-hashtags="sea"
                                            data-via="twitterdev"
                                            data-related="twitterapi,twitter"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Twitter"
                                            target="_blank"><i class="socicon-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectById" TypeName="NoticiaBLL">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <script src="/carrito/js/evento.js"></script>
</asp:Content>

