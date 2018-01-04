using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class JugadorEquipoBLL
{
    public JugadorEquipoBLL()
    {

    }
    public static List<JugadorEquipo> SelectAll()
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        JugadorEquipoDS.tbl_jugadorEquipoDataTable table = adapter.SelectNoEliminados();
        List<JugadorEquipo> listJugadorEquipo = new List<JugadorEquipo>();
        foreach (JugadorEquipoDS.tbl_jugadorEquipoRow row in table)
        {
            listJugadorEquipo.Add(RowToDto(row));
        }
        return listJugadorEquipo;
    }
    public static List<JugadorEquipo> SelectByTipo(int id)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        JugadorEquipoDS.tbl_jugadorEquipoDataTable table = adapter.SelectByIdEquipo(id);
        List<JugadorEquipo> listJugadorEquipo = new List<JugadorEquipo>();
        foreach (JugadorEquipoDS.tbl_jugadorEquipoRow row in table)
        {
            listJugadorEquipo.Add(RowToDto(row));
        }
        return listJugadorEquipo;
    }
    public static JugadorEquipo SelectCantidadActualJugadores(int id)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        JugadorEquipoDS.tbl_jugadorEquipoDataTable table = adapter.CantidadDeJugadores(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static JugadorEquipo InsertWithReturn(string nombre, string posicion, int idEquipo)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        JugadorEquipoDS.tbl_jugadorEquipoDataTable table =
            adapter.InsertWithReturn(nombre, posicion, idEquipo, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static JugadorEquipo SelectById(int id)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        JugadorEquipoDS.tbl_jugadorEquipoDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string posicion, int idEquipo, int id)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        adapter.UpdateJugadorEquipo(nombre, posicion, idEquipo, 0, id, id);
    }
    public static void Delete(int id)
    {
        JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter adapter =
            new JugadorEquipoDSTableAdapters.tbl_jugadorEquipoTableAdapter();
        adapter.DeleteJugadorEquipo(id);
    }
    private static JugadorEquipo RowToDto(JugadorEquipoDS.tbl_jugadorEquipoRow row)
    {
        JugadorEquipo objJugadorEquipo = new JugadorEquipo();
        objJugadorEquipo.IdJugadorEquipo = row.id;
        objJugadorEquipo.Nombre = row.nombre;
        objJugadorEquipo.Posicion = row.posicion;
        objJugadorEquipo.IdEquipo = row.idEquipo;
        objJugadorEquipo.Eliminado = row.eliminado;
        return objJugadorEquipo;
    }
}