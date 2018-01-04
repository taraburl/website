using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Equipos
{
    public Equipos()
    {

    }
    public int IdEquipo { get; set; }
    public String Nombre { get; set; }
    public int IdEvento { get; set; }
    public int Eliminado { get; set; }
    public Evento Evento
    {
        get
        {
            return EventoBLL.SelectById(IdEvento);
        }
    }
}