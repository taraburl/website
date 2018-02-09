<%@ Page Title="" Language="C#" MasterPageFile="~/carrito/Carrito.master" AutoEventWireup="true" CodeFile="estadisticas.aspx.cs" Inherits="carrito_estadisticas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Estadisticas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Title-->
    <div class="page-title estadisticas-title navbar-sticky">
        <div class="equipos-score container">
            <div class="row">
                <asp:Repeater runat="server" ID="repeaterEquiposVersus" DataSourceID="odsDatosPartido">
                    <ItemTemplate>
                        <div class="col-lg-1 col-3 pulse animated infinite">
                            <img src="../images/equipos/<%# Eval("IdEquipo") %>.png" alt="<%# Eval("Equipo.Nombre") %>" style="width: 70px !important;" />
                        </div>
                        <div class="col-lg-10 col-6 text-center" style="vertical-align: middle !important;">
                            <div class="row">
                                <h1 class="nombre-team-estadisticas col-lg-3"><%# Eval("Equipo.Nombre") %></h1>
                                <div class="col-lg-1 col-3">
                                    <h1 class="text-white"><%# Eval("ScoreEquipo") %></h1>
                                </div>
                                <div class="col-lg-4 col-6">
                                    <span class="badge badge-default badge-rounded ">VS</span><br />
                                    <span class="text-white text-bold"><%# Eval("HoraForDisplay") %></span><br />
                                    <span class="text-white text-bold"><%# Eval("FechaForDisplay") %></span>
                                </div>
                                <div class="col-lg-1 col-3">
                                    <h1 class="text-white"><%# Eval("ScoreRival") %></h1>
                                </div>
                                <h1 class="nombre-team-estadisticas col-lg-3"><%# Eval("Rival.Nombre") %></h1>
                            </div>
                        </div>
                        <div class="col-lg-1 left col-3 pulse animated infinite">
                            <img src="../images/equipos/<%# Eval("IdRival") %>.png" alt="<%# Eval("Rival.Nombre") %>" style="width: 70px !important;" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="container padding-bottom-2x mb-2">
        <div class="row">
            <div class="col-xl-3 col-lg-3 order-lg-1">
                <h6 class="text-normal text-bold text-uppercase">Equipos</h6>
                <hr class="padding-top-1x" />
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <asp:Repeater ID="repeaterEquipos" runat="server" DataSourceID="odsDatosPartido">
                        <ItemTemplate>
                            <li class="nav-item"><a class="nav-link active text-white" href="#equipo1" data-toggle="tab" role="tab"><%# Eval("Equipo.Nombre") %></a></li>
                            <li class="nav-item"><a class="nav-link text-white" href="#equipo2" data-toggle="tab" role="tab"><%# Eval("Rival.Nombre") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="tab-content padding-top-none">
                    <div class="tab-pane fade show active" id="equipo1" role="tabpanel">
                        <div class="row text-center">
                            <div class="col-6">
                                <h6>Nro.</h6>
                            </div>
                            <div class="col-6">
                                <h6>Jugador</h6>
                            </div>
                            <asp:Repeater ID="repeaterEquipo1" runat="server" DataSourceID="odsEquipoTitular">
                                <ItemTemplate>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("NumeroCamiseta") %></p>
                                    </div>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("Nombre") %></p>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource runat="server" ID="odsEquipoTitular" SelectMethod="SelectByTipo" TypeName="JugadorEquipoBLL">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Titular" Name="tipo" Type="String"></asp:Parameter>
                                    <asp:SessionParameter SessionField="equipo" DefaultValue="" Name="idEquipo" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <h6 class="text-normal text-bold text-uppercase">Suplentes</h6>
                        <hr class="" />
                        <div class="row text-center">
                            <div class="col-6">
                                <h6>Nro.</h6>
                            </div>
                            <div class="col-6">
                                <h6>Jugador</h6>
                            </div>
                            <asp:Repeater runat="server" ID="repeaterSuplentes" DataSourceID="odsEquipoSuplente">
                                <ItemTemplate>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("NumeroCamiseta") %></p>
                                    </div>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("Nombre") %></p>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource runat="server" ID="odsEquipoSuplente" SelectMethod="SelectByTipo" TypeName="JugadorEquipoBLL">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Suplente" Name="tipo" Type="String"></asp:Parameter>
                                    <asp:SessionParameter SessionField="equipo" DefaultValue="" Name="idEquipo" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                    <div class="tab-pane fade table-responsive" id="equipo2" role="tabpanel">
                        <div class="row text-center">
                            <div class="col-6">
                                <h6>Nro.</h6>
                            </div>
                            <div class="col-6">
                                <h6>Jugador</h6>
                            </div>
                            <asp:Repeater ID="repeaterRival" runat="server" DataSourceID="odsRivalTitular">
                                <ItemTemplate>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("IdJugadorEquipo") %></p>
                                    </div>
                                    <div class="col-6 text-white">
                                        <p><%# Eval("Nombre") %></p>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:ObjectDataSource runat="server" ID="odsRivalTitular" SelectMethod="SelectByTipo" TypeName="JugadorEquipoBLL">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Titular" Name="tipo" Type="String"></asp:Parameter>
                                    <asp:SessionParameter SessionField="rival" DefaultValue="" Name="idEquipo" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <h6 class="text-normal text-bold text-uppercase">Suplentes</h6>
                        <hr class="" />
                        <div class="row text-center">
                            <div class="col-6">
                                <h6>Nro.</h6>
                            </div>
                            <div class="col-6">
                                <h6>Jugador</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <h6 class="text-normal text-bold text-uppercase padding-top-1x">Datos del Partido</h6>
                <hr class="padding-top-1x" />
                <asp:Repeater ID="repeaterDatos" runat="server" DataSourceID="odsDatosPartido">
                    <ItemTemplate>
                        <p class="text-white"><span class="text-bold">Lugar: </span><%# Eval("Cancha.Nombre") %></p>
                        <p class="text-white"><span class="text-bold">Fecha: </span><%# Eval("FechaForDisplay") %></p>
                        <p class="text-white"><span class="text-bold">Hora: </span><%# Eval("HoraForDisplay") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="odsDatosPartido" SelectMethod="SelectById" TypeName="FixtureBLL">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ID" Name="id" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div class="col-xl-6 col-lg-6 order-lg-2">
                <h6 class="text-normal text-bold text-uppercase">Datos Oficiales</h6>
                <hr class="padding-top-1x" />
                <nav class="list-group">
                    <asp:Repeater runat="server" ID="repeater1" DataSourceID="odsGol">
                        <ItemTemplate>
                            <a class="list-group-item" href="#">
                                <img src="../images/gol.png" alt="gol" style="width: 20px !important; height: 20px !important; object-fit: contain;"/>
                                <span><%# Eval("Jugador.Nombre") %></span>   <%# Eval("Descripcion") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource runat="server" ID="odsGol" SelectMethod="SelectByTipo" TypeName="FixtureNoticiaBLL" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Gol" Name="tipo" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="ID" DefaultValue="" Name="idFixture" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:Repeater runat="server" ID="repeater2" DataSourceID="odsRojas">
                        <ItemTemplate>
                            <a class="list-group-item" href="#">
                                <img src="../images/roja.png" alt="gol" style="width: 20px !important; height: 20px !important; object-fit: contain;"/>
                                <span><%# Eval("Jugador.Nombre") %></span>  <%# Eval("Descripcion") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource runat="server" ID="odsRojas" SelectMethod="SelectByTipo" TypeName="FixtureNoticiaBLL" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Tarjeta Roja" Name="tipo" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="ID" DefaultValue="" Name="idFixture" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:Repeater runat="server" ID="repeater3" DataSourceID="odsAmarilla">
                        <ItemTemplate>
                            <a class="list-group-item" href="#">
                                <img src="../images/amarilla.png" alt="gol" style="width: 20px !important; height: 20px !important; object-fit: contain;"/>
                                <span><%# Eval("Jugador.Nombre") %></span>   <%# Eval("Descripcion") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource runat="server" ID="odsAmarilla" SelectMethod="SelectByTipo" TypeName="FixtureNoticiaBLL" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Tarjeta Amarilla" Name="tipo" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="ID" DefaultValue="" Name="idFixture" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </nav>
                <h6 class="text-normal text-bold text-uppercase">En Vivo</h6>
                <hr class="padding-top-1x" />
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/live_stream?channel=UCkfpfzUBL6IUEYrYpPIvRcg" allowfullscreen></iframe>
                </div>
                <h6 class="text-normal text-bold text-uppercase">Comentarios</h6>
                <hr class="padding-top-1x" />
                <nav class="list-group">
                    <asp:Repeater runat="server" ID="repeaterComentarios" DataSourceID="odsComentarios">
                        <ItemTemplate>
                            <a class="list-group-item" href="#">
                                <i class="icon-globe"></i><span><%# Eval("HoraForDisplay") %></span>        <%# Eval("Descripcion") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource runat="server" ID="odsComentarios" SelectMethod="SelectByTipo" TypeName="FixtureNoticiaBLL" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Comentario" Name="tipo" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="ID" DefaultValue="" Name="idFixture" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </nav>
            </div>
            <div class="col-xl-3 col-lg-3 order-lg-3">
                <h6 class="text-normal text-bold text-uppercase">Tabla de Posiciones</h6>
                <hr class="margin-bottom-1x" />
                <div class="card card-std table-responsive">
                    <asp:GridView
                        runat="server"
                        ID="gvPosiciones"
                        AutoGenerateColumns="False"
                        DataKeyNames="IdEquipo"
                        DataSourceID="odsTablaPosiciones"
                        CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="Equipo">
                                <ItemTemplate>
                                    <%# Eval("Equipo.Nombre") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IdRival" HeaderText="P.J." SortExpression="IdRival"></asp:BoundField>
                            <asp:TemplateField HeaderText="Dif.">
                                <ItemTemplate>
                                    <%# Convert.ToInt32(Eval("IdCancha")) - Convert.ToInt32(Eval("IdGrupo")) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Eliminado" HeaderText="Pts." SortExpression="Eliminado"></asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="odsTablaPosiciones" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectPosiciones" TypeName="FixtureBLL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="evento" Name="idEvento" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <h6 class="text-normal text-bold text-uppercase margin-top-1x">Imagenes de Nuestro Evento</h6>
                <hr class="margin-bottom-1x" />
                <div class="row gallery-wrapper owl-carousel" style="width: 100% !important; margin: 1px !important;"
                    data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;margin&quot;: 20, &quot;autoplay&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;576&quot;:{&quot;items&quot;:1},&quot;991&quot;:{&quot;items&quot;:1},&quot;1200&quot;:{&quot;items&quot;:1}} }">
                    <asp:Repeater ID="repaterGallery" runat="server" DataSourceID="odsNoticias">
                        <ItemTemplate>
                            <div class="gallery-item">
                                <a href="/images/noticia/<%# Eval("IdNoticia") %>.png" data-size="1000x667">
                                    <img src="/images/noticia/<%# Eval("IdNoticia") %>.png" alt="<%# Eval("Titulo") %>" class="slider-top" /></a><span class="caption"><%# Eval("Titulo") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource runat="server" ID="odsNoticias" SelectMethod="SelectByEvento" TypeName="NoticiaBLL" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="evento" Name="id" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
    <script src="../carrito/js/evento.js"></script>
</asp:Content>

