﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_eventos_jugadores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String form = Request.QueryString["ID"];
        hdnEquipo.Value = form;
    }
}