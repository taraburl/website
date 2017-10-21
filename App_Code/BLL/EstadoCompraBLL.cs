using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class EstadoCompraBLL
{
    public EstadoCompraBLL()
    {
        
    }
    public static List<EstadoCompra> SelectAll()
    {
        EstadoCompraDSTableAdapters.tbl_estadoCompraTableAdapter adapter = new EstadoCompraDSTableAdapters.tbl_estadoCompraTableAdapter();
        EstadoCompraDS.tbl_estadoCompraDataTable table = adapter.SelectAll();
        List<EstadoCompra> listEstadoCompra = new List<EstadoCompra>();
        foreach (EstadoCompraDS.tbl_estadoCompraRow row in table)
        {
            listEstadoCompra.Add(RowToDto(row));
        }
        return listEstadoCompra;
    }
    public static EstadoCompra SelectById(String id)
    {
        EstadoCompraDSTableAdapters.tbl_estadoCompraTableAdapter adapter = new EstadoCompraDSTableAdapters.tbl_estadoCompraTableAdapter();
        EstadoCompraDS.tbl_estadoCompraDataTable table = adapter.SelectById(Convert.ToInt32(id));
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    private static EstadoCompra RowToDto(EstadoCompraDS.tbl_estadoCompraRow row)
    {
        EstadoCompra objEstadoCompra = new EstadoCompra();
        objEstadoCompra.IdEstadoCompra = row.idEstadoCompra;
        objEstadoCompra.Nombre = row.nombre;
        return objEstadoCompra;
    }
}