using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class InscripcionBLL
{
    public InscripcionBLL()
    {

    }
    public static List<Inscripcion> SelectAll()
    {
        InscripcionesTableAdapters.tbl_inscripcionesTableAdapter adapter = new InscripcionesTableAdapters.tbl_inscripcionesTableAdapter();
        Inscripciones.tbl_inscripcionesDataTable table = adapter.SelectNoELiminados();
        List<Inscripcion> listInscripcion = new List<Inscripcion>();
        foreach (Inscripciones.tbl_inscripcionesRow row in table)
        {
            listInscripcion.Add(RowToDto(row));
        }
        return listInscripcion;
    }
    public static Inscripcion SelectById(int id)
    {
        InscripcionesTableAdapters.tbl_inscripcionesTableAdapter adapter = new InscripcionesTableAdapters.tbl_inscripcionesTableAdapter();
        Inscripciones.tbl_inscripcionesDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Inscripcion InsertWithReturn(string idCategoria, string idUsuario, string idTipoPago, string estado, string total, string inscrito)
    {
        InscripcionesTableAdapters.tbl_inscripcionesTableAdapter adapter = new InscripcionesTableAdapters.tbl_inscripcionesTableAdapter();
        Inscripciones.tbl_inscripcionesDataTable table = adapter.InsertWithReturn(Convert.ToInt32(idCategoria), Convert.ToInt32(idUsuario), Convert.ToInt32(idTipoPago), 0, Convert.ToInt32(estado), Convert.ToDouble(total), inscrito);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string estado, string id)
    {
        InscripcionesTableAdapters.tbl_inscripcionesTableAdapter adapter = new InscripcionesTableAdapters.tbl_inscripcionesTableAdapter();
        adapter.UpdateEstado(Convert.ToInt32(estado), Convert.ToInt32(id));
    }
    public static void Delete(int id)
    {
        InscripcionesTableAdapters.tbl_inscripcionesTableAdapter adapter = new InscripcionesTableAdapters.tbl_inscripcionesTableAdapter();
        adapter.DeleteRow(id);
    }
    private static Inscripcion RowToDto(Inscripciones.tbl_inscripcionesRow row)
    {
        Inscripcion objInscripciones = new Inscripcion();
        objInscripciones.IdInscripcion = row.id;
        objInscripciones.IdCategoria = row.idCategoria;
        objInscripciones.IdUsuario = row.idUsuario;
        objInscripciones.IdTipoPago = row.idTipoPago;
        objInscripciones.Total = row.total;
        objInscripciones.Estado = row.estado;
        objInscripciones.Inscrito = row.inscrito;
        objInscripciones.Eliminado = row.eliminado;
        return objInscripciones;
    }

}