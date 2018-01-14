<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="fixture.aspx.cs" Inherits="admin_eventos_fixture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA- Fixture</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>FIXTURE DE EVENTOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listFixture">
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1"
                runat="server"
                DataSourceID="ObjectDataSource1"
                AllowPaging="True"
                AllowSorting="False"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered table-hover table-sm"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:BoundField DataField="FechaInicioForDisplay" HeaderText="Fecha Fin" ReadOnly="True" SortExpression="FechaInicioForDisplay" />
                    <asp:BoundField DataField="FechaFinForDisplay" HeaderText="Fecha Inicio" ReadOnly="True" SortExpression="FechaFinForDisplay" />
                    <asp:TemplateField HeaderText="Gestionar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle" href="javascript:gestionarFixture(<%# Eval("IdEvento")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div id="addFixture" style="display: none;">
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3>Gestionar Fixture</h3>
                <div class="box-tools pull-right">
                    <a class="btn btn-box-tool"
                        href="javascript:cancelFixture()">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="box-body">
                <div class="col-xs-12">
                    <div class="form-group">
                        <label>Seleccione el Grupo del que desea gestionar los partidos</label>
                        <asp:DropDownList runat="server" ID="SelectGrupo" CssClass="form-control select2" Style="width: 100%;">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="box box-info collapsed-box">
                        <div class="box-header">
                            <i class="fa fa-calendar"></i>
                            <h3 class="box-title">Agregar Partido</h3>
                            <div class="pull-right box-tools">
                                <button type="button"
                                    id="cerrarPanel"
                                    class="btn btn-info btn-sm"
                                    data-widget="collapse">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <asp:HiddenField runat="server" ID="FixtureID"/>
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <div class="form-group">
                                    <label>Seleccione Equipo</label>
                                    <asp:DropDownList runat="server" ID="EquipoRival1" CssClass="form-control select2" Style="width: 100%;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <div class="form-group">
                                    <label>Seleccione Equipo</label>
                                    <asp:DropDownList runat="server" ID="EquipoRival2" CssClass="form-control select2" Style="width: 100%;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <div class="form-group">
                                    <label>Seleccione Cancha</label>
                                    <asp:DropDownList runat="server" ID="Cancha" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource3" DataTextField="Nombre" DataValueField="IdCancha">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectAll" TypeName="CanchaBLL"></asp:ObjectDataSource>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <div class="form-group">
                                    <label>Estado del Partido</label>
                                    <asp:DropDownList runat="server" ID="Estado" CssClass="form-control select2" Style="width: 100%;">
                                        <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
                                        <asp:ListItem Text="En Curso" Value="En Curso"></asp:ListItem>
                                        <asp:ListItem Text="Finalizado" Value="Finalizado"></asp:ListItem>
                                        <asp:ListItem Text="Cancelado" Value="Cancelado"></asp:ListItem>
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
                        </div>
                        <div class="box-footer text-black">
                            <a class="btn bg-aqua-active btn-md"
                                href="javascript:nuevoEquipo()">Guardar
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3>Listado de Partidos</h3>
                        </div>
                        <div class="box-body">
                            <table class="table-responsive table-bordered table-striped" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <th>Equipo 1</th>
                                        <th>Equipo 2</th>
                                        <th>Cancha</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Estado</th>
                                        <th>Agregar Arbitros</th>
                                        <th>Editar Partido</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody id="partidos">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../scripts/fixture.js"></script>
</asp:Content>

