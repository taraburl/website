using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Carrito
{
    public Carrito() { }

    public int IdCarrito { get; set; }
    public int IdOrdenCompra { get; set; }
    public int IdProducto { get; set; }
    public int CantidadProducto { get; set; }
    public double Precio { get; set; }
    public double Subtotal { get; set; }

}
