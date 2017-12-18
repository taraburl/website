<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="grupo.aspx.cs" Inherits="admin_eventos_grupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Grupos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE EVENTOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listGrupo">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newGrupo();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO GRUPO
            </a>
        </div>
        <div class="box-body table-responsive">
        </div>
    </div>
    <div class="box box-warning" id="newGrupo" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Grupo</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Grupo</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdGrupo" />
            <div class="col-xs-12">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarGrupo()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelGrupo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <div class="box box-danger" id="newEquipo" style="display: none;">
        <div class="box-header with-border">
            <h3>Listado de Equipos del Grupo</h3>
        </div>
        <div class="box-body">
            <div class="col-xs-10">
                <div class="form-group">
                    <label>Equipo:</label>
                    <asp:DropDownList runat="server" ID="IdEquipo" CssClass="form-control select2" Style="width: 100%;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-2">
                <a class="btn btn-success btn-app" href="javascript:agregarEquipo()">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    AGREGAR
                </a>
            </div>
            <div class="col-xs-12 table-responsive">
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelGrupo()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/grupo.js"></script>
</asp:Content>

