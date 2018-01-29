using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DetalleInventario
{
    public DetalleInventario()
    {

    }

    public int IdDetalleInventario { get; set; }
    public int IdProducto { get; set; }
    public int IdInventario { get; set; }
    public int Cantidad { get; set; }
    public Producto Producto
    {
        get
        {
            return ProductoBLL.SelectById(IdProducto);
        }
    }

}