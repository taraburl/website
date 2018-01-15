using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ArbitroPartidoBLL
{
    public ArbitroPartidoBLL()
    {

    }
    public static List<ArbitroPartido> SelectByPartido(string idPartido)
    {
        ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter 
            adapter = new ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter();
        ArbitroPartidoDS.tbl_arbitroPartidoDataTable table =
            adapter.SelectByPartido(Convert.ToInt32(idPartido));
        List<ArbitroPartido> listArbitroPartido = new List<ArbitroPartido>();
        foreach (ArbitroPartidoDS.tbl_arbitroPartidoRow row in table)
        {
            listArbitroPartido.Add(RowToDto(row));
        }
        return listArbitroPartido;
    }
    public static ArbitroPartido InsertWithReturn(string idPartido, string idArbitro)
    {
        ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter
            adapter = new ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter();
        ArbitroPartidoDS.tbl_arbitroPartidoDataTable table =
            adapter.InsertWithReturn(Convert.ToInt32(idPartido), Convert.ToInt32(idArbitro), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Delete(string id)
    {
        ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter
            adapter = new ArbitroPartidoDSTableAdapters.tbl_arbitroPartidoTableAdapter();
        adapter.DeleteArbitroPartido(Convert.ToInt32(id));
    }
    private static ArbitroPartido RowToDto(ArbitroPartidoDS.tbl_arbitroPartidoRow row)
    {
        ArbitroPartido objArbitroPartido = new ArbitroPartido();
        objArbitroPartido.IdArbitroPartido = row.id;
        objArbitroPartido.IdArbitro = row.idArbitro;
        objArbitroPartido.IdPartido = row.idPartido;
        objArbitroPartido.Eliminado = row.eliminado;
        return objArbitroPartido;
    }
}