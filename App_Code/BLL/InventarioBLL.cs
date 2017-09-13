using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class InventarioBLL
{
    public InventarioBLL()
    {

    }
    public static List<Inventario> SelectAll()
    {
        InventarioDSTableAdapters.tbl_inventarioTableAdapter adapter = new InventarioDSTableAdapters.tbl_inventarioTableAdapter();
        InventarioDS.tbl_inventarioDataTable table = adapter.selectNoEliminados();
        List<Inventario> listInventario = new List<Inventario>();
        foreach (InventarioDS.tbl_inventarioRow row in table)
        {
            listInventario.Add(RowToDto(row));
        }
        return listInventario;
    }
    public static Inventario InsertWithReturn(string idUsuario, string tipo, string glosa)
    {
        InventarioDSTableAdapters.tbl_inventarioTableAdapter adapter = new InventarioDSTableAdapters.tbl_inventarioTableAdapter();
        InventarioDS.tbl_inventarioDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idUsuario), tipo, glosa, TimeSpan.Parse(DateTime.Now.ToString("hh:mm:ss")), DateTime.Now, 0, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Inventario SelectById(int id)
    {
        InventarioDSTableAdapters.tbl_inventarioTableAdapter adapter = new InventarioDSTableAdapters.tbl_inventarioTableAdapter();
        InventarioDS.tbl_inventarioDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string idUsuario, string tipo, string glosa, string id)
    {
        InventarioDSTableAdapters.tbl_inventarioTableAdapter adapter = new InventarioDSTableAdapters.tbl_inventarioTableAdapter();
        adapter.updateById(Convert.ToInt32(idUsuario), tipo, glosa, TimeSpan.Parse(DateTime.Now.ToString("hh:mm:ss")), DateTime.Now, 1, 0, Convert.ToInt32(id), Convert.ToInt32(id));
    }
    public static void Delete(int id)
    {
        InventarioDSTableAdapters.tbl_inventarioTableAdapter adapter = new InventarioDSTableAdapters.tbl_inventarioTableAdapter();
        adapter.deleteRow(id);
    }
    private static Inventario RowToDto(InventarioDS.tbl_inventarioRow row)
    {
        Inventario objInventario = new Inventario();
        objInventario.IdInventario = row.id;
        objInventario.Tipo = row.tipo;
        objInventario.IdUsuario = row.idUsuario;
        objInventario.Glosa = row.glosa;
        objInventario.Fecha = row.fecha;
        objInventario.Hora = row.hora;
        objInventario.Estado = row.estado;
        objInventario.Eliminado = row.eliminado;
        return objInventario;
    }
}