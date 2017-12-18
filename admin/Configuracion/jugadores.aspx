<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="jugadores.aspx.cs" Inherits="admin_Configuracion_jugadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SEA - Gestionar Jugadores/Arbitros</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>Listado de Jugadores/Arbitros</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box box-info" id="listJugadores">
        <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newJugador();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO JUGADOR/ARBITRO
            </a>
        </div>
        <div class="box-body table-responsive">
        </div>
    </div>
    <div class="box box-warning" id="newJugador" style="display: none;">
        <div class="box-header with-border" id="new">
            <h3>Nuevo Jugador/Arbrito</h3>
        </div>
        <div class="box-header with-border" id="upd">
            <h3>Actualizar Jugador/Arbrito</h3>
        </div>
        <div class="box-body">
            <asp:HiddenField runat="server" ID="hdnIdJugador" />
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Nombre">Nombre Completo:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-circle-thin"></i></span>
                    <input class="form-control" placeholder="Insertar Nombre Completo" id="Nombre" type="text" />
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <label for="TipoUser">Tipo:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                    <asp:DropDownList runat="server" ID="Tipo" CssClass="form-control">
                        <asp:ListItem Text="Jugador" Value="1" />
                        <asp:ListItem Text="Arbitro" Value="0" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6 col-md-6">
                <label for="Edad">Edad:</label>
                <div class=" input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar-times-o"></i></span>
                    <input class="form-control" id="Edad" type="number" />
                </div>
            </div>
        </div>
        <div class="box-footer">
            <a class="btn btn-success btn-lg" href="javascript:guardarJugador()"><i class="fa fa-floppy-o" aria-hidden="true"></i>Guardar</a>
            <a class="btn btn-default pull-right btn-lg" href="javascript:cancelJugador()"><i class="fa fa-times" aria-hidden="true"></i>Cancelar</a>
        </div>
    </div>
    <script src="../scripts/jugadores.js"></script>
</asp:Content>

