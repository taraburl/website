using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Usuario
{
    public Usuario()
    {
    }
    public int IdUsuario { get; set; }
    public String Nombre { get; set; }
    public String Apellido { get; set; }
    public String Email { get; set; }
    public String Telefono { set; get; }
    public String Celular { get; set; }
    public String Direccion { get; set; }
    public String Username { get; set; }
    public String Password { get; set; }
    public String TipoCliente { get; set; }
    public String Imagen { get; set; }
    public int IdCiudad { get; set; }
    public int Eliminado { get; set; }
}