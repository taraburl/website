using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_eventos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Evento InsertarEvento(string nombre, string categoria,
        string descripcion, string fechaInicio, string fechaFin, string cantidadEquipos,
        string cantidadGrupos, string jugadoresPorEquipo)
    {
        Evento objEvento = EventoBLL.InsertWithReturn(nombre, categoria, descripcion,
            Convert.ToDateTime(fechaInicio), Convert.ToDateTime(fechaFin),
            Convert.ToInt32(cantidadEquipos), Convert.ToInt32(cantidadGrupos),
            Convert.ToInt32(jugadoresPorEquipo));
        return objEvento;
    }
    [WebMethod]
    public static Evento TraerEvento(int idEvento)
    {
        Evento objEvento = EventoBLL.SelectById(idEvento);
        return objEvento;
    }
    [WebMethod]
    public static Evento ActualizarEvento(string nombre, string categoria,
        string descripcion, string fechaInicio, string fechaFin, string cantidadGrupos,
        string cantidadEquipos, string jugadoresPorEquipo,string id)
    {
        EventoBLL.Update(nombre, categoria, descripcion, Convert.ToDateTime(fechaInicio),
            Convert.ToDateTime(fechaFin), Convert.ToInt32(cantidadEquipos),
            Convert.ToInt32(cantidadGrupos), Convert.ToInt32(jugadoresPorEquipo), 
            Convert.ToInt32(id));
        Evento objEvento = EventoBLL.SelectById(Convert.ToInt32(id));
        return objEvento;
    }
    [WebMethod]
    public static int EliminarEvento(int idEvento)
    {
        try
        {
            EventoBLL.Delete(idEvento);
            return idEvento;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}