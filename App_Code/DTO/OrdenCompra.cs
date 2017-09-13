using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class OrdenCompra
{
    public OrdenCompra()
    {
    }
    public int IdOrdenCompra { get; set; }
    public int IdEstadoCompra { get; set; }
    public int IdTipoPago { get; set; }
    public int IdUsuario { get; set; }
}
