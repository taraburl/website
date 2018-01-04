using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Configuracion_canchas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Cancha InsertarCancha(string nombre, string descripcion)
    {
        Cancha objCancha = CanchaBLL.InsertWithReturn(nombre, descripcion);
        return objCancha;
    }
    [WebMethod]
    public static Cancha TraerCancha(int idCancha)
    {
        Cancha objCancha = CanchaBLL.SelectById(idCancha);
        return objCancha;
    }
    [WebMethod]
    public static Cancha ActualizarCancha(string nombre,string descripcion, string id)
    {
        CanchaBLL.Update(nombre, descripcion, Convert.ToInt32(id));
        Cancha objCancha = CanchaBLL.SelectById(Convert.ToInt32(id));
        return objCancha;
    }
    [WebMethod]
    public static int EliminarCancha(int idCancha)
    {
        try
        {
            CanchaBLL.Delete(idCancha);
            return idCancha;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}