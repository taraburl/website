using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Carrito
{
    public Carrito() { }

    public int idCarrito { get; set; }
    public int EstadoCarrito { get; set; }
    public int idOrdenCompra { get; set; }
    public int idProducto { get; set; }
    public int CantidadProducto { get; set; }

}
