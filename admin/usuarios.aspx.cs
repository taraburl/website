using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_Usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int EliminarUsuario(int idUsuario)
    {
        try
        {
            UsuarioBLL.Delete(idUsuario);
            return idUsuario;
        }
        catch (Exception)
        {
            return -1;
        }

    }
    [WebMethod]
    public static Usuario InsertarUsuario(string nombre, string apellido, string email, string telefono,
        string celular, string direccion, string username, string password, string tipo)
    {
        Usuario objTrasnporteInsertado = UsuarioBLL.InsertWithReturn(nombre, apellido, email, telefono, celular, username, direccion, password,
            tipo, "images/profile.png", 1, 0);
        return objTrasnporteInsertado;
    }
    [WebMethod]
    public static Usuario TraerUser(int idUser)
    {
        Usuario objUsuario = UsuarioBLL.SelectById(idUser);
        return objUsuario;
    }
    [WebMethod]
    public static Usuario ActualizarUser(string nombre, string apellido, string email, string telefono,
        string celular, string direccion, string username, string password, string tipo, string idUser)
    {
        UsuarioBLL.Update(nombre, apellido, email, telefono, celular, username, direccion, password, tipo, "images/profile.png", 1, Convert.ToInt32(idUser));
        Usuario objUsuario = UsuarioBLL.SelectById(Convert.ToInt32(idUser));
        return objUsuario;
    }
}