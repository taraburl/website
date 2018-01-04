using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Grupo
{
    public Grupo()
    {

    }

    public int IdGrupo { get; set; }
    public string Nombre { get; set; }
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