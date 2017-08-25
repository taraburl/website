using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Inventario_Productos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Producto InsertarProducto(string descripcion, string nombre, string precio, string medida, string idcategoria)
    {
        Producto objProducto = ProductoBLL.InsertWithReturn(descripcion, nombre,precio, medida, idcategoria);
        return objProducto;
    }
    [WebMethod]
    public static Producto TraerProducto(int idProducto)
    {
        Producto objProducto = ProductoBLL.SelectById(idProducto);
        return objProducto;
    }
    [WebMethod]
    public static Producto ActualizarProducto(string descripcion, string nombre, string precio, string medida, string idcategoria, string id)
    {
        ProductoBLL.Update(descripcion, nombre, precio, medida, idcategoria,id);
        Producto objProducto = ProductoBLL.SelectById(Convert.ToInt32(id));
        return objProducto;
    }
    [WebMethod]
    public static int EliminarProducto(int idProducto)
    {
        try
        {
            ProductoBLL.Delete(idProducto);
            return idProducto;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}