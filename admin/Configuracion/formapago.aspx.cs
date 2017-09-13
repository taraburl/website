using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
public partial class admin_Configuracion_formapago : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static TipoPago InsertarTipoPago(string nombre)
    {
        TipoPago objTipoPago = TipoPagoBLL.InsertWithReturn(nombre);
        return objTipoPago;
    }
    [WebMethod]
    public static TipoPago TraerTipoPago(int idTipoPago)
    {
        TipoPago objTipoPago = TipoPagoBLL.SelectById(idTipoPago);
        return objTipoPago;
    }
    [WebMethod]
    public static TipoPago ActualizarTipoPago(string nombre, string id)
    {
        TipoPagoBLL.Update(nombre, Convert.ToInt32(id));
        TipoPago objTipoPago = TipoPagoBLL.SelectById(Convert.ToInt32(id));
        return objTipoPago;
    }
    [WebMethod]
    public static int EliminarTipoPago(int idTipoPago)
    {
        try
        {
            TipoPagoBLL.Delete(idTipoPago);
            return idTipoPago;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}