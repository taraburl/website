<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="noticias.aspx.cs" Inherits="carrito_noticias" %>

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
                                <ul class="post-meta">
                                    <li><i class="icon-clock"></i>&nbsp;<%# Eval("FechaForDisplay") %></li>
                                </ul>
                            </div>
                            <div class="col-md-9 blog-post">
                                <a class="post-thumb" href="#">
                                    <img src="../images/noticia/<%# Eval("IdNoticia")  %>.png" alt="Post" /></a>
                                <h3 class="post-title"><%# Eval("Titulo") %></h3>
                                <p>
                                    <%# Eval("Descripcion") %>
                                </p>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="NoticiaBLL"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

