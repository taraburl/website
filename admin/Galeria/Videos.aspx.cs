using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Galeria_Videos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Video InsertarVideo(string url, string descripcion, string modulo)
    {
        Video objVideo = VideoBLL.InsertWithReturn(url, modulo, descripcion);
        return objVideo;
    }
    [WebMethod]
    public static Video TraerVideo(int idVideo)
    {
        Video objVideo = VideoBLL.SelectById(idVideo);
        return objVideo;
    }
    [WebMethod]
    public static Video ActualizarVideo(string url, string descripcion, string modulo, string id)
    {
        VideoBLL.Update(url, descripcion, modulo, Convert.ToInt32(id));
        Video objVideo = VideoBLL.SelectById(Convert.ToInt32(id));
        return objVideo;
    }
    [WebMethod]
    public static int EliminarVideo(int idVideo)
    {
        try
        {
            VideoBLL.Delete(idVideo);
            return idVideo;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}