<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="canchas.aspx.cs" Inherits="admin_Configuracion_canchas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Canchas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Canchas</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listCancha">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newCancha();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVA CANCHA
            </a>
        </div>
        <div class="box-body table-responsive">
        </div>
    </div>
    <div class="box box-warning" id="newCancha" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nueva Cancha</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Cancha</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdJugador" />
            <div class="col-xs-12">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
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
            <a class="btn btn-success btn-lg" href="javascript:guardarCancha()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelCancha()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/cancha.js"></script>
</asp:Content>

