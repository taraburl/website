﻿using System;
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
    [WebMethod]
    public static Fixture InsertarFixture(string idEquipo, string idRival,
        string idCancha, string fecha, string hora, string idGrupo,
        string estado, string scoreEquipo, string scoreRival)
    {
        Fixture objFixture = FixtureBLL.InsertWithReturn(idEquipo, idRival,
            idCancha, fecha, hora, idGrupo, estado, scoreEquipo, scoreRival);
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
        string estado, string scoreEquipo, string scoreRival, string idFixture)
    {
        FixtureBLL.UpdateFixture(idEquipo, idRival, idCancha, fecha, hora, idGrupo,
            estado, scoreEquipo, scoreRival, idFixture);
        Fixture objFixture = FixtureBLL.SelectById(Convert.ToInt32(idFixture));
        return objFixture;
    }

}