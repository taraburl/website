<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Imagenes.aspx.cs" Inherits="admin_Galeria_Imagenes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Imágenes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE IMAGENES</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listimages">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newImagen();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA IMAGEN
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table text-center table-striped table-bordered table-hover table-sm " 
                CellPadding="4" ForeColor="#333333" GridLines="None"
                 AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info actualizarFilaImagen<%# Eval("id") %>" href="javascript:actualizarImagen(<%# Eval("id")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger eliminarFilaImagen<%# Eval("id")%>" href="javascript:eliminarImagen(<%# Eval("id") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subir Foto">
                        <ItemTemplate>
                            <a class="btn btn-block btn-warning" href="SubirFotoImagen.aspx?ID=<%# Eval("id")%>">
                                <i class="fa  fa-file-photo-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <img class="profile-user-img img-responsive" alt="SEA-IMG" src="/images/galeria/<%# Eval("id")%>.jpg"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="modulo" HeaderText="Modulo" SortExpression="modulo" />
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectNoEliminados" TypeName="ImagenDSTableAdapters.tbl_imagenesTableAdapter"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newImage" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nueva Imagen</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Imagen</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdImagen" />
            <!--<div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>-->
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Modulo:</label>
                    <select class="form-control select2" id="Modulo" style="width: 100%;">
                        <option value="Eventos" selected="selected">Eventos</option>
                        <option value="Marketing Deportivo">Marketing Deportivo</option>
                        <option value="Club Atlético Juniors">Club Atlético Juniors</option>
                        <option value="Academia de Fútbol">Academia de Fútbol</option>
                        <option value="Complejo Deportivo">Complejo Deportivo</option>
                        <option value="Students & Athletics">Students & Athletics</option>
                        <option value="Sea TV">Sea TV</option>
                    </select>
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
            <a class="btn btn-success btn-lg" href="javascript:guardarImagen()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewImagen()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/imagenes.js"></script>
</asp:Content>

