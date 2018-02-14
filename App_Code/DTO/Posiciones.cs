using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Posiciones
{
    public Posiciones()
    {

    }
    public int IdPosiciones { get; set; }
    public int IdGrupo { get; set; }
    public int IdEquipo { get; set; }
    public int PartidosJugados { get; set; }
    public int Ganados { get; set; }
    public int Empates { get; set; }
    public int Perdidos { get; set; }
    public int GolesFavor { get; set; }
    public int GolesContra { get; set; }
    public int Diferencia { get; set; }
    public int Puntos { get; set; }
    public int Eliminado { get; set; }
    public Grupo Grupo
    {
        get
        {
            return GrupoBLL.SelectById(IdGrupo);
        }
    }
    public Equipos Equipo
    {
        get
        {
            return EquipoBLL.SelectById(IdEquipo);
        }
    }
    public Evento Evento
    {
        get
        {
            return EventoBLL.SelectById(Grupo.IdEvento);
        }
    }
}