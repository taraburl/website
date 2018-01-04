using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class FixtureBLL
{
    public FixtureBLL()
    {

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
        string idCancha, string fecha, string hora, string idGrupo)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        FixtureDS.tbl_fixtureDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idEquipo),
            Convert.ToInt32(idRival), Convert.ToInt32(idCancha), 
            TimeSpan.Parse(hora), Convert.ToDateTime(fecha),0,Convert.ToInt32(idGrupo));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Delete(string id)
    {
        FixtureDSTableAdapters.tbl_fixtureTableAdapter adapter =
            new FixtureDSTableAdapters.tbl_fixtureTableAdapter();
        adapter.DeleteFixture(Convert.ToInt32(id));
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
        return objFixture;
    }
}