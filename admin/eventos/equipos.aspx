<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="equipos.aspx.cs" Inherits="admin_eventos_equipos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Equipos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE EQUIPOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listEquipo">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newEquipo();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO EQUPIPO
            </a>
        </div>
        <div class="box-body table-responsive">
        </div>
    </div>
    <div class="box box-warning" id="newEquipo" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Equipo</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Equipo</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdEquipo" />
            <div class="col-xs-12">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12">
                <h3>Listado de Jugadores</h3>
            </div>
            <div class="col-xs-12 table-responsive">
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarEquipo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEquipo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/equipo.js"></script>
</asp:Content>

