﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Galeria_SubirFotoImagen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        imgPrincipal.ImageUrl = "~/images/galeria/" + Request.QueryString["ID"] + ".jpg";
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Imagenes.aspx");
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
        uploader.SaveAs(pathSitio + "images/galeria/" + id + ".jpg");
        Response.Redirect("Imagenes.aspx");
    }
}