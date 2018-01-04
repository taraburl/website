using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class JugadorBLL
{
    public JugadorBLL()
    {

    }
    public static List<Jugador> SelectAll()
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        JugadorDS.tbl_jugadorDataTable table = adapter.SelectNoEliminados();
        List<Jugador> listJugador = new List<Jugador>();
        foreach (JugadorDS.tbl_jugadorRow row in table)
        {
            listJugador.Add(RowToDto(row));
        }
        return listJugador;
    }
    public static List<Jugador> SelectByTipo(string tipo)
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        JugadorDS.tbl_jugadorDataTable table = adapter.SelectByTipo(tipo);
        List<Jugador> listJugador = new List<Jugador>();
        foreach (JugadorDS.tbl_jugadorRow row in table)
        {
            listJugador.Add(RowToDto(row));
        }
        return listJugador;
    }
    public static Jugador InsertWithReturn(string nombre, string tipo, int edad)
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        JugadorDS.tbl_jugadorDataTable table = adapter.InsertWithReturn(nombre, tipo, edad, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Jugador SelectById(int id)
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        JugadorDS.tbl_jugadorDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string tipo, int edad, int id)
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        adapter.UpdateJugador(nombre, tipo, edad, 0, id, id);
    }
    public static void Delete(int id)
    {
        JugadorDSTableAdapters.tbl_jugadorTableAdapter adapter = new JugadorDSTableAdapters.tbl_jugadorTableAdapter();
        adapter.DeleteJugador(id);
    }
    private static Jugador RowToDto(JugadorDS.tbl_jugadorRow row)
    {
        Jugador objJugador = new Jugador();
        objJugador.IdJugador = row.id;
        objJugador.Nombre = row.nombre;
        objJugador.Edad = row.edad;
        objJugador.Tipo = row.tipo;
        objJugador.Eliminado = row.eliminado;
        return objJugador;
    }
}