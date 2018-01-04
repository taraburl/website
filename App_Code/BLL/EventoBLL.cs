using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EventoBLL
{
    public EventoBLL()
    {

    }
    public static List<Evento> SelectAll()
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        EventoDS.tbl_eventoDataTable table = adapter.SelectNoEliminados();
        List<Evento> listEvento = new List<Evento>();
        foreach (EventoDS.tbl_eventoRow row in table)
        {
            listEvento.Add(RowToDto(row));
        }
        return listEvento;
    }
    public static List<Evento> SelectActuales()
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        EventoDS.tbl_eventoDataTable table = adapter.SelectActuales();
        List<Evento> listEvento = new List<Evento>();
        foreach (EventoDS.tbl_eventoRow row in table)
        {
            listEvento.Add(RowToDto(row));
        }
        return listEvento;
    }
    public static Evento InsertWithReturn(string nombre, string categoria, string descripcion, DateTime fechaInicio, DateTime fechaFin,
        int cantEquipos, int cantGrupos, int jugadoresPorEquipos)
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        EventoDS.tbl_eventoDataTable table = adapter.InsertWithReturn(nombre, categoria, descripcion, fechaInicio, fechaFin,
            cantEquipos, cantGrupos, jugadoresPorEquipos, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Evento SelectById(int id)
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        EventoDS.tbl_eventoDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string categoria, string descripcion,
        DateTime fechaInicio, DateTime fechaFin, int cantEquipos, int cantGrupos,
        int jugadoresPorEquipo, int id)
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        adapter.UpdateEvento(nombre, categoria, descripcion, fechaInicio, fechaFin,
            cantEquipos, cantGrupos, jugadoresPorEquipo, 0, id, id);
    }
    public static void Delete(int id)
    {
        EventoDSTableAdapters.tbl_eventoTableAdapter adapter = new EventoDSTableAdapters.tbl_eventoTableAdapter();
        adapter.DeleteEvento(id);
    }
    private static Evento RowToDto(EventoDS.tbl_eventoRow row)
    {
        Evento objEvento = new Evento();
        objEvento.IdEvento = row.id;
        objEvento.Nombre = row.nombre;
        objEvento.Categoria = row.categoria;
        objEvento.Descripcion = row.descripcion;
        objEvento.FechaInico = row.fechaInicio;
        objEvento.FechaFin = row.fechaFin;
        objEvento.CantidadGrupos = row.cantGrupos;
        objEvento.CantidadEquipos = row.canEquipos;
        objEvento.CantidadJugadoresPorEquipo = row.jugadoresPorEquipo;
        objEvento.Eliminado = row.eliminado;
        return objEvento;
    }
}