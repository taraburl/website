using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
public partial class admin_Inventario_Inventario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Inventario InsertarInventario(string idUsuario, string tipo, string glosa)
    {
        Inventario objInventario = InventarioBLL.InsertWithReturn(idUsuario, tipo, glosa);
        return objInventario;
    }
    [WebMethod]
    public static Inventario TraerInventario(int idInventario)
    {
        Inventario objInventario = InventarioBLL.SelectById(idInventario);
        return objInventario;
    }
    [WebMethod]
    public static Inventario ActualizarProducto(string idUsuario, string tipo, string glosa, string id)
    {
        InventarioBLL.Update(idUsuario, tipo, glosa, id);
        Inventario objInventario = InventarioBLL.SelectById(Convert.ToInt32(id));
        return objInventario;
    }
    [WebMethod]
    public static int EliminarInventario(int idInventario)
    {
        try
        {
            InventarioBLL.Delete(idInventario);
            return idInventario;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}