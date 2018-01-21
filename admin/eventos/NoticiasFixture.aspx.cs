using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_NoticiasFixture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<JugadorEquipo> TraerJugadoresEquipo(int idEquipo)
    {
        List<JugadorEquipo> listJugadores = JugadorEquipoBLL.SelectByEquipo(idEquipo);
        return listJugadores;
    }
    [WebMethod]
    public static FixtureNoticias InsertarNoticia(string idFixture, string idEquipo, string idJugador,
        string tipo, string descripcion, string fecha, string hora)
    {
        FixtureNoticias objFixture = FixtureNoticiaBLL.InsertWithReturn(
            idFixture, idEquipo, idJugador, tipo, descripcion, fecha, hora);
        return objFixture;
    }
    [WebMethod]
    public static FixtureNoticias TraerNoticia(string idNoticia)
    {
        FixtureNoticias objEvento = FixtureNoticiaBLL.SelectById(Convert.ToInt32(idNoticia));
        return objEvento;
    }
    [WebMethod]
    public static FixtureNoticias ActualizarNoticia(string idFixture, string idEquipo, string idJugador,
        string tipo, string descripcion, string fecha, string hora, string id)
    {
        FixtureNoticiaBLL.Update(idFixture, idEquipo, idJugador, tipo, descripcion, fecha, hora, Convert.ToInt32(id));
        FixtureNoticias objEvento = FixtureNoticiaBLL.SelectById(Convert.ToInt32(id));
        return objEvento;
    }
    [WebMethod]
    public static int EliminarNoticia(string idNoticia)
    {
        try
        {
            FixtureNoticiaBLL.Delete(Convert.ToInt32(idNoticia));
            return Convert.ToInt32(idNoticia);
        }
        catch (Exception)
        {
            return -1;
        }

    }
}