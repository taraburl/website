using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ProductoBLL
{
    public ProductoBLL()
    {

    }
    public static List<Producto> SelectAll()
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        ProductoDS.tbl_productoDataTable table = adapter.selectNoEliminados();
        List<Producto> listProducto = new List<Producto>();
        foreach (ProductoDS.tbl_productoRow row in table)
        {
            listProducto.Add(RowToDto(row));
        }
        return listProducto;
    }
    public static Producto InsertWithReturn(string descripcion, string nombre,
        string precio, string medida, string idcategoria, string costo)
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        ProductoDS.tbl_productoDataTable table = adapter.InsertWithReturn(descripcion,
            nombre, Convert.ToDouble(precio), medida, Convert.ToInt32(idcategoria), 0,
            Convert.ToDouble(costo), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void UpdateStock(string id, int stock)
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        adapter.UpdateStock(stock, Convert.ToInt32(id));
    }
    public static Producto SelectById(int id)
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        ProductoDS.tbl_productoDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string descripcion, string nombre, string precio,
        string medida, string idcategoria, string id, string costo, string stock)
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        adapter.updateById(descripcion, nombre, Convert.ToDouble(precio), medida,
            Convert.ToInt32(idcategoria), 0, Convert.ToInt32(id), Convert.ToInt32(id),
            Convert.ToDouble(costo), Convert.ToInt32(stock));
    }
    public static void Delete(int id)
    {
        ProductoDSTableAdapters.tbl_productoTableAdapter adapter = new ProductoDSTableAdapters.tbl_productoTableAdapter();
        adapter.deleteRow(id);
    }
    private static Producto RowToDto(ProductoDS.tbl_productoRow row)
    {
        Producto objProducto = new Producto();
        objProducto.IdProducto = row.id;
        objProducto.Nombre = row.nombre;
        objProducto.Descripcion = row.descripcion;
        objProducto.PrecioVenta = row.precio;
        objProducto.Medida = row.medida;
        objProducto.IdCategoria = row.idcategoria;
        objProducto.Eliminado = row.eliminado;
        objProducto.Costo = row.costo;
        objProducto.Stock = row.stock;
        return objProducto;
    }
}