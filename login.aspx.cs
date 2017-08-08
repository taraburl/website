using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String form = Request.QueryString["form"];
        if (form == "login")
        {
            LogIn.Style["display"] = "block";
            SignUp.Style["display"] = "none";
        }
        else if (form == "signup")
        {
            LogIn.Style["display"] = "none";
            SignUp.Style["display"] = "block";
        }
    }
    [WebMethod]
    public static Usuario LogInUser(String username, String password)
    {
        Usuario objLog = UsuarioBLL.SelectByNamePassword(username, password);
        return objLog;
    }
    [WebMethod]
    public static Usuario SignUpUser(string nombre, string apellido,string email, string username, string password)
    {
        Usuario objUserInserted = UsuarioBLL.InsertWithReturn(nombre, apellido, email, "0", "0", username, "0", password,
            "Usuario Normal", "images/profile.png", 1, 0);
        return objUserInserted;
    }
}