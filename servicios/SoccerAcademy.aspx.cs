﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class servicios_SoccerAcademy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Academia de Fútbol";
    }
}