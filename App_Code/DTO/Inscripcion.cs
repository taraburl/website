using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Inscripcion
{
    public Inscripcion()
    {

    }
    public int IdInscripcion { get; set; }
    public int IdCategoria { get; set; }
    public int IdUsuario { get; set; }
    public int IdTipoPago { get; set; }
    public double Total { get; set; }
    public int Estado { get; set; }
    public int Eliminado { get; set; }
    public string Inscrito { get; set; }
    public Usuario Usuario
    {
        get
        {
            return UsuarioBLL.SelectById(IdUsuario);
        }
    }
    public CategoriaAcademia Categoria
    {
        get
        {
            return CategoriaAcademiaBLL.SelectById(IdCategoria);
        }
    }
    public TipoPago TipoPago
    {
        get
        {
            return TipoPagoBLL.SelectById(IdTipoPago);
        }
    }
}