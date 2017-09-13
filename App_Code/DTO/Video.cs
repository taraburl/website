using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Video
{
    public Video()
    {
        
    }
    public int IdVideo { get; set; }
    public String URL { get; set; }
    public String Descripcion { get; set; }
    public String Modulo { get; set; }
    public int Eliminado { get; set; }

    public String Imagen {
        get
        {
            String[] substrings = URL.Split('=');
            String img = substrings[1];
            return img;
        }
    }
}