using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class JugadorEquipo
{
    public JugadorEquipo()
    {

    }

    public int IdJugadorEquipo { get; set; }
    public string Nombre { get; set; }
    public string Posicion { get; set; }
    public int IdEquipo { get; set; }
    public int Eliminado { get; set; }
    public Equipos Equipo
    {
        get
        {
            return EquipoBLL.SelectById(IdEquipo);
        }
    }
}