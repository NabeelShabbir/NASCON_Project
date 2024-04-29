using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sponsor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            usernameLabel.Text = Session["username"].ToString();
            nameLabel.Text = Session["fullname"].ToString();
            emailLabel.Text = Session["email"].ToString();
            phoneLabel.Text = Session["phone"].ToString();
        }
    }
}