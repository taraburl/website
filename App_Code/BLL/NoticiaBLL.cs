using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class NoticiaBLL
{
    public NoticiaBLL()
    {

    }
    public static List<Noticia> SelectAll()
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        NoticiaDS.tbl_noticiasDataTable table = adapter.SelectNoEliminados();
        List<Noticia> listNoticia = new List<Noticia>();
        foreach (NoticiaDS.tbl_noticiasRow row in table)
        {
            listNoticia.Add(RowToDto(row));
        }
        return listNoticia;
    }
    public static List<Noticia> SelectByEvento(string id)
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        NoticiaDS.tbl_noticiasDataTable table = adapter.SelectByEvento(Convert.ToInt32(id));
        List<Noticia> listNoticia = new List<Noticia>();
        foreach (NoticiaDS.tbl_noticiasRow row in table)
        {
            listNoticia.Add(RowToDto(row));
        }
        return listNoticia;
    }
    public static Noticia InsertWithReturn(string titulo, string descripcion, string fecha, int idEvento)
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        NoticiaDS.tbl_noticiasDataTable table =
            adapter.InsertWithReturn(titulo, descripcion, Convert.ToDateTime(fecha), 0, idEvento);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Noticia SelectById(int id)
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        NoticiaDS.tbl_noticiasDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string titulo, string descripcion, string fecha, int id, int idEvento)
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        adapter.UpdateNoticia(titulo, descripcion, Convert.ToDateTime(fecha), 0, id, id, idEvento);
    }
    public static void Delete(int id)
    {
        NoticiaDSTableAdapters.tbl_noticiasTableAdapter adapter =
            new NoticiaDSTableAdapters.tbl_noticiasTableAdapter();
        adapter.DeleteNoticia(id);
    }
    private static Noticia RowToDto(NoticiaDS.tbl_noticiasRow row)
    {
        Noticia objNoticia = new Noticia();
        objNoticia.IdNoticia = row.id;
        objNoticia.Titulo = row.titulo;
        objNoticia.Descripcion = row.descripcion;
        objNoticia.Fecha = row.fecha;
        objNoticia.idEvento = row.idEvento;
        objNoticia.Eliminado = row.eliminado;
        return objNoticia;
    }
}