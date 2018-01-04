using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class OrdenCompraBLL
{
    public OrdenCompraBLL()
    {

    }
    public static List<OrdenCompra> SelectAll()
    {
        OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter adapter = new OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter();
        OrdenCompraDS.tbl_ordenCompraDataTable table = adapter.selectNoEliminados();
        List<OrdenCompra> listOrdenCompra = new List<OrdenCompra>();
        foreach (OrdenCompraDS.tbl_ordenCompraRow row in table)
        {
            listOrdenCompra.Add(RowToDto(row));
        }
        return listOrdenCompra;
    }
    public static OrdenCompra InsertWithReturn(string idEstadoCompra, string idTipoPago,
        string idUsuario, string total)
    {
        OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter adapter = new OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter();
        OrdenCompraDS.tbl_ordenCompraDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idEstadoCompra),
            Convert.ToInt32(idTipoPago), Convert.ToInt32(idUsuario), Convert.ToDouble(total), 0, DateTime.Now, TimeSpan.Parse(DateTime.Now.ToString("hh:mm:ss")));
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
    public static void UpdateOrden(string estado, string idOrden)
    {
        OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter adapter = new OrdenCompraDSTableAdapters.tbl_ordenCompraTableAdapter();
        adapter.UpdateOrden(Convert.ToInt32(estado), Convert.ToInt32(idOrden));
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
        objOrdenCompra.Fecha = row.fecha;
        objOrdenCompra.Hora = row.hora;
        return objOrdenCompra;
    }
}