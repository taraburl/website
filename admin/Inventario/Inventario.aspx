<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Inventario.aspx.cs" Inherits="admin_Inventario_Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>SEA - Gestionar Inventario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1>LISTADO DE INVENTARIOS</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="box box-info" id="listinventario">
         <div class="box-header with-border">
            <a class="btn btn-success btn-lg" href="javascript:newInventario();">
                <i class="fa fa-plus" aria-hidden="true"></i>NUEVO INVENTARIO
            </a>
        </div>
        <div class="box-body table-responsive">

        </div>
     </div>
</asp:Content>

