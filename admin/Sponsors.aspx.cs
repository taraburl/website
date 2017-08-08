using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Sponsors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Sponsor InsertarSponsor(string nombre, string modulo)
    {
        Sponsor objSponsor = SponsorsBLL.InsertWithReturn(nombre, modulo, "S/I", 0);
        return objSponsor;
    }
    [WebMethod]
    public static Sponsor TraerSponsor(int idSponsor)
    {
        Sponsor objSponsor = SponsorsBLL.SelectById(idSponsor);
        return objSponsor;
    }
    [WebMethod]
    public static Sponsor ActualizarSponsor(string nombre, string modulo, string id)
    {
        SponsorsBLL.Update(nombre, modulo, Convert.ToInt32(id));
        Sponsor obSponsor = SponsorsBLL.SelectById(Convert.ToInt32(id));
        return obSponsor;
    }
    [WebMethod]
    public static int EliminarSponsor(int idSponsor)
    {
        try
        {
            SponsorsBLL.Delete(idSponsor);
            return idSponsor;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}