<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="inscripciones.aspx.cs" Inherits="admin_ecommerce_inscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Inscripiones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Inscripiones</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listInscripcion">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newInscripcion();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA INSCRIPCION
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1"
                CssClass="table text-center table-striped table-bordered table-hover table-sm " AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Consolidar">
                        <ItemTemplate>
                            <%#Eval("Estado").ToString() == "0" ?
                                    String.Format("<a class='btn btn-block btn-social-icon btn-info actualizarFilaInscripcion{0}' href='javascript:actualizarInscripcion({0})'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a>", Eval("IdInscripcion")):"" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-social-icon btn-danger eliminarFilaInscripcion<%# Eval("IdInscripcion")%>" href="javascript:eliminarInscripcion(<%# Eval("IdInscripcion") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IdInscripcion" HeaderText="Codigo" SortExpression="IdInscripcion" />
                    <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoria" SortExpression="Categoria.Nombre" />
                    <asp:BoundField DataField="Usuario.Nombre" HeaderText="Nombre" SortExpression="Usuario.Nombre" />
                    <asp:BoundField DataField="Usuario.Apellido" HeaderText="Apellido" SortExpression="Usaurio.Apellido" />
                    <asp:BoundField DataField="Inscrito" HeaderText="Inscrito" SortExpression="Inscrito" />
                    <asp:BoundField DataField="TipoPago.Nombre" HeaderText="TipoPago" SortExpression="TipoPago.Nombre" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%# Eval("Estado").ToString() == "0" ? "Guardado" : "Consolidado" %>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="InscripcionBLL"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newInscripcion" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nueva Inscripcion</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Inscripcion</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdInscripcion" />
            <div class="col-xs-12">
                <label>Seleccione Cliente:</label>
                <asp:DropDownList runat="server" CssClass="form-control select2" Style="width: 100%;" ID="IdUsuario" DataSourceID="ObjectDataSource2" DataTextField="nombre" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectUsersNormal" TypeName="UsuarioDSTableAdapters.tbl_usuariosTableAdapter"></asp:ObjectDataSource>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label>Seleccione la Categoria:</label>
                <asp:DropDownList runat="server" ID="IdCategoria" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource3" DataTextField="nombre" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectNoEliminados" TypeName="CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter"></asp:ObjectDataSource>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Precio">Precio:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                    <input class="form-control" placeholder="" id="Precio" type="text" disabled />
                </div>
            </div>
            <div class="col-xs-12">
                <label for="Nombre">Nombre del Inscrito:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre del Inscrito" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Metodo de Pago</label>
                    <asp:Repeater runat="server" ID="RepeaterFormaPago" DataSourceID="ObjectDataSource4">
                        <ItemTemplate>
                            <label class="custom-control custom-radio">
                                <input class="custom-control-input formaPago" type="radio"
                                    name="TipoPago" id="tipoPago<%# Eval("idtipoPago") %>" value="<%# Eval("idtipoPago") %>" />
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description"><%# Eval("nombre") %></span>
                            </label>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="selectNoEliminados"
                        TypeName="TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarInscripcion()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewInscripcion()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/inscipcion.js"></script>
</asp:Content>

