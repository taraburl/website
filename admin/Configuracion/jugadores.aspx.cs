using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
public partial class admin_Configuracion_jugadores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Jugador InsertarJugador(string nombre, string tipo, int edad)
    {
        Jugador objJugador = JugadorBLL.InsertWithReturn(nombre, tipo, edad);
        return objJugador;
    }
    [WebMethod]
    public static Jugador TraerJugador(int idJugador)
    {
        Jugador objJugador = JugadorBLL.SelectById(idJugador);
        return objJugador;
    }
    [WebMethod]
    public static Jugador ActualizarJugador(string nombre, string tipo, int edad, int id)
    {
        JugadorBLL.Update(nombre, tipo, edad, id);
        Jugador objJugador = JugadorBLL.SelectById(id);
        return objJugador;
    }
    [WebMethod]
    public static int EliminarJugador(int idJugador)
    {
        try
        {
            JugadorBLL.Delete(idJugador);
            return idJugador;
        }
        catch (Exception)
        {
            return -1;
        }

    }
}