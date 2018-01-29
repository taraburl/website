using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class DetalleInventarioBLL
{
    public DetalleInventarioBLL()
    {

    }
    public static DetalleInventario InsertWithReturn(string idProducto, string cantidad, string idInventario)
    {
        DetalleInventarioDSTableAdapters.tbl_detalleInventarioTableAdapter adapter = new DetalleInventarioDSTableAdapters.tbl_detalleInventarioTableAdapter();
        DetalleInventarioDS.tbl_detalleInventarioDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idProducto), Convert.ToInt32(cantidad), Convert.ToInt32(idInventario));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static List<DetalleInventario> SelectByInventario(int idInventario)
    {
        DetalleInventarioDSTableAdapters.tbl_detalleInventarioTableAdapter adapter =
            new DetalleInventarioDSTableAdapters.tbl_detalleInventarioTableAdapter();
        DetalleInventarioDS.tbl_detalleInventarioDataTable table =
            adapter.SelectByInventario(idInventario);
        List<DetalleInventario> listDetalleInventario = new List<DetalleInventario>();
        foreach (DetalleInventarioDS.tbl_detalleInventarioRow row in table)
        {
            listDetalleInventario.Add(RowToDto(row));
        }
        return listDetalleInventario;
    }
    private static DetalleInventario RowToDto(DetalleInventarioDS.tbl_detalleInventarioRow row)
    {
        DetalleInventario objDetalleInventario = new DetalleInventario();
        objDetalleInventario.IdDetalleInventario = row.id;
        objDetalleInventario.IdProducto = row.idProducto;
        objDetalleInventario.IdInventario = row.idInventario;
        objDetalleInventario.Cantidad = row.cantidad;
        return objDetalleInventario;
    }
}