﻿<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="noticias.aspx.cs" Inherits="carrito_noticias" %>

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
    <div class="container padding-bottom-3x mb-1">
        <div class="row">
            <!-- Blog Posts-->
            <div class="col-xl-9 col-lg-8">
                <!-- Post-->
                <asp:Repeater runat="server" ID="RepeaterNoticias" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <article class="row">
                            <div class="col-md-3">
                                <ul class="post-meta text-white">
                                    <li><i class="icon-clock"></i>&nbsp;<%# Eval("FechaForDisplay") %></li>
                                    <li><i class="icon-paper"></i>&nbsp;<%# Eval("Evento.Nombre") %></li>
                                </ul>
                            </div>
                            <div class="col-md-9 blog-post text-white">
                                <a class="post-thumb" href="noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>">
                                    <img src="../images/noticia/<%# Eval("IdNoticia")  %>.png" alt="Post" /></a>
                                <h3 class="post-title text-white"><a href="noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>"><%# Eval("Titulo") %></a></h3>
                                <p>
                                    <%# Eval("Descripcion") %>
                                    <a href='noticiadetallada.aspx?ID=<%# Eval("IdNoticia") %>' class='text-medium'>Ver Noticia</a>
                                </p>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectByEvento" TypeName="NoticiaBLL">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div class="col-xl-3 col-lg-4">
                <aside class="sidebar">
                    <div class="padding-top-2x hidden-lg-up"></div>
                    <section class="widget widget-categories">
                        <h3 class="widget-title">Eventos</h3>
                        <ul>
                            <li><a href="listanoticias.aspx">Ver todos </a></li>
                            <asp:Repeater runat="server" ID="repeaterEventos" DataSourceID="odsEventos">
                                <ItemTemplate>
                                    <li><a href="noticias.aspx?ID=<%# Eval("IdEvento") %>"><%# Eval("Nombre")%></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <asp:ObjectDataSource ID="odsEventos" runat="server" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
                    </section>
                </aside>
            </div>
        </div>
    </div>
    <script src="../carrito/js/evento.js"></script>
</asp:Content>

