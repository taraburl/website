using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EquipoBLL
{
    public EquipoBLL()
    {

    }
    public static List<Equipos> SelectAll()
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
             new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        EquipoDS.tbl_equipoDataTable table = adapter.SelectNoEliminados();
        List<Equipos> listEquipos = new List<Equipos>();
        foreach (EquipoDS.tbl_equipoRow row in table)
        {
            listEquipos.Add(RowToDto(row));
        }
        return listEquipos;
    }
    public static List<Equipos> SelectByEvento(int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
             new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        EquipoDS.tbl_equipoDataTable table = adapter.SelectByEvento(id);
        List<Equipos> listEquipos = new List<Equipos>();
        foreach (EquipoDS.tbl_equipoRow row in table)
        {
            listEquipos.Add(RowToDto(row));
        }
        return listEquipos;
    }
    public static Equipos InsertWithReturn(string nombre, int idEvento)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        EquipoDS.tbl_equipoDataTable table =
            adapter.InsertWithReturn(nombre, idEvento, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Equipos SelectById(int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        EquipoDS.tbl_equipoDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Equipos SelectCantActual(int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        EquipoDS.tbl_equipoDataTable table = adapter.SelectCantEquipos(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, int idEvento, int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        adapter.UpdateEquipo(nombre, idEvento, 0, id, id);
    }
    public static void Delete(int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        adapter.DeleteEquipo(id);
        JugadorEquipoBLL.DeleteByEquipo(id);
    }
    public static void DeleteByEvento(int id)
    {
        EquipoDSTableAdapters.tbl_equipoTableAdapter adapter =
            new EquipoDSTableAdapters.tbl_equipoTableAdapter();
        adapter.DeleteByEvento(id);
    }
    private static Equipos RowToDto(EquipoDS.tbl_equipoRow row)
    {
        Equipos objEquipo = new Equipos();
        objEquipo.IdEquipo = row.id;
        objEquipo.Nombre = row.nombre;
        objEquipo.IdEvento = row.idEvento;
        objEquipo.Eliminado = row.eliminado;
        return objEquipo;
    }
}