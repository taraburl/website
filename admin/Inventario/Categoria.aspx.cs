using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Inventario_Categoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Categoria InsertarCategoria(string nombre)
    {
        Categoria objCategoria = CategoriaBLL.InsertWithReturn(nombre);
        return objCategoria;
    }
    [WebMethod]
    public static Categoria TraerCategoria(int idCategoria)
    {
        Categoria objCategoria = CategoriaBLL.SelectById(idCategoria);
        return objCategoria;
    }
    [WebMethod]
    public static Categoria ActualizarCategoria(string nombre, string id)
    {
        CategoriaBLL.Update(nombre, Convert.ToInt32(id));
        Categoria objCategoria = CategoriaBLL.SelectById(Convert.ToInt32(id));
        return objCategoria;
    }
    [WebMethod]
    public static int EliminarCategoria(int idCategoria)
    {
        try
        {
            CategoriaBLL.Delete(idCategoria);
            return idCategoria;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}