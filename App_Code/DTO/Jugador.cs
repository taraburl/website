using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Jugador
{
    public Jugador()
    {
        
    }
    public int IdJugador { get; set; }
    public String Nombre { get; set; }
    public String Tipo { get; set; }
    public int Edad { get; set; }
    public int Eliminado { get; set; }
}