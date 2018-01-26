using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UsuarioBLL
{
    public UsuarioBLL()
    {
    }
    public static Usuario InsertWithReturn(string nombre, string apellidos, string email, string telefono,
        string celular, string direccion, string username, string password, string tipo,
        string imagen, int idciudad, int eliminado)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        UsuarioDS.tbl_usuariosDataTable table = adapter.InsertWithReturn(nombre, apellidos, email, telefono, celular,
            direccion, username, password, tipo, imagen, idciudad, eliminado);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string nombre, string apellidos, string email, string telefono,
        string celular, string direccion, string username, string password, string tipo,
        string imagen, int idciudad, int idUser)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        adapter.UpdateById(nombre, apellidos, email, telefono, celular, direccion, username, password, tipo, imagen, idciudad, 0, idUser, idUser);
    }
    public static void UpdatePassword(string password, string idUser)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        adapter.UpdatePassword(password, Convert.ToInt32(idUser));
    }
    public static void Delete(int id)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        adapter.DeleteRow(id);
    }
    public static List<Usuario> SelectAll()
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        UsuarioDS.tbl_usuariosDataTable table = adapter.selectNoEliminados();
        List<Usuario> listaUsers = new List<Usuario>();
        foreach (UsuarioDS.tbl_usuariosRow row in table)
        {
            listaUsers.Add(RowToDto(row));
        }
        return listaUsers;
    }
    public static Usuario SelectById(int id)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        UsuarioDS.tbl_usuariosDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Usuario SelectByNamePassword(string userName, string password)
    {
        UsuarioDSTableAdapters.tbl_usuariosTableAdapter adapter = new UsuarioDSTableAdapters.tbl_usuariosTableAdapter();
        UsuarioDS.tbl_usuariosDataTable table = adapter.SelectByNamePassword(userName, password);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    private static Usuario RowToDto(UsuarioDS.tbl_usuariosRow row)
    {
        Usuario objUser = new Usuario();
        objUser.IdUsuario = row.id;
        objUser.Nombre = row.nombre;
        objUser.Apellido = row.apellidos;
        objUser.Telefono = row.telefono;
        objUser.Email = row.email;
        objUser.Celular = row.celular;
        objUser.Direccion = row.direccion;
        objUser.Username = row.username;
        objUser.Password = row.password;
        objUser.TipoCliente = row.tipo;
        objUser.Imagen = row.imagem;
        objUser.IdCiudad = row.idCiudad;
        objUser.Eliminado = row.eliminado;
        return objUser;
    }
}