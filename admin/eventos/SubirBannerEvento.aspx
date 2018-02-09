<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SubirBannerEvento.aspx.cs" Inherits="admin_eventos_SubirBannerEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Subir Banner Publicitario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Subir Banner Publicitario</h2>
    <div class="box box-primary">
        <div class="box-header with-border" id="new">
            <h3>Seleccionar Imagen</h3>
        </div>
        <div class="box-body">
            <div class="col-xs-12">
                <div class="form-group">
                    <label for="uploader">Seleccione la imagen para el banner publicitario del evento:</label>
                    <asp:FileUpload ID="uploader" runat="server" />
                </div>
                <div class="form-group">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="uploader" ErrorMessage="Debe seleccionar una imagen"
                        ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-12 col-lg-3 col-md-6">
                    <asp:Image ImageUrl="/images/producto.png" CssClass="img-responsive" ID="imgPrincipal" runat="server" AlternateText="imagen-evento" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <asp:LinkButton ID="btnGuardarImagen" Text="Guardar Imagen" runat="server" CssClass="btn btn-success btn-lg" OnClick="btnGuardarImagen_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i>GUARDAR</asp:LinkButton>
            <a id="btnCancelar" class="btn btn-default pull-right btn-lg" href="eventos.aspx"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/eventos.js"></script>
</asp:Content>

