using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class PosicionesBLL
{
    public PosicionesBLL()
    {

    }
    public static Posiciones SelectByEquipo(int id)
    {
        PosicionesDSTableAdapters.tbl_posicionesTableAdapter adapter =
             new PosicionesDSTableAdapters.tbl_posicionesTableAdapter();
        PosicionesDS.tbl_posicionesDataTable table = adapter.SelectByEquipo(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static List<Posiciones> SelectByGrupo(int idGrupo)
    {
        PosicionesDSTableAdapters.tbl_posicionesTableAdapter adapter =
            new PosicionesDSTableAdapters.tbl_posicionesTableAdapter();
        PosicionesDS.tbl_posicionesDataTable table = adapter.SelectByGrupo(idGrupo);
        List<Posiciones> listPosiciones = new List<Posiciones>();
        foreach (PosicionesDS.tbl_posicionesRow row in table)
        {
            listPosiciones.Add(RowToDto(row));
        }
        return listPosiciones;
    }
    public static void Insertar(int idGrupo, int idEquipo, int partidosJugados, int ganados,
        int empatados, int perdidos, int golesFavor, int golesContra, int diferencia, int puntos)
    {
        PosicionesDSTableAdapters.tbl_posicionesTableAdapter adapter =
            new PosicionesDSTableAdapters.tbl_posicionesTableAdapter();
        adapter.Insert1(idGrupo, partidosJugados, idEquipo, ganados, empatados, perdidos, golesFavor,
            golesContra, diferencia, puntos, 0);
    }
    public static void Update(int idGrupo, int idEquipo, int partidosJugados, int ganados,
        int empatados, int perdidos, int golesFavor, int golesContra, int diferencia, int puntos, int id)
    {
        PosicionesDSTableAdapters.tbl_posicionesTableAdapter adapter =
            new PosicionesDSTableAdapters.tbl_posicionesTableAdapter();
        adapter.Update1(idGrupo, partidosJugados, idEquipo, ganados, empatados, perdidos, golesFavor,
            golesContra, diferencia, puntos, 0, id);

    }
    public static void DeleteEquipo(int idEquipo)
    {
        PosicionesDSTableAdapters.tbl_posicionesTableAdapter adapter =
            new PosicionesDSTableAdapters.tbl_posicionesTableAdapter();
        adapter.DeleteEquipo(idEquipo);
    }
    private static Posiciones RowToDto(PosicionesDS.tbl_posicionesRow row)
    {
        Posiciones objPosiciones = new Posiciones();
        objPosiciones.IdPosiciones = row.id;
        objPosiciones.IdGrupo = row.idGrupo;
        objPosiciones.IdEquipo = row.idEquipo;
        objPosiciones.PartidosJugados = row.partidosJugados;
        objPosiciones.Ganados = row.ganados;
        objPosiciones.Empates = row.empatados;
        objPosiciones.Perdidos = row.perdidos;
        objPosiciones.GolesFavor = row.golesFavor;
        objPosiciones.GolesContra = row.golesContra;
        objPosiciones.Diferencia = row.diferencia;
        objPosiciones.Puntos = row.puntos;
        objPosiciones.Eliminado = row.eliminado;
        return objPosiciones;
    }
}