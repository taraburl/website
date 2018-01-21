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
    public int IdFixture { get; set; }
    public int IdEquipo { get; set; }
    public int IdJugador { get; set; }
    public string Tipo { get; set; }
    public string Descripcion { get; set; }
    public DateTime Fecha { get; set; }
    public TimeSpan Hora { get; set; }
    public int Eliminado { get; set; }
    public Equipos Equipo
    {
        get
        {
            return EquipoBLL.SelectById(IdEquipo);
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

    public Fixture Partido
    {
        get
        {
            return FixtureBLL.SelectById(IdFixture);
        }
    }


}