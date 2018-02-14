using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class FixtureBLL
{
    public FixtureBLL()
    {

    }
    public static List<Fixture> SelectNoEliminados()
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectNoEliminados();
        List<Fixture> listFixture = new List<Fixture>();
        foreach (FixtureDS.tbl_fixtureRow row in table)
        {
            listFixture.Add(RowToDto(row));
        }
        return listFixture;
    }
    public static List<Fixture> SelectByGrupo(string idGrupo)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectByGrupo(Convert.ToInt32(idGrupo));
        List<Fixture> listFixture = new List<Fixture>();
        foreach (FixtureDS.tbl_fixtureRow row in table)
        {
            listFixture.Add(RowToDto(row));
        }
        return listFixture;
    }
    public static List<Fixture> SelectPosiciones(string idEvento)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
           new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectPosiciones(Convert.ToInt32(idEvento));
        List<Fixture> listFixture = new List<Fixture>();
        foreach (FixtureDS.tbl_fixtureRow row in table)
        {
            listFixture.Add(RowToDto(row));
        }
        return listFixture;
    }
    public static List<Fixture> SelectActuales()
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectActuales();
        List<Fixture> listFixture = new List<Fixture>();
        foreach (FixtureDS.tbl_fixtureRow row in table)
        {
            listFixture.Add(RowToDto(row));
        }
        return listFixture;
    }
    public static List<Fixture> SelectByEvento(string idGrupo)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectByEvento(Convert.ToInt32(idGrupo));
        List<Fixture> listFixture = new List<Fixture>();
        foreach (FixtureDS.tbl_fixtureRow row in table)
        {
            listFixture.Add(RowToDto(row));
        }
        return listFixture;
    }
    public static Fixture SelectById(int id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Fixture InsertWithReturn(string idEquipo, string idRival,
        string idCancha, string fecha, string hora, string idGrupo,
        string estado, string scoreEquipo, string scoreRival, string puntos)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idEquipo),
            Convert.ToInt32(idRival), Convert.ToInt32(idCancha),
            TimeSpan.Parse(hora), Convert.ToDateTime(fecha), 0, Convert.ToInt32(idGrupo),
            estado, Convert.ToInt32(scoreEquipo), Convert.ToInt32(scoreRival), Convert.ToInt32(puntos));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void UpdateFixture(string idEquipo, string idRival,
        string idCancha, string fecha, string hora, string idGrupo,
        string estado, string scoreEquipo, string scoreRival, string puntos, string id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.UpdateFixture(Convert.ToInt32(idEquipo),
            Convert.ToInt32(idRival), Convert.ToInt32(idCancha),
            TimeSpan.Parse(hora), Convert.ToDateTime(fecha), 0,
            Convert.ToInt32(idGrupo),
            estado, Convert.ToInt32(scoreEquipo),
            Convert.ToInt32(scoreRival),
            Convert.ToInt32(puntos),
            Convert.ToInt32(id), Convert.ToInt32(id));
    }
    public static void UpdateEstado(int id, string estado)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.UpdateEstado(estado, id);
    }
    public static void UpdatePuntos(int id, int puntos)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.UpdatePuntos(puntos, id);
    }
    public static void Delete(string id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.DeleteFixture(Convert.ToInt32(id));
    }
    public static void DeleteByGrupo(int id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.DeleteByGrupo(id);
    }
    public static void UpdateScoreEquipo(int scoreEquipo, string id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.UpdateScoreEquipo(scoreEquipo, Convert.ToInt32(id));
    }
    public static void UpdateScoreRival(int scoreRival, string id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.UpdateScoreRival(scoreRival, Convert.ToInt32(id));
    }
    private static Fixture RowToDto(FixtureDS.tbl_fixtureRow row)
    {
        Fixture objFixture = new Fixture();
        objFixture.IdFixture = row.id;
        objFixture.IdEquipo = row.idEquipo;
        objFixture.IdRival = row.idRival;
        objFixture.IdCancha = row.idCancha;
        objFixture.Fecha = row.fecha;
        objFixture.Hora = row.hora;
        objFixture.IdGrupo = row.idGrupo;
        objFixture.Eliminado = row.eliminado;
        objFixture.Estado = row.estado;
        objFixture.ScoreEquipo = row.scoreEquipo;
        objFixture.ScoreRival = row.scoreRival;
        objFixture.Puntos = row.puntos;
        return objFixture;
    }
}