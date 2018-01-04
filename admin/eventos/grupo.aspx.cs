using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_grupo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Grupo InsertarGrupo(string nombre, string idEvento)
    {
        Grupo objGrupoModelo = GrupoBLL.SelectCantActual(Convert.ToInt32(idEvento));
        int cantidadActual = objGrupoModelo.IdEvento;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadGrupos;
        if (cantidadActual < cantidadPermitida)
        {
            Grupo objGrupo = GrupoBLL.InsertWithReturn(nombre, idEvento);
            return objGrupo;
        }
        else
        {
            Grupo objGrupo = new Grupo();
            objGrupo.Nombre = "NO";
            return objGrupo;
        }
    }
    [WebMethod]
    public static List<Grupo> TraerGruposEvento(string idEvento)
    {
        List<Grupo> listGrupo = GrupoBLL.SelectByEvento(Convert.ToInt32(idEvento));
        return listGrupo;
    }
    [WebMethod]
    public static Grupo TraerGrupo(int idGrupo)
    {
        Grupo objGrupo = GrupoBLL.SelectById(idGrupo);
        return objGrupo;
    }
    [WebMethod]
    public static Grupo ActualizarGrupo(string nombre, string idEvento, string id)
    {
        Grupo objGrupoModelo = GrupoBLL.SelectCantActual(Convert.ToInt32(idEvento));
        int cantidadActual = objGrupoModelo.IdEvento;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadGrupos;
        if (cantidadActual < cantidadPermitida)
        {
            GrupoBLL.Update(nombre, idEvento, Convert.ToInt32(id));
            Grupo objGrupo = GrupoBLL.SelectById(Convert.ToInt32(id));
            return objGrupo;
        }
        else
        {
            Grupo objGrupo = new Grupo();
            objGrupo.Nombre = "NO";
            return objGrupo;
        }
    }
    [WebMethod]
    public static int EliminarGrupo(int idGrupo)
    {
        try
        {
            GrupoBLL.Delete(idGrupo);
            return idGrupo;
        }
        catch (Exception)
        {
            return -1;
        }
    }
    [WebMethod]
    public static List<Equipos> TraerEquipos(int idGrupo)
    {
        Grupo objGrupo = GrupoBLL.SelectById(idGrupo);
        int idEvento = objGrupo.IdEvento;
        List<Equipos> objEquipo = EquipoBLL.SelectByEvento(idEvento);
        return objEquipo;
    }

    [WebMethod]
    public static List<GrupoEquipoCL> TraerEquiposGrupo(int idGrupo)
    {
        List<GrupoEquipoCL> objEquipo = GrupoEquipoBLL.SelectByGrupo(idGrupo);
        return objEquipo;
    }
    [WebMethod]
    public static GrupoEquipoCL InsertarGrupoEquipo(string idGrupo, string idEquipo)
    {
        GrupoEquipoCL objGrupoEquipo = GrupoEquipoBLL.InsertWithReturn(idEquipo, idGrupo);
        return objGrupoEquipo;
    }
    [WebMethod]
    public static int EliminarGrupoEquipo(int idGrupoEquipo)
    {
        try
        {
            GrupoEquipoBLL.Delete(idGrupoEquipo);
            return idGrupoEquipo;
        }
        catch (Exception)
        {
            return -1;
        }
    }
}