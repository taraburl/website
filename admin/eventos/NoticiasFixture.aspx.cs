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
        FixtureNoticias objFixtureNoticia = FixtureNoticiaBLL.InsertWithReturn(
            idFixture, idEquipo, idJugador, tipo, descripcion, fecha, hora);
        if (tipo == "Gol")
        {
            Fixture objFixture = FixtureBLL.SelectById(Convert.ToInt32(idFixture));
            if (idEquipo == objFixture.IdEquipo.ToString())
            {
                int gol = objFixture.ScoreEquipo + 1;
                FixtureBLL.UpdateScoreEquipo(gol, idFixture);
            }
            else
            {
                int gol = objFixture.ScoreRival + 1;
                FixtureBLL.UpdateScoreRival(gol, idFixture);
            }
        }
        return objFixtureNoticia;

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
        FixtureNoticias objFixtureNoticia = FixtureNoticiaBLL.SelectById(Convert.ToInt32(id));
        Fixture objFixture = FixtureBLL.SelectById(Convert.ToInt32(idFixture));
        return objFixtureNoticia;
    }
    [WebMethod]
    public static int EliminarNoticia(string idNoticia)
    {
        try
        {
            FixtureNoticiaBLL.Delete(Convert.ToInt32(idNoticia));
            FixtureNoticias objFixtureNoticia = FixtureNoticiaBLL.SelectById(Convert.ToInt32(idNoticia));
            string tipo = objFixtureNoticia.Tipo;
            if (tipo == "Gol")
            {
                Fixture objFixture = FixtureBLL.SelectById(objFixtureNoticia.IdFixture);
                int scoreEquipo = 0;
                int scoreRival = 0;
                if (objFixture.ScoreEquipo > 0)
                {
                    scoreEquipo = objFixture.ScoreEquipo - 1;
                }
                if (objFixture.ScoreRival > 0)
                {
                    scoreRival = objFixture.ScoreRival - 1;
                }
                FixtureBLL.UpdateScoreEquipo(scoreEquipo, Convert.ToString(objFixtureNoticia.IdFixture));
                FixtureBLL.UpdateScoreRival(scoreRival, Convert.ToString(objFixtureNoticia.IdFixture));
            }
            return Convert.ToInt32(idNoticia);
        }
        catch (Exception)
        {
            return -1;
        }

    }
}