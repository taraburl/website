using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class carrito_Evento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Eventos";
    }
    [WebMethod]
    public static List<Grupo> ListarGrupos(int idEvento)
    {
        List<Grupo> listGrupo = GrupoBLL.SelectByEvento(idEvento);
        return listGrupo;
    }
    [WebMethod]
    public static List<GrupoEquipoCL> ListarEquipos(int idGrupo)
    {
        List<GrupoEquipoCL> listGrupoEquipoCL = GrupoEquipoBLL.SelectByGrupo(idGrupo);
        return listGrupoEquipoCL;
    }

}