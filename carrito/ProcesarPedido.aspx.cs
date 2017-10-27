using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class carrito_ProcesarPedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static OrdenCompra InsertarOrdenCompra(string estado,
        string idUsuario, string idTipoPago, string total)
    {
        OrdenCompra objOrdenCompra = OrdenCompraBLL.InsertWithReturn
            (estado, idTipoPago, idUsuario, total);
        return objOrdenCompra;
    }
    [WebMethod]
    public static Carrito InsertarCarrito(string idOrdenCompra, string idProducto, string cantidadProducto,
        string precio, string subTotal)
    {
        Carrito objCarrito = CarritoBLL.InsertWithReturn(idOrdenCompra, idProducto, cantidadProducto,
            precio, subTotal);
        Producto objProducto = ProductoBLL.SelectById(Convert.ToInt32(idProducto));
        int stock = objProducto.Stock;
        stock = stock - Convert.ToInt32(cantidadProducto);
        ProductoBLL.UpdateStock(idProducto, stock);
        return objCarrito;
    }
}