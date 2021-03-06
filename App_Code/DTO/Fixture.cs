﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Fixture
{
    public Fixture()
    {

    }
    public int IdFixture { get; set; }
    public int IdEquipo { get; set; }
    public int IdRival { get; set; }
    public int IdCancha { get; set; }
    public DateTime Fecha { get; set; }
    public TimeSpan Hora { get; set; }
    public int Eliminado { get; set; }
    public int IdGrupo { get; set; }
    public string Estado { get; set; }
    public int ScoreEquipo { get; set; }
    public int ScoreRival { get; set; }
    public int Puntos { get; set; }
    public Grupo Grupo
    {
        get
        {
            return GrupoBLL.SelectById(IdGrupo);
        }
    }
    public Evento Evento
    {
        get
        {
            Grupo grupo = GrupoBLL.SelectById(IdGrupo);
            return EventoBLL.SelectById(grupo.IdEvento);
        }
    }
    public Equipos Equipo
    {
        get
        {
            return EquipoBLL.SelectById(IdEquipo);
        }
    }
    public Equipos Rival
    {
        get
        {
            return EquipoBLL.SelectById(IdRival);
        }
    }
    public Cancha Cancha
    {
        get
        {
            return CanchaBLL.SelectById(IdCancha);
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
    public DateTime HoraCompleta
    {
        get
        {
            return Convert.ToDateTime(Fecha.ToShortDateString() + " " + HoraForDisplay);
        }
    }
    public string Partido
    {
        get
        {
            return Equipo.Nombre + "  VS  " + Rival.Nombre;
        }
    }
}