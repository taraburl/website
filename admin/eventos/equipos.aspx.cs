using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_equipos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Equipos InsertarEquipo(string nombre, string idEvento)
    {
        Equipos objEquipoModelo = EquipoBLL.SelectCantActual(Convert.ToInt32(idEvento));
        int cantidadActual = objEquipoModelo.IdEvento;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadEquipos;
        if (cantidadActual < cantidadPermitida)
        {
            Equipos objEquipo = EquipoBLL.InsertWithReturn(nombre, Convert.ToInt32(idEvento));
            return objEquipo;
        }
        else
        {
            Equipos objEquipo = new Equipos();
            objEquipo.Nombre = "NO";
            return objEquipo;
        }
    }
    [WebMethod]
    public static Equipos TraerEquipo(int idEquipo)
    {
        Equipos objEquipo = EquipoBLL.SelectById(idEquipo);
        return objEquipo;
    }
    [WebMethod]
    public static Equipos ActualizarEquipo(string nombre, string idEvento, string id)
    {
        Equipos objEquipoModelo = EquipoBLL.SelectCantActual(Convert.ToInt32(idEvento));
        int cantidadActual = objEquipoModelo.IdEvento;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadEquipos;
        if (cantidadActual <= cantidadPermitida)
        {
            EquipoBLL.Update(nombre, Convert.ToInt32(idEvento), Convert.ToInt32(id));
            Equipos objEquipo = EquipoBLL.SelectById(Convert.ToInt32(id));
            return objEquipo;
        }
        else
        {
            Equipos objEquipo = new Equipos();
            objEquipo.Nombre = "NO";
            return objEquipo;
        }
    }
    [WebMethod]
    public static int EliminarEquipo(int idEquipo)
    {
        try
        {
            EquipoBLL.Delete(idEquipo);
            return idEquipo;
        }
        catch (Exception)
        {
            return -1;
        }

    }
    [WebMethod]
    public static List<JugadorEquipo> TraerJugadoresEquipo(int idEquipo)
    {
        List<JugadorEquipo> listJugadores = JugadorEquipoBLL.SelectByTipo(idEquipo);
        return listJugadores;
    }
    [WebMethod]
    public static JugadorEquipo InsertarJugadorEquipo(string nombre,string posicion, string idEquipo)
    {
        Equipos objEquipo = EquipoBLL.SelectById(Convert.ToInt32(idEquipo));
        int idEvento = objEquipo.IdEvento;
        JugadorEquipo objEquipoModelo = JugadorEquipoBLL.SelectCantidadActualJugadores(Convert.ToInt32(idEquipo));
        int cantidadActual = objEquipoModelo.IdEquipo;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadJugadoresPorEquipo;
        if (cantidadActual < cantidadPermitida)
        {
            JugadorEquipo objJugadorEquipo = JugadorEquipoBLL.InsertWithReturn(nombre, posicion, Convert.ToInt32(idEquipo));
            return objJugadorEquipo;
        }
        else
        {
            JugadorEquipo objJugadorEquipo = new JugadorEquipo();
            objJugadorEquipo.Nombre = "NO";
            return objJugadorEquipo;
        }
    }
    [WebMethod]
    public static JugadorEquipo TraerJugadorEquipo(int idJugadorEquipo)
    {
        JugadorEquipo objJugadorEquipo = JugadorEquipoBLL.SelectById(idJugadorEquipo);
        return objJugadorEquipo;
    }
    [WebMethod]
    public static JugadorEquipo ActualizarJugadorEquipo(string nombre, string posicion, string idEquipo, string id)
    {
        Equipos objEquipo = EquipoBLL.SelectById(Convert.ToInt32(idEquipo));
        int idEvento = objEquipo.IdEvento;
        JugadorEquipo objEquipoModelo = JugadorEquipoBLL.SelectCantidadActualJugadores(Convert.ToInt32(idEquipo));
        int cantidadActual = objEquipoModelo.IdEquipo;
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(idEvento));
        int cantidadPermitida = objEvento.CantidadJugadoresPorEquipo;
        if (cantidadActual <= cantidadPermitida)
        {
            JugadorEquipoBLL.Update(nombre,posicion, Convert.ToInt32(idEquipo), Convert.ToInt32(id));
            JugadorEquipo objJugadorEquipo = JugadorEquipoBLL.SelectById(Convert.ToInt32(id));
            return objJugadorEquipo;
        }
        else
        {
            JugadorEquipo objJugadorEquipo = new JugadorEquipo();
            objJugadorEquipo.Nombre = "NO";
            return objJugadorEquipo;
        }
    }
    [WebMethod]
    public static int EliminarJugadorEquipo(int idEquipo)
    {
        try
        {
            JugadorEquipoBLL.Delete(idEquipo);
            return idEquipo;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}