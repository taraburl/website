using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Inventario
{
    public Inventario()
    {
    }

    public int IdInventario { get; set; }
    public String Tipo { get; set; }
    public int IdUsuario { get; set; }
    public String Glosa { get; set; }
    public int Eliminado { get; set; }
    public DateTime Fecha { get; set; }
    public TimeSpan Hora { get; set; }
    public int Estado { get; set; }
    public Usuario Usuario
    {
        get
        {
            return UsuarioBLL.SelectById(IdUsuario);
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
            return Convert.ToString(Hora);
        }
    }
    public string EstadoForDisplay
    {
        get
        {
            if (Estado == 0)
            {
                return "Guardado";
            }
            else
            {
                return "Consolidado";
            }
        }
    }
}