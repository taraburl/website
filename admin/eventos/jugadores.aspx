<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="jugadores.aspx.cs" Inherits="admin_eventos_jugadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Jugadores del Equipo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Repeater runat="server" ID="RepeaterTitle" DataSourceID="ObjectDataSource2">
        <ItemTemplate>
            <h1>LISTADO DE JUGADORES: <%# Eval("Nombre") %></h1>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectById" TypeName="EquipoBLL">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listJugador">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:agregarJugador();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO JUGADOR
            </a>
            <a class="btn btn-default pull-right btn-lg" href="equipos.aspx"><i class="fa fa-times" aria-hidden="true"></i>Atras</a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView
                runat="server"
                ID="GridView1"
                DataSourceID="ObjectDataSource1"
                AllowPaging="True"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered table-hover table-sm"
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Posicion" HeaderText="Posicion" SortExpression="Posicion" />
                    <asp:BoundField DataField="NumeroCamiseta" HeaderText="Numero de Camiseta" SortExpression="NumeroCamiseta"/>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaJugadorEquipo<%# Eval("IdJugadorEquipo") %>" href="javascript:actualizarJugadorEquipo(<%# Eval("IdJugadorEquipo")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaJugadorEquipo<%# Eval("IdJugadorEquipo")%>" href="javascript:eliminarJugadorEquipo(<%# Eval("IdJugadorEquipo") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Foto">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning btn-circle" href="SubirImagenJugador.aspx?ID=<%# Eval("IdJugadorEquipo")%>&Equipo=<%# Eval("IdEquipo") %>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectByEquipo" TypeName="JugadorEquipoBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="addJugadores" style="display: none;">
        <div class="box-header with-border">
            <h3>Agregar Jugadores</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnEquipo" />
            <asp:HiddenField runat="server" ID="hdnJugadorEquipo" />
            <div class="col-xs-12 col-md-6 col-lg-16">
                <label for="NombreJugador">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-trophy"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre del Jugador" id="NombreJugador" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-16">
                <label for="Posicion">Posicion:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-chevron-circle-up"></i></span>
                    <input class="form-control" placeholder="Insertar Posicion del Jugador" id="Posicion" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-16">
                <label for="Posicion">Numero de Camiseta:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-shirtsinbulk"></i></span>
                    <input class="form-control" placeholder="Insertar Numero de Camiseta" id="NroCamiseta" type="text" onkeypress="return isNumberKey(this);"/>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-16">
                <label for="Posicion">Tipo:</label>
                <asp:DropDownList runat="server" ID="Tipo" CssClass="form-control select2" Style="width: 100%;">
                    <asp:ListItem Text="Titular" Value="Titular"></asp:ListItem>
                    <asp:ListItem Text="Suplente" Value="Suplente"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-info btn-lg" href="javascript:nuevoJugador()">Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/equipo.js"></script>
</asp:Content>

