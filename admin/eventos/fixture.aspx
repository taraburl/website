﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="fixture.aspx.cs" Inherits="admin_eventos_fixture" %>

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
                CellPadding="4" ForeColor="#333333" GridLines="None"  ShowHeaderWhenEmpty="true">
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
                    <asp:TemplateField HeaderText="Datos Oficiales">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning btn-circle" href="NoticiasFixture.aspx?ID=<%# Eval("IdEvento") %>">
                                <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                            </a>
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
                            <asp:HiddenField runat="server" ID="FixtureID" />
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
                                        <asp:ListItem Text="Suspendido" Value="Suspendido"></asp:ListItem>
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
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <label for="ScoreEquipo">Goles Equipo 1:</label>
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar-times-o"></i></span>
                                    <input class="form-control" id="ScoreEquipo" value="0" type="number" min="0" onkeypress="return isNumberKey(this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-6 col-md-6">
                                <label for="ScoreRival">Goles Equipo 2:</label>
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar-times-o"></i></span>
                                    <input class="form-control" id="ScoreRival" value="0" type="number" min="0" onkeypress="return isNumberKey(this);" />
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <label for="Puntos">Puntos del Partido</label>
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="fa fa-hand-o-right"></i></span>
                                    <input class="form-control" id="Puntos" value="0" type="number" min="0" onkeypress="return isNumberKey(this);" />
                                </div>
                            </div>
                        </div>
                        <div class="box-footer text-black">
                            <a class="btn bg-aqua-active btn-md"
                                href="javascript:nuevoEquipo()">Guardar
                            </a>
                            <a class="btn btn-default pull-right" href="javascript:cancelNuevoEquipo()">Cancelar
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
                                        <th>Goles Equipo 1</th>
                                        <th>Goles Equipo 2</th>
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
        <div id="AddArbitros" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                        <h4 class="modal-title">Agregar Arbitros</h4>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField runat="server" ID="hdnIdFixture" />
                        <div class="col-xs-12">
                            <label>Seleccione el Arbitro para el Partido</label>
                            <div class="input-group input-group-sm">
                                <asp:DropDownList runat="server" ID="Arbitro" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource2" DataTextField="Nombre" DataValueField="IdJugador">
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectByTipo" TypeName="JugadorBLL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Arbitro" Name="tipo" Type="String"></asp:Parameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <span class="input-group-btn">
                                    <a class="btn btn-info btn-flat" href="javascript:guardarArbitro()">Agregar</a>
                                </span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="box box-info">
                                <div class="box-header">
                                    <h2 class="box-title">Listado de Arbitros del Partido</h2>
                                </div>
                                <div class="box-body">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Edad</th>
                                                <th>Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tblArbitros">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer no-border">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="../scripts/fixture.js"></script>
</asp:Content>

