<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="eventos.aspx.cs" Inherits="admin_eventos_eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Eventos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE EVENTOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listEvento">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newEvento();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO EVENTO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table text-center table-striped table-bordered table-hover table-sm"
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaEvento<%# Eval("IdEvento") %>" href="javascript:actualizarEvento(<%# Eval("IdEvento")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaEvento<%# Eval("IdEvento")%>" href="javascript:eliminarEvento(<%# Eval("IdEvento") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Fotos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning" href="SubirImagenEvento.aspx?ID=<%# Eval("IdEvento")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:BoundField DataField="FechaInicioForDisplay" HeaderText="Fecha de Inicio" SortExpression="FechaInicioForDisplay" />
                    <asp:BoundField DataField="FechaFinForDisplay" HeaderText="Fecha Fin" SortExpression="FechaFinForDisplay" />
                    <asp:BoundField DataField="CantidadGrupos" HeaderText="Candidad de Grupos" SortExpression="CantidadGrupos" />
                    <asp:BoundField DataField="CantidadEquipos" HeaderText="Cantidad de Equipos" SortExpression="CantidadEquipos" />
                    <asp:BoundField DataField="CantidadJugadoresPorEquipo" HeaderText="Cantidad de Jugadores Por Equipo" SortExpression="CantidadJugadoresPorEquipo" />
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newEvento" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Evento</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Evento</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdEvento" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label for="Categoria">Categoria:</label>
                    <input class="form-control" placeholder="Insertar Categoria" id="Categoria" type="text" />
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Fecha de Inicio:</label>
                    <div class='input-group date' id='FechaInicio'>
                        <input type='text' class="form-control" placeholder="YYYY-MM-DD" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Fecha Fin:</label>
                    <div class='input-group date' id='FechaFin'>
                        <input type='text' class="form-control" placeholder="YYYY-MM-DD" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="CantEquipos">Cantidad de Equipos:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="CantEquipos" min="0" type="number" onkeypress="return isNumberKey(this);"/>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="CantGrupos">Cantidad de Grupos:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="CantGrupos" min="0" type="number" onkeypress="return isNumberKey(this);" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Maximos">Maximo de inscritos por equipo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="Maximos" min="0" type="number" onkeypress="return isNumberKey(this);"/>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarEvento()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEvento()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/eventos.js"></script>
</asp:Content>

