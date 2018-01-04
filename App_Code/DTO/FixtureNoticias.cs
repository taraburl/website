using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class FixtureNoticias
{
    public FixtureNoticias()
    {

    }
    public int Id { get; set; }
    public int IdPartido { get; set; }
    public int IdJugador { get; set; }
    public string Tipo { get; set; }
    public string Descripcion { get; set; }
    public DateTime Fecha { get; set; }
    public TimeSpan Hora { get; set; }
    public int Eliminado { get; set; }
    public Equipos Partido
    {
        get
        {
            return EquipoBLL.SelectById(IdPartido);
        }
    }
    public JugadorEquipo Jugador
    {
        get
        {
            return JugadorEquipoBLL.SelectById(IdJugador);
        }
    }
    public string FechaForDisplay
    {
        get
        {
            return Fecha.ToString("dd/MM/yyyy");
        }
    }
    public string HoraForDisplay
    {
        get
        {
            return Hora.ToString();
        }
    }

}