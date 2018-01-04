using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CanchaBLL
{
    public CanchaBLL()
    {

    }
    public static List<Cancha> SelectAll()
    {
        CanchaDSTableAdapters.tbl_canchaTableAdapter adapter = new CanchaDSTableAdapters.tbl_canchaTableAdapter();
        CanchaDS.tbl_canchaDataTable table = adapter.SelectNoEliminados();
        List<Cancha> listCancha = new List<Cancha>();
        foreach (CanchaDS.tbl_canchaRow row in table)
        {
            listCancha.Add(RowToDto(row));
        }
        return listCancha;
    }
    public static Cancha InsertWithReturn(string nombre, string descripcion)
    {
        CanchaDSTableAdapters.tbl_canchaTableAdapter adapter = new CanchaDSTableAdapters.tbl_canchaTableAdapter();
        CanchaDS.tbl_canchaDataTable table = adapter.InsertWithReturn(nombre, descripcion, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Cancha SelectById(int id)
    {
        CanchaDSTableAdapters.tbl_canchaTableAdapter adapter = new CanchaDSTableAdapters.tbl_canchaTableAdapter();
        CanchaDS.tbl_canchaDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string descripcion, int id)
    {
        CanchaDSTableAdapters.tbl_canchaTableAdapter adapter = new CanchaDSTableAdapters.tbl_canchaTableAdapter();
        adapter.UpdateCancha(nombre, descripcion, 0, id, id);
    }
    public static void Delete(int id)
    {
        CanchaDSTableAdapters.tbl_canchaTableAdapter adapter = new CanchaDSTableAdapters.tbl_canchaTableAdapter();
        adapter.DeleteCancha(id);
    }

    private static Cancha RowToDto(CanchaDS.tbl_canchaRow row)
    {
        Cancha objCancha = new Cancha();
        objCancha.IdCancha = row.id;
        objCancha.Nombre = row.nombre;
        objCancha.Descripcion = row.descripcion;
        objCancha.Eliminado = row.eliminado;
        return objCancha;
    }
}