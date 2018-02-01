<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="NoticiasFixture.aspx.cs" Inherits="admin_eventos_NoticiasFixture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Datos Oficiales</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE DATOS OFICIALES DEL EVENTO</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listNoticia">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newNoticia();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO DATO OFICIAL
            </a>
            <div class="pull-right box-tools">
                <a class="btn btn-default btn-sm" href="Fixture.aspx" data-toggle="tooltip" title="Cancelar"><i class="fa fa-times" aria-hidden="true"></i></a>
            </div>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView
                ID="GridView1"
                runat="server"
                DataSourceID="ObjectDataSource2"
                AllowPaging="True"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered table-hover table-sm"
                CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Partido.Partido" HeaderText="Partido" SortExpression="Partido.Partido" />
                    <asp:BoundField DataField="Equipo.Nombre" HeaderText="Equipo" SortExpression="Equipo.Nombre" />
                    <asp:BoundField DataField="Jugador.Nombre" HeaderText="Jugador" SortExpression="Jugador.Nombre"></asp:BoundField>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo"></asp:BoundField>
                    <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" SortExpression="FechaForDisplay"></asp:BoundField>
                    <asp:BoundField DataField="HoraForDisplay" HeaderText="Hora" SortExpression="HoraForDisplay"></asp:BoundField>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaNoticia<%# Eval("Id") %>" href="javascript:actualizarNoticia(<%# Eval("Id")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaNoticia<%# Eval("Id")%>" href="javascript:eliminarNoticia(<%# Eval("Id") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle BackColor="#47AEC5" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#081A28" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#081A28" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectByEvento" TypeName="FixtureNoticiaBLL" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ID" Name="idEvento" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newNoticia" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nueva Noticia</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Noticia</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdNoticia" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Partido:</label>
                    <asp:DropDownList runat="server" ID="IdPartido" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource1" DataTextField="Partido" DataValueField="IdFixture">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectByEvento" TypeName="FixtureBLL">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="ID" Name="idGrupo" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Equipo del Partido:</label>
                    <asp:DropDownList runat="server" ID="IdEquipos" CssClass="form-control select2" Style="width: 100%;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Jugadores del Equipo:</label>
                    <asp:DropDownList runat="server" ID="IdJugador" CssClass="form-control select2" Style="width: 100%;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Tipo:</label>
                    <asp:DropDownList runat="server" ID="Tipo" CssClass="form-control select2" Style="width: 100%;">
                        <asp:ListItem Text="Tarjeta Roja" Value="Tarjeta Roja"></asp:ListItem>
                        <asp:ListItem Text="Tarjeta Amarilla" Value="Tarjeta Amarilla"></asp:ListItem>
                        <asp:ListItem Text="Gol" Value="Gol"></asp:ListItem>
                        <asp:ListItem Text="Comentario" Value="Comentario"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-12"></div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Hora de Partido:</label>
                <div class='input-group date' id='hora'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-time"></span>
                    </span>
                </div>
            </div>
            <div class='col-xs-12 col-lg-6 col-md-6'>
                <label for="fecha">Fecha del Partido</label>
                <div class='input-group date' id='fecha'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarNoticia()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelNoticia()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/fixturenoticias.js"></script>
</asp:Content>

