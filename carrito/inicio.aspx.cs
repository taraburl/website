﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class carrito_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    [WebMethod]
    public static Producto TraerProducto(int idProducto)
    {
        Producto objProducto = ProductoBLL.SelectById(idProducto);
        return objProducto;
    }
}