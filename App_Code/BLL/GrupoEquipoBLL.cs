using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GrupoEquipoBLL
{
    public GrupoEquipoBLL()
    {

    }
    public static List<GrupoEquipoCL> SelectByGrupo(int id)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
             new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        GrupoEquipo.tbl_grupoEquipoDataTable table = adapter.SelectByGrupo(Convert.ToInt32(id));
        List<GrupoEquipoCL> listGrupoEquipoCL = new List<GrupoEquipoCL>();
        foreach (GrupoEquipo.tbl_grupoEquipoRow row in table)
        {
            listGrupoEquipoCL.Add(RowToDto(row));
        }
        return listGrupoEquipoCL;
    }
    public static GrupoEquipoCL SelectCantidadActual(int idGrupo)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
             new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        GrupoEquipo.tbl_grupoEquipoDataTable table = adapter.SelectCantidadActual(Convert.ToInt32(idGrupo));
        List<GrupoEquipoCL> listGrupoEquipoCL = new List<GrupoEquipoCL>();
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static List<GrupoEquipoCL> SelectByEvento(int id)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
             new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        GrupoEquipo.tbl_grupoEquipoDataTable table = adapter.SelectByEvento(Convert.ToInt32(id));
        List<GrupoEquipoCL> listGrupoEquipoCL = new List<GrupoEquipoCL>();
        foreach (GrupoEquipo.tbl_grupoEquipoRow row in table)
        {
            listGrupoEquipoCL.Add(RowToDto(row));
        }
        return listGrupoEquipoCL;
    }
    public static List<GrupoEquipoCL> SelectByEquipo(int id)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
             new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        GrupoEquipo.tbl_grupoEquipoDataTable table = adapter.SelectByEquipo(Convert.ToInt32(id));
        List<GrupoEquipoCL> listGrupoEquipoCL = new List<GrupoEquipoCL>();
        foreach (GrupoEquipo.tbl_grupoEquipoRow row in table)
        {
            listGrupoEquipoCL.Add(RowToDto(row));
        }
        return listGrupoEquipoCL;
    }
    public static GrupoEquipoCL InsertWithReturn(string idEquipo, string idGrupo)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
            new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        GrupoEquipo.tbl_grupoEquipoDataTable table =
            adapter.InsertWithReturn(Convert.ToInt32(idGrupo), Convert.ToInt32(idEquipo), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Delete(int id)
    {
        GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter adapter =
            new GrupoEquipoTableAdapters.tbl_grupoEquipoTableAdapter();
        adapter.DeleteGrupoEquipo(id);
    }
    private static GrupoEquipoCL RowToDto(GrupoEquipo.tbl_grupoEquipoRow row)
    {
        GrupoEquipoCL objGrupoEquipo = new GrupoEquipoCL();
        objGrupoEquipo.Id = row.id;
        objGrupoEquipo.IdEquipo = row.idEquipo;
        objGrupoEquipo.IdGrupo = row.idGrupo;
        objGrupoEquipo.Eliminado = row.eliminado;
        return objGrupoEquipo;
    }
}