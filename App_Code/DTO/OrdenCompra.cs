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
    public Double Total { get; set; }
    public int Eliminado { get; set; }
    public EstadoCompra Estado
    {
        get
        {
            return EstadoCompraBLL.SelectById(Convert.ToString(IdEstadoCompra));
        }
    }

    public Usuario Usuario
    {
        get
        {
            return UsuarioBLL.SelectById(IdUsuario);
        }
    }
    public TipoPago TipoPago
    {
        get
        {
            return TipoPagoBLL.SelectById(IdTipoPago);
        }
    }
}
