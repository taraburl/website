using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CarritoBLL
{
    public CarritoBLL()
    {

    }
    public static List<Carrito> SelectByOrdenCompra(string id)
    {
        CarritoDSTableAdapters.tbl_carritoTableAdapter adapter = new CarritoDSTableAdapters.tbl_carritoTableAdapter();
        CarritoDS.tbl_carritoDataTable table = adapter.SelectByOrdenCompra(Convert.ToInt32(id));
        List<Carrito> listCarrito = new List<Carrito>();
        foreach (CarritoDS.tbl_carritoRow row in table)
        {
            listCarrito.Add(RowToDto(row));
        }
        return listCarrito;
    }
    public static Carrito InsertWithReturn(string idOrdenCompra, string idProducto, 
        string cantidadProducto, string precio, string subtotal)
    {
        CarritoDSTableAdapters.tbl_carritoTableAdapter adapter = new CarritoDSTableAdapters.tbl_carritoTableAdapter();
        CarritoDS.tbl_carritoDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idOrdenCompra), 
            Convert.ToInt32(idProducto), Convert.ToInt32(cantidadProducto), Convert.ToInt32(precio),
            Convert.ToInt32(subtotal));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Carrito SelectById(int id)
    {
        CarritoDSTableAdapters.tbl_carritoTableAdapter adapter = new CarritoDSTableAdapters.tbl_carritoTableAdapter();
        CarritoDS.tbl_carritoDataTable table = adapter.SelectByOrdenCompra(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    
    private static Carrito RowToDto(CarritoDS.tbl_carritoRow row)
    {
        Carrito objCarrito = new Carrito();
        objCarrito.IdCarrito = row.idCarrito;
        objCarrito.IdOrdenCompra = row.idOrdenCompra;
        objCarrito.IdProducto = row.idProducto;
        objCarrito.CantidadProducto = row.cantidadProducto;
        objCarrito.Precio = row.precio;
        objCarrito.Subtotal = row.subtotal;
        return objCarrito;
    }
}