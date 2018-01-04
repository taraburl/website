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
            <asp:gridview id="GridView1" runat="server"
                cssclass="table text-center table-striped table-bordered table-hover table-sm"
                autogeneratecolumns="False" datasourceid="ObjectDataSource1">
                 <Columns>
                     <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaNoticia<%# Eval("IdNoticia") %>" href="javascript:actualizarNoticia(<%# Eval("IdNoticia")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaNoticia<%# Eval("IdNoticia")%>" href="javascript:eliminarNoticia(<%# Eval("IdNoticia") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Fotos">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning" href="SubirImagenNoticia.aspx?ID=<%# Eval("IdNoticia")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                     <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                     <asp:BoundField DataField="FechaForDisplay" HeaderText="Fecha" SortExpression="FechaForDisplay" />
                 </Columns>
                <editrowstyle backcolor="#2461BF" />
            <footerstyle backcolor="#47AEC5" font-bold="True" forecolor="White" />
            <headerstyle backcolor="#47AEC5" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#47AEC5" forecolor="White" horizontalalign="Center" />
            <rowstyle backcolor="#EFF3FB" />
            <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
            <sortedascendingcellstyle backcolor="#F5F7FB" />
            <sortedascendingheaderstyle backcolor="#081A28" />
            <sorteddescendingcellstyle backcolor="#E9EBEF" />
            <sorteddescendingheaderstyle backcolor="#081A28" />
                     </asp:gridview>
            <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="SelectAll" typename="NoticiaBLL"></asp:objectdatasource>

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
            <asp:hiddenfield runat="server" id="hdnIdNoticia" />
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

