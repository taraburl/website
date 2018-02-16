using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class FixtureNoticiaBLL
{
    public FixtureNoticiaBLL()
    {

    }
    public static List<FixtureNoticias> SelectAll()
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table = adapter.SelectNoEliminados();
        List<FixtureNoticias> listNoticia = new List<FixtureNoticias>();
        foreach (FixtureNoticiaDS.tbl_fixtureNoticiaRow row in table)
        {
            listNoticia.Add(RowToDto(row));
        }
        return listNoticia;
    }
    public static List<FixtureNoticias> SelectNoComentarios()
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table = adapter.SelectNoEliminados();
        List<FixtureNoticias> listNoticia = new List<FixtureNoticias>();
        foreach (FixtureNoticiaDS.tbl_fixtureNoticiaRow row in table)
        {
            listNoticia.Add(RowToDto(row));
        }
        return listNoticia;
    }
    public static List<FixtureNoticias> SelectByEvento(string idEvento)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table = adapter.SelectByEvento(Convert.ToInt32(idEvento));
        List<FixtureNoticias> listNoticia = new List<FixtureNoticias>();
        foreach (FixtureNoticiaDS.tbl_fixtureNoticiaRow row in table)
        {
            listNoticia.Add(RowToDto(row));
        }
        return listNoticia;
    }
    public static FixtureNoticias SelectByTipo(string tipo, string idFixture)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table = adapter.SelectByTipos(tipo, Convert.ToInt32(idFixture));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static FixtureNoticias InsertWithReturn(string idFixture, string idEquipo,
        string idJugador, string tipo, string descripcion, string fecha, string hora)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table =
            adapter.InsertWithReturn(Convert.ToInt32(idFixture), Convert.ToInt32(idEquipo), Convert.ToInt32(idJugador),
            tipo, descripcion, Convert.ToDateTime(fecha), TimeSpan.Parse(hora), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        if (tipo == "Gol")
        {
            Goles objGol = GolesBLL.SelectByJugador(Convert.ToInt32(idJugador));
            int goles = objGol.Gol + 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(idJugador));
        }
        return RowToDto(table[0]);
    }
    public static FixtureNoticias SelectById(int id)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticiaDS.tbl_fixtureNoticiaDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string idFixture, string idEquipo, string idJugador,
        string tipo, string descripcion, string fecha, string hora, int id)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
             new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticias objfixture = FixtureNoticiaBLL.SelectById(Convert.ToInt32(id));
        string tipoActual = objfixture.Tipo;
        if (tipoActual == "Gol" && tipo != "Gol" && Convert.ToInt32(idJugador) == objfixture.IdJugador)
        {
            int goles = GolesBLL.SelectByJugador(objfixture.IdJugador).Gol - 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(objfixture.IdJugador));
        }
        else if (tipoActual != "Gol" && tipo == "Gol" && Convert.ToInt32(idJugador) == objfixture.IdJugador)
        {
            int goles = GolesBLL.SelectByJugador(objfixture.IdJugador).Gol + 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(objfixture.IdJugador));
        }
        else if (tipoActual != "Gol" && tipo == "Gol" && Convert.ToInt32(idJugador) != objfixture.IdJugador)
        {
            int goles = GolesBLL.SelectByJugador(Convert.ToInt32(idJugador)).Gol + 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(Convert.ToInt32(idJugador)));
            int gols = GolesBLL.SelectByJugador(Convert.ToInt32(objfixture.IdJugador)).Gol - 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(Convert.ToInt32(objfixture.IdJugador)));
        }
        else if (tipoActual == "Gol" && tipo != "Gol" && Convert.ToInt32(idJugador) == objfixture.IdJugador)
        {
            int goles = GolesBLL.SelectByJugador(Convert.ToInt32(idJugador)).Gol - 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(Convert.ToInt32(idJugador)));
            int gols = GolesBLL.SelectByJugador(Convert.ToInt32(objfixture.IdJugador)).Gol + 1;
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(Convert.ToInt32(objfixture.IdJugador)));
        }
        adapter.UpdateRow(Convert.ToInt32(idFixture), Convert.ToInt32(idEquipo), Convert.ToInt32(idJugador),
            tipo, descripcion, fecha, hora, 0, id);
    }
    public static void Delete(int id)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
            new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        FixtureNoticias objFix = FixtureNoticiaBLL.SelectById(id);
        int goles = GolesBLL.SelectByJugador(objFix.IdJugador).Gol - 1;
        if (objFix.Tipo == "Gol")
        {
            Goles objGol = GolesBLL.SelectByJugador(objFix.IdJugador);
            GolesBLL.UpdateGoles(goles, Convert.ToInt32(objFix.IdJugador));
        }
        adapter.DeleteState(id);
    }
    public static void DeleteByFixture(int id)
    {
        FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter adapter =
            new FixtureNoticiaDSTableAdapters.tbl_fixtureNoticiaTableAdapter();
        adapter.DeleteByFixture(id);
    }
    private static FixtureNoticias RowToDto(FixtureNoticiaDS.tbl_fixtureNoticiaRow row)
    {
        FixtureNoticias objFixtureNoticias = new FixtureNoticias();
        objFixtureNoticias.Id = row.id;
        objFixtureNoticias.IdFixture = row.idFixture;
        objFixtureNoticias.IdEquipo = row.idEquipo;
        objFixtureNoticias.IdJugador = row.idJugador;
        objFixtureNoticias.Tipo = row.tipo;
        objFixtureNoticias.Descripcion = row.descripcion;
        objFixtureNoticias.Fecha = row.fecha;
        objFixtureNoticias.Hora = row.hora;
        objFixtureNoticias.Eliminado = row.eliminado;
        return objFixtureNoticias;
    }
}