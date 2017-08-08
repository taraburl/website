using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Sponsor
{
    public Sponsor()
    {
    }
    public int IdSponsor { get; set; }
    public String Nombre { get; set; }
    public String Modulo { get; set; }
    public String UrlImage { get; set; }
    public int Eliminado { get; set; }

}