using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_noticias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Noticia InsertarNoticia(string titulo, string descripcion, string fecha)
    {
        Noticia objNoticia = NoticiaBLL.InsertWithReturn(titulo, descripcion, fecha);
        return objNoticia;
    }
    [WebMethod]
    public static Noticia TraerNoticia(int idNoticia)
    {
        Noticia objNoticia = NoticiaBLL.SelectById(idNoticia);
        return objNoticia;
    }
    [WebMethod]
    public static Noticia ActualizarNoticia(string titulo, string descripcion, string fecha, string id)
    {
        NoticiaBLL.Update(titulo, descripcion, fecha, Convert.ToInt32(id));
        Noticia objNoticia = NoticiaBLL.SelectById(Convert.ToInt32(id));
        return objNoticia;
    }
    [WebMethod]
    public static int EliminarNoticia(int idNoticia)
    {
        try
        {
            NoticiaBLL.Delete(idNoticia);
            return idNoticia;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}