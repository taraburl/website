using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Producto
{
    public Producto()
    {
    }
    public int IdProducto { get; set; }
    public String Nombre { get; set; }
    public String Descripcion { get; set; }
    public double PrecioVenta { get; set; }
    public String Medida { get; set; }
    public int IdCategoria { get; set; }
    public int Eliminado { get; set; }
    public Categoria Categoria
    {
        get
        {
            return CategoriaBLL.SelectById(IdCategoria);
        }
    }
}