using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GolesBLL
{
    public GolesBLL()
    {

    }
    public static Goles SelectByJugador(int idJugador)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        GolesDS.tbl_golesDataTable table = adapter.SelectByJugador(idJugador);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static List<Goles> SelectByEvento(int idEvento)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        GolesDS.tbl_golesDataTable table = adapter.SelectByEvento(idEvento);
        List<Goles> listGoles = new List<Goles>();
        foreach (GolesDS.tbl_golesRow row in table)
        {
            listGoles.Add(RowToDto(row));
        }
        return listGoles;
    }
    public static void Insertar(int idJugador, int partidosJugados, int goles)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.InsertGoles(idJugador, partidosJugados, goles, 0);
    }
    public static void Update(int idJugador, int partidosJugados, int goles, int id)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.UpdateGoles(idJugador, partidosJugados, goles, 0, id);
    }
    public static void UpdatePJ(int idJugador, int partidosJugados)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.UpdatePartidosJugados(partidosJugados, idJugador);
    }
    public static void UpdateGoles(int gol, int id)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.UpdateGolesJugador(gol, id);
    }
    public static void DeleteByEvento(int idEvento)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.DeleteByEvento(idEvento);
    }
    public static void Delete(int id)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.DeleteState(id);
    }
    public static void DeleteByJugador(int idJugador)
    {
        GolesDSTableAdapters.tbl_golesTableAdapter adapter =
            new GolesDSTableAdapters.tbl_golesTableAdapter();
        adapter.DeleteByJugador(idJugador);
    }
    private static Goles RowToDto(GolesDS.tbl_golesRow row)
    {
        Goles objGoles = new Goles();
        objGoles.IdGoles = row.id;
        objGoles.IdJugador = row.idJugador;
        objGoles.PartidosJugados = row.partidosJugados;
        objGoles.Gol = row.goles;
        objGoles.Eliminado = row.eliminado;
        return objGoles;
    }
}