<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="grupo.aspx.cs" Inherits="admin_eventos_grupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Grupos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE GRUPOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listGrupo">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newGrupo();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO GRUPO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm"
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Evento.Nombre" HeaderText="Evento" SortExpression="Evento.Nombre" />

                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaGrupo<%# Eval("IdGrupo") %>" href="javascript:actualizarGrupo(<%# Eval("IdGrupo")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaGrupo<%# Eval("IdGrupo")%>" href="javascript:eliminarGrupo(<%# Eval("IdGrupo") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agregar Equipos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-primary btn-circle"
                                href="javascript:agregarEquipo(<%# Eval("IdGrupo")%>)">
                                <i class="fa  fa-plus" aria-hidden="true"></i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="GrupoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newGrupo" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Grupo</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Grupo</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdGrupo" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Seleccione el equipo:</label>
                    <asp:DropDownList runat="server" ID="IdEvento" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource1" DataTextField="Nombre" DataValueField="IdEvento">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="box-footer">
                <a class="btn btn-success btn-lg" href="javascript:guardarGrupo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
                <a class="btn btn-default pull-right btn-lg" href="javascript:cancelGrupo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
            </div>
        </div>
        <div class="box box-danger" id="newEquipo" style="display: none;">
            <div class="box-header with-border">
                <h3>Listado de Equipos del Grupo</h3>
            </div>
            <div class="box-body">
                <div class="col-xs-10">
                    <div class="form-group">
                        <label>Equipo:</label>
                        <asp:DropDownList runat="server" ID="IdEquipo" CssClass="form-control select2" Style="width: 100%;">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-2">
                    <a class="btn btn-success btn-app" href="javascript:agregarEquipo()">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                        AGREGAR
                    </a>
                </div>
                <div class="col-xs-12 table-responsive">
                </div>
            </div>
            <div class="box-footer">
                <a class="btn btn-default pull-right btn-lg" href="javascript:cancelGrupo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
            </div>
        </div>
        <script src="../scripts/grupo.js"></script>
    </div>
    <div id="addEquipo" style="display: none;">
        <div class="box box-success">
            <div class="box-header with-border">
                <div class="pull-right box-tools">
                    <a class="btn btn-default btn-sm" href="javascript:cancelEquipo()" data-toggle="tooltip" title="Cancelar"><i class="fa fa-times" aria-hidden="true"></i></a>
                </div>
                <h3 class="box-title">Agregar Equipos</h3>
            </div>
            <div class="box-body">
                <asp:HiddenField runat="server" ID="hdnEquipo" />
                <div class="col-xs-12">
                    <label>Seleccione el Equipo para Agregar al Equipo</label>
                    <div class="input-group input-group-sm">
                        <asp:DropDownList runat="server" ID="Equipo" CssClass="form-control select2" Style="width: 100%;">
                        </asp:DropDownList>
                        <span class="input-group-btn">
                            <a class="btn btn-info btn-flat" href="javascript:nuevoEquipo()">Agregar</a>
                        </span>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Listado de Equipos del Grupo</h3>
                        </div>
                        <div class="box-body">
                            <table class="table-responsive table-bordered table-striped" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody id="body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

