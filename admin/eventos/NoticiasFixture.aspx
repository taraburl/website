<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="NoticiasFixture.aspx.cs" Inherits="admin_eventos_NoticiasFixture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Noticias Fixture</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE Noticias De FIXTURE</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listNoticia">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newNoticia();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA NOTICIA
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table text-center table-striped table-bordered table-hover table-sm"
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaNoticia<%# Eval("Id") %>" href="javascript:actualizarNoticia(<%# Eval("Id")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaNoticia<%# Eval("Id")%>" href="javascript:eliminarNoticia(<%# Eval("Id") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Partido.Nombre" HeaderText="Equipo" SortExpression="Partido.Nombre" />
                    <asp:BoundField DataField="Jugador.Nombre" HeaderText="Jugador" SortExpression="Jugador" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" ReadOnly="True" SortExpression="FechaForDisplay" />
                    <asp:BoundField DataField="HoraForDisplay" HeaderText="Hora" ReadOnly="True" SortExpression="HoraForDisplay" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47AEC5" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#47AEC5" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#081A28" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#081A28" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="FixtureNoticiaBLL"></asp:ObjectDataSource>
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
                    <label>Equipo:</label>
                    <asp:DropDownList runat="server" ID="IdEquipo" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource1" DataTextField="Nombre" DataValueField="IdEquipo">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" TypeName="EquipoBLL"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Jugadores del Equipo:</label>
                    <asp:DropDownList runat="server" ID="IDJugador" CssClass="form-control select2" Style="width: 100%;">
                    </asp:DropDownList>
                </div>
            </div>
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
                <label for="Tipo">Tipo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Tipo" id="Tipo" type="text" />
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

