using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class carrito_estadisticas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Eventos";
        string Id = Request.QueryString["ID"];
        Fixture fixture = FixtureBLL.SelectById(Convert.ToInt32(Id));
        Session["evento"] = fixture.Evento.IdEvento;
        Session["equipo"] = fixture.IdEquipo;
        Session["rival"] = fixture.IdRival;
    }
}