using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_academia_categorias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static CategoriaAcademia InsertarCategoria(string nombre, string descripcion, string precio)
    {
        CategoriaAcademia objCategoria = CategoriaAcademiaBLL.InsertWithReturn(nombre, descripcion, precio);
        return objCategoria;
    }
    [WebMethod]
    public static CategoriaAcademia TraerCategoria(int idCategoria)
    {
        CategoriaAcademia objCategoria = CategoriaAcademiaBLL.SelectById(idCategoria);
        return objCategoria;
    }
    [WebMethod]
    public static CategoriaAcademia ActualizarCategoria(string nombre, string descripcion, string precio, string id)
    {
        CategoriaAcademiaBLL.Update(nombre, descripcion, precio, Convert.ToInt32(id));
        CategoriaAcademia objCategoria = CategoriaAcademiaBLL.SelectById(Convert.ToInt32(id));
        return objCategoria;
    }
    [WebMethod]
    public static int EliminarCategoria(int idCategoria)
    {
        try
        {
            CategoriaAcademiaBLL.Delete(idCategoria);
            return idCategoria;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}