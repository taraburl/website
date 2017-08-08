using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class SponsorsBLL
{
    public SponsorsBLL()
    {

    }

    public static Sponsor InsertWithReturn(string nombre, string modulo, string urlimage, byte eliminado)
    {
        SponsorDSTableAdapters.tbl_sponsorsTableAdapter adapter = new SponsorDSTableAdapters.tbl_sponsorsTableAdapter();
        SponsorDS.tbl_sponsorsDataTable table = adapter.InsertWithReturn(nombre, modulo, urlimage, eliminado);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Sponsor SelectById(int id)
    {
        SponsorDSTableAdapters.tbl_sponsorsTableAdapter adapter = new SponsorDSTableAdapters.tbl_sponsorsTableAdapter();
        SponsorDS.tbl_sponsorsDataTable table = adapter.SelectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string modulo, int id)
    {
        SponsorDSTableAdapters.tbl_sponsorsTableAdapter adapter = new SponsorDSTableAdapters.tbl_sponsorsTableAdapter();
        adapter.UpdateById(nombre, modulo, "S/I",0, id, id);
    }
    public static void Delete(int id)
    {
        SponsorDSTableAdapters.tbl_sponsorsTableAdapter adapter = new SponsorDSTableAdapters.tbl_sponsorsTableAdapter();
        adapter.DeleteRow(id);
    }
    private static Sponsor RowToDto(SponsorDS.tbl_sponsorsRow row)
    {
        Sponsor objSponsor = new Sponsor();
        objSponsor.IdSponsor = row.id;
        objSponsor.Nombre = row.nombre;
        objSponsor.Modulo = row.modulo;
        objSponsor.UrlImage = row.imageurl;
        objSponsor.Eliminado = row.eliminado;
        return objSponsor;
    }
}