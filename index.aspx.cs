using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void EnviarMail(object sender, EventArgs e)
    {
        String de = name.Text;
        String emailde = email.Text;
        String asuntode = asunto.Text;
        String mensajede = comment.Text;
        new SendEmail(emailde, de, asuntode, mensajede,"luistj103@gmail.com","Luis Taraune");
    }

}