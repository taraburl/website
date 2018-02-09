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
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO EQUIPO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1"
                runat="server"
                DataSourceID="ObjectDataSource2"
                AllowPaging="True"
                AllowSorting="False"
                AutoGenerateColumns="False"
                DataKeyNames="IdEquipo"
                CssClass="table table-striped table-bordered table-hover table-sm"
                CellPadding="4" ForeColor="#333333" GridLines="None"
                 ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Evento.Nombre" HeaderText="Evento" SortExpression="Evento.Nombre" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaEquipo<%# Eval("IdEquipo") %>" href="javascript:actualizarEquipo(<%# Eval("IdEquipo")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaEquipo<%# Eval("IdEquipo")%>" href="javascript:eliminarEquipo(<%# Eval("IdEquipo") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Fotos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning btn-circle" href="SubirImagenEquipo.aspx?ID=<%# Eval("IdEquipo")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agregar Jugadores">
                        <ItemTemplate>
                            <a class="btn btn-block btn-primary btn-circle"
                                href="jugadores.aspx?ID=<%# Eval("IdEquipo")%>">
                                <i class="fa  fa-plus" aria-hidden="true"></i>
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
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" maxlength="25" />
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
           <%-- <div class="col-xs-12">
                <div class="form-group">
                    <label for="Color">Seleccione el color de la camiseta del Equipo:</label>
                    <div class="input-group ">
                        <input id="Color" class="jscolor form-control" value="ab2567" />
                    </div>
                </div>
            </div>--%>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarEquipo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <div id="addJugadores" style="display: none;">
        <div class="col-xs-12 col-lg-6 col-md-6">
        </div>
        <div class="col-xs-12 col-lg-6 col-md-6">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3>Listado de Jugadores</h3>
                </div>
                <div class="box-body">
                    <table class="table-responsive table-bordered table-striped" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Posicion</th>
                                <th>Editar</th>
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
    <script src="../scripts/equipo.js"></script>
</asp:Content>

