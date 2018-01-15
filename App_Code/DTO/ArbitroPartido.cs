using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ArbitroPartido
{
    public ArbitroPartido()
    {
        
    }

    public int IdArbitroPartido { get; set; }
    public int IdPartido { get; set; }
    public int IdArbitro { get; set; }
    public int Eliminado { get; set; }
    public Fixture Partido
    {
        get
        {
            return FixtureBLL.SelectById(IdPartido);
        }
    }
    public Jugador Arbitro
    {
        get
        {
            return JugadorBLL.SelectById(IdArbitro);
        }
    }
}