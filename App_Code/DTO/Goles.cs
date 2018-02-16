using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Goles
{
    public Goles()
    {

    }
    public int IdGoles { get; set; }
    public int IdJugador { get; set; }
    public int PartidosJugados { get; set; }
    public int Gol { get; set; }
    public int Eliminado { get; set; }
    public JugadorEquipo Jugador
    {
        get
        {
            return JugadorEquipoBLL.SelectById(IdJugador);
        }
    }

}