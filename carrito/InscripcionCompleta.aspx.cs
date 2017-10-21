using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class carrito_InscripionCompleta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String form = Request.QueryString["Nro"];
        COD.Text = form;
    }
}