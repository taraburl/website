using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class realizarpago : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static TMRespuesta RealizarPago(string nroorden, string monto, string linea)
    {
        TMConsumir objService = new TMConsumir();
        string resultado = objService.realizarPago(nroorden, monto, linea, 1);
        TMRespuesta tmrespuesta = new TMRespuesta(resultado);
        return tmrespuesta;
    }

    [WebMethod]
    public static TMRespuesta ConsultarEstado(string nroorden)
    {
        TMConsumir objService = new TMConsumir();
        string resultado = objService.consultarEstado(nroorden);
        TMRespuesta tmrespuesta = new TMRespuesta(resultado.ToString().Trim());
        return tmrespuesta;
    }
}