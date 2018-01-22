using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_ecommerce_inscripciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static int EliminarInscripcion(int idInscripcion)
    {
        try
        {
            InscripcionBLL.Delete(idInscripcion);
            return idInscripcion;
        }
        catch (Exception)
        {
            return -1;
        }

    }
    [WebMethod]
    public static Inscripcion ActualizarInscripcion(string idInscripcion)
    {
        InscripcionBLL.Update("1", idInscripcion);
        Inscripcion objInscripcion = InscripcionBLL.SelectById(Convert.ToInt32(idInscripcion));
        return objInscripcion;
    }
}