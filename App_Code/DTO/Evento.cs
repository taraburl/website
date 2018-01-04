using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Evento
{
    public Evento()
    {

    }
    public int IdEvento { get; set; }
    public String Nombre { get; set; }
    public String Categoria { get; set; }
    public String Descripcion { get; set; }
    public DateTime FechaInico { get; set; }
    public DateTime FechaFin { get; set; }
    public int CantidadGrupos { get; set; }
    public int CantidadEquipos { get; set; }
    public int CantidadJugadoresPorEquipo { get; set; }
    public int Eliminado { get; set; }
    public string FechaInicioForDisplay
    {
        get
        {
            return FechaInico.ToString("dd/MM/yyyy");
        }
    }
    public string FechaFinForDisplay
    {
        get
        {
            return FechaFin.ToString("dd/MM/yyyy");
        }
    }
}