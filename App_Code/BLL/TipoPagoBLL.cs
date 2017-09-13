using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TipoPagoBLL
{
    public TipoPagoBLL()
    {
        
    }

    public static TipoPago InsertWithReturn(string nombre)
    {
        TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter adapter = new TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter();
        TipoPagoDS.tbl_tipoPagoDataTable table = adapter.InsertWithReturn(nombre, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static List<TipoPago> SelectAll()
    {
        TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter adapter = new TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter();
        TipoPagoDS.tbl_tipoPagoDataTable table = adapter.selectNoEliminados();
        List<TipoPago> listTipoPago = new List<TipoPago>();
        foreach (TipoPagoDS.tbl_tipoPagoRow row in table)
        {
            listTipoPago.Add(RowToDto(row));
        }
        return listTipoPago;
    }
    public static TipoPago SelectById(int id)
    {
        TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter adapter = new TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter();
        TipoPagoDS.tbl_tipoPagoDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, int id)
    {
        TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter adapter = new TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter();
        adapter.UpdateById(nombre, 0, id, id);
    }
    public static void Delete(int id)
    {
        TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter adapter = new TipoPagoDSTableAdapters.tbl_tipoPagoTableAdapter();
        adapter.DeleteRow(id);
    }
    private static TipoPago RowToDto(TipoPagoDS.tbl_tipoPagoRow row)
    {
        TipoPago objTipoPago = new TipoPago();
        objTipoPago.IdTipoPago = row.idTipoPago;
        objTipoPago.Nombre = row.nombre;
        objTipoPago.Eliminado = row.eliminado;
        return objTipoPago;
    }
}