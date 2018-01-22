<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SubirFotoSponsor.aspx.cs" Inherits="admin_SubirFotoSponsor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Subir Foto Sponsors</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h2>Subir foto para el Sponsor</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-primary">
        <div class="box-header with-border" id="new">
            <h3>Seleccionar Imagen</h3>
        </div>
        <div class="box-body">
            <div class="col-xs-12">
                <div class="form-group">
                    <label for="uploader">Seleccione la imagen del Sponsor:</label>
                    <asp:FileUpload ID="uploader" runat="server" />
                </div>
                <p class="help-block">
                    La imagen a seleccionar debe ser con <strong>fondo transparte</strong> las dimensiones de la imagen deben ser de 
                      <strong>3171x1652 (recomendable)</strong>, tiene que tomar en cuenta que la imagen tenga la misma forma que las anteriores para que se vea bien en el sector de sponsors de la pagina.<br />
                    La imagen se mostrara sobre un fondo en el cual estara visible a los usuarios.
                </p>
                <div class="form-group">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="uploader" ErrorMessage="Debe seleccionar una imagen"
                        ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-12 col-lg-3 col-md-6" style="background-image: url('/images/footer.jpg'); z-index: 0; background-position: center center;">
                    <asp:Image ImageUrl="~/images/sponsor.png" CssClass="img-responsive" ID="imgPrincipal" runat="server" AlternateText="imagen-sponsor" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <asp:LinkButton ID="btnGuardarImagen" Text="Guardar Imagen" runat="server" CssClass="btn btn-success btn-lg" OnClick="btnGuardarImagen_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i>GUARDAR</asp:LinkButton>
            <a ID="btnCancelar" class="btn btn-default pull-right btn-lg" href="Sponsors.aspx"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="scripts/sponsors.js"></script>
</asp:Content>

