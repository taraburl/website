﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_eventos_SubirImagenEquipo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        imgPrincipal.ImageUrl = "~/images/equipos/" + Request.QueryString["ID"] + ".png";
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("equipos.aspx");
    }
    protected void btnGuardarImagen_Click(object sender, EventArgs e)
    {
        if (!uploader.HasFile)
        {
            return;
        }
        int id = Convert.ToInt32(Request.QueryString["ID"]);
        string pathSitio = Server.MapPath("~/");
        string nombreArchivo = uploader.FileName;
        string extension = nombreArchivo.Substring(nombreArchivo.IndexOf('.') + 1);
        uploader.SaveAs(pathSitio + "images/equipos/" + id + ".png");
        Response.Redirect("equipos.aspx");
    }
}