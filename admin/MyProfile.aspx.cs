using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static Usuario TraerUser(int idUser)
    {
        Usuario objUsuario = UsuarioBLL.SelectById(idUser);
        return objUsuario;
    }
}