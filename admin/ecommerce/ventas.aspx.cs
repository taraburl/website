using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_ecommerce_ventas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static OrdenCompra ActualizarVenta(string idVenta)
    {
        OrdenCompraBLL.UpdateOrden("3", idVenta);
        OrdenCompra objOrdenCompra = OrdenCompraBLL.SelectById(Convert.ToInt32(idVenta));
        return objOrdenCompra;
    }
}