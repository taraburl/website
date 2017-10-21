using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class OrdenCompraBLL
{
    public OrdenCompraBLL()
    {

    }
    public static OrdenCompra InsertWithReturn(string idEstadoCompra, string idTipoPago,
        string idUsuario, string total)
    {
        OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter adapter = new OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter();
        OrdenCompraDS.tbl_ordenCompraDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idEstadoCompra),
            Convert.ToInt32(idTipoPago), Convert.ToInt32(idUsuario), Convert.ToDouble(total), 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static OrdenCompra SelectById(int id)
    {
        OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter adapter = new OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter();
        OrdenCompraDS.tbl_ordenCompraDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    private static OrdenCompra RowToDto(OrdenCompraDS.tbl_ordenCompraRow row)
    {
        OrdenCompra objOrdenCompra = new OrdenCompra();
        objOrdenCompra.IdOrdenCompra = row.idOrdenCompra;
        objOrdenCompra.IdEstadoCompra = row.idEstadoCompra;
        objOrdenCompra.IdTipoPago = row.idTipoPago;
        objOrdenCompra.IdUsuario = row.idUsuario;
        objOrdenCompra.Total = row.total;
        objOrdenCompra.Eliminado = row.eliminado;
        return objOrdenCompra;
    }
}