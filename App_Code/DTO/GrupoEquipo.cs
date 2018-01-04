using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GrupoEquipoCL
{
    public GrupoEquipoCL()
    {

    }

    public int Id { get; set; }
    public int IdEquipo { get; set; }
    public int IdGrupo { get; set; }
    public int Eliminado { get; set; }
    public Equipos Equipo
    {
        get
        {
            return EquipoBLL.SelectById(IdEquipo);
        }
    }
    public Grupo Grupo
    {
        get
        {
            return GrupoBLL.SelectById(IdGrupo);
        }
    }
}