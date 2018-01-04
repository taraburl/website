using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Noticia
{
    public Noticia()
    {

    }
    public int IdNoticia { get; set; }
    public String Titulo { get; set; }
    public String Descripcion { get; set; }
    public DateTime Fecha { get; set; }
    public int Eliminado { get; set; }
    public string FechaForDisplay
    {
        get
        {
            return Fecha.ToString("dd/MM/yyyy");
        }
    }
}
