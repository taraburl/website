<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="inscripciones.aspx.cs" Inherits="admin_ecommerce_inscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Inscripiones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Inscripiones</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listCategoria">
        <div class="box-header with-border">
            <!-- <a class="btn btn-success btn-lg" href="javascript:newCategoria();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA CATEGORIA
            </a>-->
        </div>
        <div class="box-body table-responsive">
            <asp:gridview runat="server" id="GridView1"
                cssclass="table text-center table-striped table-bordered table-hover table-sm " autogeneratecolumns="False" datasourceid="ObjectDataSource1">
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
                    <asp:BoundField DataField="Inscrito" HeaderText="Inscrito" SortExpression="Inscrito"/>
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
            </asp:gridview>
            <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="SelectAll" typename="InscripcionBLL"></asp:objectdatasource>
        </div>
    </div>
    <script src="../scripts/inscipcion.js"></script>
</asp:Content>

