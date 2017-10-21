using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CategoriaAcademia
{
    public CategoriaAcademia()
    {
        
    }
    public int IdCategoriaAcademia { get; set; }
    public String Nombre { get; set; }
    public String Descripcion { get; set; }
    public double PrecioVenta { get; set; }
    public int Eliminado { get; set; }
}