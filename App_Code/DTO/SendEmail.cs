using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;


/// <summary>
/// Descripción breve de SendEmail
/// </summary>
public class SendEmail
{
    public SendEmail(String de,String nombre, String asunto, String mensaje)
    {
        /*-------------------------MENSAJE DE CORREO----------------------*/

        //Creamos un nuevo Objeto de mensaje
        System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

        //Direccion de correo electronico a la que queremos enviar el mensaje
        mmsg.To.Add("luis_tj103@hotmail.com");

        //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

        //Asunto
        mmsg.Subject = asunto;
        mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

        //Direccion de correo electronico que queremos que reciba una copia del mensaje
        //mmsg.Bcc.Add("destinatariocopia@servidordominio.com"); //Opcional

        //Cuerpo del Mensaje
        mmsg.Body = "DE: " + de + "\n NOMBRE: " + nombre+ "\n NMENSAJE: " +mensaje;
        mmsg.BodyEncoding = System.Text.Encoding.UTF8;
        mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML

        //Correo electronico desde la que enviamos el mensaje
        mmsg.From = new System.Net.Mail.MailAddress("luistj103@gmail.com");


        /*-------------------------CLIENTE DE CORREO----------------------*/

        //Creamos un objeto de cliente de correo
        System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

        //Hay que crear las credenciales del correo emisor
        cliente.Credentials =
            new System.Net.NetworkCredential("luistj103@gmail.com", "notodoeslokeparese103");

        //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail
        /*
        cliente.Port = 587;
        cliente.EnableSsl = true;
        */

        cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";


        /*-------------------------ENVIO DE CORREO----------------------*/

        try
        {
            //Enviamos el mensaje      
            cliente.Send(mmsg);
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            //Aquí gestionamos los errores al intentar enviar el correo
        }
    }
}