using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class carrito_ProcesoDePago : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Academia de Fútbol";
        String form = Request.QueryString["Total"];
        Total.Value = form;
        String form2 = Request.QueryString["Nro"];
        OrdenNro.Value = form2;
    }
}