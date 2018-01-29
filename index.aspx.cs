using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["modulo"] = "Inicio";
        name.Text = "";
        email.Text = "";
        asunto.Text = "";
        comment.Text = "";
    }

    protected void EnviarMail(object sender, EventArgs e)
    {
        String de = name.Text;
        String emailde = email.Text;
        String asuntode = asunto.Text;
        String mensajede = comment.Text;
        name.Text = "";
        email.Text = "";
        asunto.Text = "";
        comment.Text = "";
        new SendEmail(emailde, de, asuntode, mensajede, "luistj103@gmail.com", "Luis Taraune");
    }
}