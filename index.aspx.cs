using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Web.Services;

public partial class inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Inicio";
    }

    protected void EnviarMail(object sender, EventArgs e)
    {
        String de = name.Text;
        String emailde = email.Text;
        String asuntode = asunto.Text;
        String mensajede = comment.Text;
        name.Text = "";
        email.Text = "";
        asunto.Text = "";
        comment.Text = "";
        new SendEmail(emailde, de, asuntode, mensajede, "luistj103@gmail.com", "Luis Taraune");
    }
    [WebMethod]
    public static void EstadosPartidos()
    {
        List<Fixture> listFixtures = FixtureBLL.SelectNoEliminados();
        foreach (Fixture objFixture in listFixtures)
        {
            if (objFixture.Estado != "Cancelado" &&
                     DateTime.Now >= objFixture.HoraCompleta &&
                     DateTime.Now <= objFixture.HoraCompleta.AddMinutes(120))
            {
                FixtureBLL.UpdateEstado(objFixture.IdFixture, "En Curso");
            }
            if (objFixture.Estado != "Cancelado" && objFixture.Estado != "Finalizado" &&
                DateTime.Now >= objFixture.HoraCompleta.AddMinutes(120))
            {
                if (objFixture.ScoreEquipo > objFixture.ScoreRival)
                {
                    ganador(objFixture.IdFixture, objFixture.IdEquipo);
                    perdedor(objFixture.IdFixture, objFixture.IdRival);
                    FixtureBLL.UpdatePuntos(objFixture.IdFixture, 3);
                }
                else if (objFixture.ScoreEquipo > objFixture.ScoreRival)
                {
                    ganador(objFixture.IdFixture, objFixture.IdRival);
                    perdedor(objFixture.IdFixture, objFixture.IdEquipo);
                    FixtureBLL.UpdatePuntos(objFixture.IdFixture, 3);
                }
                else if (objFixture.ScoreEquipo > objFixture.ScoreRival)
                {
                    empate(objFixture.IdFixture, objFixture.IdRival);
                    empate(objFixture.IdFixture, objFixture.IdEquipo);
                    FixtureBLL.UpdatePuntos(objFixture.IdFixture, 1);
                }
                FixtureBLL.UpdateEstado(objFixture.IdFixture, "Finalizado");
            }
        }
    }
    private static void ganador(int IdFixture, int idEquipo)
    {
        Fixture objFixture = FixtureBLL.SelectById(IdFixture);
        Posiciones objPosiciones = PosicionesBLL.SelectByEquipo(idEquipo);
        int pj = objPosiciones.PartidosJugados + 1;
        int g = objPosiciones.Ganados + 1;
        int gf = objPosiciones.GolesFavor + objFixture.ScoreEquipo;
        int gc = objPosiciones.GolesContra + objFixture.ScoreRival;
        int dif = objPosiciones.Diferencia + (gf - gc);
        int pts = objPosiciones.Puntos + objFixture.Puntos;
        PosicionesBLL.Update(objPosiciones.IdGrupo, objPosiciones.IdEquipo,
            pj, g, objPosiciones.Empates, objPosiciones.Perdidos, gf, gc, dif, pts,
            objPosiciones.IdPosiciones);
    }
    private static void perdedor(int IdFixture, int idEquipo)
    {
        Fixture objFixture = FixtureBLL.SelectById(IdFixture);
        Posiciones objPosiciones = PosicionesBLL.SelectByEquipo(idEquipo);
        int pj = objPosiciones.PartidosJugados + 1;
        int p = objPosiciones.Perdidos + 1;
        int gf = objPosiciones.GolesFavor + objFixture.ScoreRival;
        int gc = objPosiciones.GolesContra + objFixture.ScoreEquipo;
        int dif = objPosiciones.Diferencia + (gf - gc);
        PosicionesBLL.Update(objPosiciones.IdGrupo, objPosiciones.IdEquipo,
            pj, objPosiciones.Ganados, objPosiciones.Empates, p, gf, gc, dif, objPosiciones.Puntos,
            objPosiciones.IdPosiciones);
    }
    private static void empate(int IdFixture, int idEquipo)
    {
        Fixture objFixture = FixtureBLL.SelectById(IdFixture);
        Posiciones objPosiciones = PosicionesBLL.SelectByEquipo(idEquipo);
        int pj = objPosiciones.PartidosJugados + 1;
        int e = objPosiciones.Empates + 1;
        int gf = objPosiciones.GolesFavor + objFixture.ScoreRival;
        int gc = objPosiciones.GolesContra + objFixture.ScoreEquipo;
        int dif = objPosiciones.Diferencia + (gf - gc);
        int pts = objPosiciones.Puntos + objFixture.Puntos;
        PosicionesBLL.Update(objPosiciones.IdGrupo, objPosiciones.IdEquipo,
            pj, objPosiciones.Ganados, e, objPosiciones.Perdidos, gf, gc, dif, pts,
            objPosiciones.IdPosiciones);
    }
}