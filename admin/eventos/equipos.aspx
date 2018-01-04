<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="equipos.aspx.cs" Inherits="admin_eventos_equipos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Equipos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE EQUIPOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listEquipo">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newEquipo();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO EQUPIPO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table text-center table-striped table-bordered table-hover table-sm"
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaEquipo<%# Eval("IdEvento") %>" href="javascript:actualizarEquipo(<%# Eval("IdEquipo")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaEquipo<%# Eval("IdEvento")%>" href="javascript:eliminarEquipo(<%# Eval("IdEquipo") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Fotos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning" href="SubirImagenEquipo.aspx?ID=<%# Eval("IdEquipo")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agregar Jugadores">
                        <ItemTemplate>
                            <a class="btn btn-block btn-primary"
                                href="javascript:agregarJugador(<%# Eval("IdEquipo")%>)">
                                <i class="fa  fa-plus" aria-hidden="true"></i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Evento.Nombre" HeaderText="Evento" SortExpression="Evento.Nombre" />
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="EquipoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newEquipo" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Equipo</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Equipo</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdEquipo" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Evento en el que participa el Equipo:</label>
                    <asp:DropDownList runat="server" ID="IdEvento" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource1" DataTextField="Nombre" DataValueField="IdEvento">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarEquipo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <div class="box box-warning" id="addJugadores" style="display: none;">
        <div class="box-header with-border">
            <h3>Agregar Jugadores</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnEquipo" />
            <asp:HiddenField runat="server" ID="hdnJugadorEquipo" />
            <div class="col-xs-12 margin">
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre del Jugador" id="NombreJugador" type="text" />
                </div>
            </div>
            <div class="col-xs-12 margin">
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Posicion del Jugador" id="Posicion" type="text" />
                </div>
            </div>
            <div class="col-xs-12 margin">
                <a class="btn btn-info btn-lg" href="javascript:nuevoJugador()">Guardar</a>
            </div>
            <div class="col-xs-12">
                <h3>Listado de Jugadores</h3>
            </div>
            <div class="col-xs-12">
                <table class="table-responsive table-bordered table-striped" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Editar</th>
                            <th>ELiminar</th>
                            <th>Nombre</th>
                            <th>Posicion</th>
                        </tr>
                    </thead>
                    <tbody id="body">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/equipo.js"></script>
</asp:Content>

