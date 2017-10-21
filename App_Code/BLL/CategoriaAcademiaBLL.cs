using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CategoriaAcademiaBLL
{
    public CategoriaAcademiaBLL()
    {

    }
    public static List<CategoriaAcademia> SelectAll()
    {
        CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter adapter = new CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter();
        CategoriaAcademiaDS.tbl_categoriaAcademiaDataTable table = adapter.SelectNoEliminados();
        List<CategoriaAcademia> listCategoria = new List<CategoriaAcademia>();
        foreach (CategoriaAcademiaDS.tbl_categoriaAcademiaRow row in table)
        {
            listCategoria.Add(RowToDto(row));
        }
        return listCategoria;
    }
    public static CategoriaAcademia InsertWithReturn(string nombre, string descripcion, string precio)
    {
        CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter adapter = new CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter();
        CategoriaAcademiaDS.tbl_categoriaAcademiaDataTable table = adapter.InsertWithReturn(nombre, descripcion, Convert.ToDouble(precio), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static CategoriaAcademia SelectById(int id)
    {
        CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter adapter = new CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter();
        CategoriaAcademiaDS.tbl_categoriaAcademiaDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string descripcion, string precio, int id)
    {
        CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter adapter = new CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter();
        adapter.UpdateRow(nombre, descripcion, Convert.ToDouble(precio), 0, id, id);
    }
    public static void Delete(int id)
    {
        CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter adapter = new CategoriaAcademiaDSTableAdapters.tbl_categoriaAcademiaTableAdapter();
        adapter.DeleteRow(id);
    }
    private static CategoriaAcademia RowToDto(CategoriaAcademiaDS.tbl_categoriaAcademiaRow row)
    {
        CategoriaAcademia objCategoria = new CategoriaAcademia();
        objCategoria.IdCategoriaAcademia = row.id;
        objCategoria.Nombre = row.nombre;
        objCategoria.Descripcion = row.descripcion;
        objCategoria.PrecioVenta = row.precio;
        objCategoria.Eliminado = row.eliminado;
        return objCategoria;
    }
}