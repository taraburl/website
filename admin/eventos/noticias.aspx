<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="noticias.aspx.cs" Inherits="admin_eventos_noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Noticias</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE NOTICIAS</h1>
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
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"  ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                    <asp:BoundField DataField="Evento.Nombre" HeaderText="Evento" SortExpression="Evento.Nombre" />
                    <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" SortExpression="FechaForDisplay" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaNoticia<%# Eval("IdNoticia") %>" href="javascript:actualizarNoticia(<%# Eval("IdNoticia")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaNoticia<%# Eval("IdNoticia")%>" href="javascript:eliminarNoticia(<%# Eval("IdNoticia") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Foto">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning btn-circle" href="SubirImagenNoticia.aspx?ID=<%# Eval("IdNoticia")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="NoticiaBLL"></asp:ObjectDataSource>

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
                <label for="Titulo">Titulo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Titulo" id="Titulo" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Fecha:</label>
                    <div class='input-group date' id='Fecha'>
                        <input type='text' class="form-control" placeholder="YYYY-MM-DD" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Evento:</label>
                    <asp:DropDownList runat="server" ID="IdEvento" CssClass="form-control select2" Style="width: 100%;" DataSourceID="ObjectDataSource2" DataTextField="Nombre" DataValueField="IdEvento">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" TypeName="EventoBLL"></asp:ObjectDataSource>
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
    <script src="../scripts/noticias.js"></script>
</asp:Content>

