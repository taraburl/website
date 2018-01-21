<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SubirImagenEvento.aspx.cs" Inherits="admin_SubirImagenEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Subir Logo del Evento</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Subir Logo</h2>
    <div class="box box-primary">
        <div class="box-header with-border" id="new">
            <h3>Seleccionar Imagen</h3>
        </div>
        <div class="box-body">
            <div class="col-xs-12">
                <div class="form-group">
                    <label for="uploader">Seleccione la imagen para el evento:</label>
                    <asp:fileupload id="uploader" runat="server" />
                </div>
                <div class="form-group">
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server"
                        controltovalidate="uploader" errormessage="Debe seleccionar una imagen"
                        forecolor="Red" font-bold="true"></asp:requiredfieldvalidator>
                </div>
                <div class="col-xs-12 col-lg-3 col-md-6">
                    <asp:image imageurl="/images/producto.png" cssclass="img-responsive" id="imgPrincipal" runat="server" alternatetext="imagen-evento" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <asp:linkbutton id="btnGuardarImagen" text="Guardar Imagen" runat="server" cssclass="btn btn-success btn-lg" onclick="btnGuardarImagen_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i>GUARDAR</asp:linkbutton>
            <a id="btnCancelar" class="btn btn-default pull-right btn-lg" href="eventos.aspx"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/eventos.js"></script>
</asp:Content>


