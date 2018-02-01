<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Videos.aspx.cs" Inherits="admin_Galeria_Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Videos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE VIDEOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listVideo">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newVideo();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO VIDEO
            </a>
        </div>
        <div class="box-body table-responsive">
            <asp:GridView runat="server" ID="GridView1" DataSourceID="ObjectDataSource1"
                AutoGenerateColumns="False" DataKeyNames="id"
                CssClass="table text-center table-striped table-bordered table-hover table-sm " AllowCustomPaging="True" AllowPaging="True"  ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="url" HeaderText="URL" SortExpression="url" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                    <asp:BoundField DataField="modulo" HeaderText="Modulo" SortExpression="modulo" />
                    <asp:TemplateField HeaderText="Actualizar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-info btn-circle actualizarFilaVideo<%# Eval("id") %>" href="javascript:actualizarVideo(<%# Eval("id")%>)">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a class="btn btn-block btn-danger btn-circle eliminarFilaVideo<%# Eval("id")%>" href="javascript:eliminarVideo(<%# Eval("id") %>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i></a>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectNoEliminados" TypeName="VideoDSTableAdapters.tbl_videoTableAdapter"></asp:ObjectDataSource>
        </div>
    </div>
    <div class="box box-warning" id="newVideo" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Video</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Video</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdVideo" />
            <div class="col-xs-12">
                <label for="URL">URL:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-file-video-o"></i></span>
                    <input class="form-control" placeholder="URL Video" id="URL" type="text" />
                </div>
            </div>
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
                    <label>Descripción:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarVideo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelnewVideo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/video.js"></script>
</asp:Content>
