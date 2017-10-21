using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


public partial class carrito_Inscripciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Inscripcion InsertarInscripcion(string idCategoria,
        string idUsuario, string idTipoPago, string estado, string total,
        string inscrito)
    {
        Inscripcion objInscripcion = InscripcionBLL.InsertWithReturn(idCategoria,
            idUsuario, idTipoPago, estado, total, inscrito);
        return objInscripcion;
    }
}