using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ImagenBLL
{
    public ImagenBLL()
    {

    }
    public static Imagen InsertWithReturn(string descripcion, string modulo)
    {
        ImagenDSTableAdapters.tbl_imagenesTableAdapter adapter = new ImagenDSTableAdapters.tbl_imagenesTableAdapter();
        ImagenDS.tbl_imagenesDataTable table = adapter.InsertWithReturn(descripcion, modulo, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Imagen SelectById(int id)
    {
        ImagenDSTableAdapters.tbl_imagenesTableAdapter adapter = new ImagenDSTableAdapters.tbl_imagenesTableAdapter();
        ImagenDS.tbl_imagenesDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string descripcion, string modulo, int id)
    {
        ImagenDSTableAdapters.tbl_imagenesTableAdapter adapter = new ImagenDSTableAdapters.tbl_imagenesTableAdapter();
        adapter.updateById(descripcion, modulo, 0, id, id);
    }
    public static void Delete(int id)
    {
        ImagenDSTableAdapters.tbl_imagenesTableAdapter adapter = new ImagenDSTableAdapters.tbl_imagenesTableAdapter();
        adapter.deleteRow(id);
    }
    private static Imagen RowToDto(ImagenDS.tbl_imagenesRow row)
    {
        Imagen objImagen = new Imagen();
        objImagen.IdImagen = row.id;
        objImagen.Descripcion = row.descripcion;
        objImagen.Modulo = row.modulo;
        objImagen.Eliminado = row.eliminado;
        return objImagen;
    }
}