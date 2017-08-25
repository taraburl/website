using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CategoriaBLL
{
    public CategoriaBLL()
    {
        
    }
    public static Categoria InsertWithReturn(string nombre)
    {
        CategoriaDSTableAdapters.tbl_categoriaTableAdapter adapter = new CategoriaDSTableAdapters.tbl_categoriaTableAdapter();
        CategoriaDS.tbl_categoriaDataTable table = adapter.InsertWithReturn(nombre,0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Categoria SelectById(int id)
    {
        CategoriaDSTableAdapters.tbl_categoriaTableAdapter adapter = new CategoriaDSTableAdapters.tbl_categoriaTableAdapter();
        CategoriaDS.tbl_categoriaDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, int id)
    {
        CategoriaDSTableAdapters.tbl_categoriaTableAdapter adapter = new CategoriaDSTableAdapters.tbl_categoriaTableAdapter();
        adapter.UpdateById(nombre, 0, id, id);
    }
    public static void Delete(int id)
    {
        CategoriaDSTableAdapters.tbl_categoriaTableAdapter adapter = new CategoriaDSTableAdapters.tbl_categoriaTableAdapter();
        adapter.DeleteRow(id);
    }
    private static Categoria RowToDto(CategoriaDS.tbl_categoriaRow row)
    {
        Categoria objCategoria = new Categoria();
        objCategoria.IdCategoria = row.id;
        objCategoria.Nombre = row.nombre;
        objCategoria.Eliminado = row.eliminado;
        return objCategoria;
    }
}