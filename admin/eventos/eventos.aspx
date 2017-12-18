<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="eventos.aspx.cs" Inherits="admin_eventos_eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Eventos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>LISTADO DE EVENTOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listEvento">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newJugador();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO EVENTO
            </a>
        </div>
        <div class="box-body table-responsive">
        </div>
    </div>
    <div class="box box-warning" id="newEvento" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Evento</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Evento</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdEvento" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label for="Categoria">Categoria:</label>
                    <input class="form-control" placeholder="Insertar Categoria" id="Categoria" type="text" />
                </div>
            </div>
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea class="form-control" id="Descripcion" rows="3" placeholder="Descripcion..."></textarea>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Fecha de Inicio:</label>
                    <div class='input-group date' id='FechaInicio'>
                        <input type='text' class="form-control" placeholder="YYYY-MM-DD" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <div class="form-group">
                    <label>Fecha Fin:</label>
                    <div class='input-group date' id='FechaFin'>
                        <input type='text' class="form-control" placeholder="YYYY-MM-DD" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="CantEquipos">Cantidad de Equipos:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="CantEquipos" type="number" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="CantGrupos">Cantidad de Grupos:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="CantGrupos" type="number" />
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Maximos">Maximo de inscritos por equipo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" id="Maximos" type="number" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarEvento()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelEvento()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/eventos.js"></script>
</asp:Content>

