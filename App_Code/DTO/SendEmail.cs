using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;

public class SendEmail
{
    public SendEmail(String de, String nombre, String asunto, String mensaje, string a, string anombre)
    {
        var cuerpo = "De:\n" + nombre + "\nEmail:\n" + de + "\nMensaje:\n" + mensaje;
        var fromAddress = new MailAddress("sea.website.info@gmail.com",asunto);
        var toAddress = new MailAddress(a, anombre);
        string fromPassword = "sporteventagency";
        string subject = asunto;
        string body = cuerpo;

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
        };
        using (var message = new MailMessage(fromAddress, toAddress)
        {
            Subject = subject,
            Body = body
        })
        {
            smtp.Send(message);
        }
    }
}