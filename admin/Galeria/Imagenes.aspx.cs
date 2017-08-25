using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Galeria_Imagenes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Imagen InsertarImagen(string descripcion, string modulo)
    {
        Imagen objImagen = ImagenBLL.InsertWithReturn(descripcion, modulo);
        return objImagen;
    }
    [WebMethod]
    public static Imagen TraerImagen(int idImagen)
    {
        Imagen objImagen = ImagenBLL.SelectById(idImagen);
        return objImagen;
    }
    [WebMethod]
    public static Imagen ActualizarImagen(string descripcion, string modulo, string id)
    {
        ImagenBLL.Update(descripcion, modulo, Convert.ToInt32(id));
        Imagen objImagen = ImagenBLL.SelectById(Convert.ToInt32(id));
        return objImagen;
    }
    [WebMethod]
    public static int EliminarImagen(int idImagen)
    {
        try
        {
            ImagenBLL.Delete(idImagen);
            return idImagen;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}