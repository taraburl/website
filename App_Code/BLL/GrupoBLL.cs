using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class GrupoBLL
{
    public GrupoBLL()
    {
       
    }
    public static List<Grupo> SelectAll()
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        GrupoDS.tbl_grupoDataTable table = adapter.SelectNoEliminados();
        List<Grupo> listGrupo = new List<Grupo>();
        foreach (GrupoDS.tbl_grupoRow row in table)
        {
            listGrupo.Add(RowToDto(row));
        }
        return listGrupo;
    }
    public static List<Grupo> SelectByEvento(int id)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        GrupoDS.tbl_grupoDataTable table = adapter.SelectByEvento(id);
        List<Grupo> listGrupo = new List<Grupo>();
        foreach (GrupoDS.tbl_grupoRow row in table)
        {
            listGrupo.Add(RowToDto(row));
        }
        return listGrupo;
    }
    public static Grupo SelectCantActual(int id)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        GrupoDS.tbl_grupoDataTable table = adapter.SelectCantidadActual(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Grupo InsertWithReturn(string nombre, string idEvento)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        GrupoDS.tbl_grupoDataTable table = adapter.InsertWithReturn(nombre, Convert.ToInt32(idEvento), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Grupo SelectById(int id)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        GrupoDS.tbl_grupoDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string idEvento, int id)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        adapter.UpdateGrupo(nombre, Convert.ToInt32(idEvento), 0, id, id);
    }
    public static void Delete(int id)
    {
        GrupoDSTableAdapters.tbl_grupoTableAdapter adapter = new GrupoDSTableAdapters.tbl_grupoTableAdapter();
        adapter.DeleteGrupo(id);
    }
    private static Grupo RowToDto(GrupoDS.tbl_grupoRow row)
    {
        Grupo objGrupo = new Grupo();
        objGrupo.IdGrupo = row.id;
        objGrupo.Nombre = row.nombre;
        objGrupo.IdEvento = row.idEvento;
        objGrupo.Eliminado = row.eliminado;
        return objGrupo;
    }
}