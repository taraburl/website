using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class admin_eventos_fixture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region Metodos para el Fixture  
    [WebMethod]
    public static Fixture InsertarFixture(string idEquipo, string idRival,
        string idCancha, string fecha, string hora, string idGrupo,
        string estado, string scoreEquipo, string scoreRival, string puntos)
    {
        Fixture objFixture = FixtureBLL.InsertWithReturn(idEquipo, idRival,
            idCancha, fecha, hora, idGrupo, estado, scoreEquipo, scoreRival, puntos);
        return objFixture;
    }
    [WebMethod]
    public static List<Fixture> ListFixture(string idGrupo)
    {
        List<Fixture> objFixture = FixtureBLL.SelectByGrupo(idGrupo);
        return objFixture;
    }
    [WebMethod]
    public static int EliminarPartido(string idPartido)
    {
        try
        {
            FixtureBLL.Delete(idPartido);
            return Convert.ToInt32(idPartido);
        }
        catch (Exception)
        {
            return -1;
        }

    }
    [WebMethod]
    public static Fixture TraerFixture(string idFixture)
    {
        Fixture objFixture = FixtureBLL.SelectById(Convert.ToInt32(idFixture));
        return objFixture;
    }
    [WebMethod]
    public static Fixture ActualizarFixture(string idEquipo, string idRival,
        string idCancha, string fecha, string hora, string idGrupo,
        string estado, string scoreEquipo, string scoreRival, string puntos, string idFixture)
    {
        FixtureBLL.UpdateFixture(idEquipo, idRival, idCancha, fecha, hora, idGrupo,
            estado, scoreEquipo, scoreRival, puntos, idFixture);
        Fixture objFixture = FixtureBLL.SelectById(Convert.ToInt32(idFixture));
        return objFixture;
    }
    #endregion

    #region Metodos para los Arbitro
    [WebMethod]
    public static List<ArbitroPartido> ListArbitros(string idPartido)
    {
        List<ArbitroPartido> objarbitroPartido =
            ArbitroPartidoBLL.SelectByPartido(idPartido);
        return objarbitroPartido;
    }
    [WebMethod]
    public static ArbitroPartido InsertarArbitro(string idPartido, string idArbitro)
    {
        ArbitroPartido objArbitroPartido =
            ArbitroPartidoBLL.InsertWithReturn(idPartido, idArbitro);
        return objArbitroPartido;
    }
    [WebMethod]
    public static int EliminarArbitro(string idArbitro)
    {
        try
        {
            ArbitroPartidoBLL.Delete(idArbitro);
            return Convert.ToInt32(idArbitro);
        }
        catch (Exception)
        {
            return -1;
        }

    }
    #endregion
}