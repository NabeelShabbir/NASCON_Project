using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Student_Executive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            usernameLabel.Text = Session["username"].ToString();
            nameLabel.Text = Session["fullname"].ToString();
            if (Session["email"].ToString() is (not null))
            {
                emailLabel.Text = Session["email"].ToString();
            } else
            {
                emailLabel.Text = "Unassigned, Ask a Faculty Mentor to assign one.";
            }
            if (Session["phone"].ToString() is (not null))
            {
                phoneLabel.Text = Session["phone"].ToString();
            }
            else
            {
                phoneLabel.Text = "Unassigned, Ask a Faculty Mentor to assign one.";
            }
        }
    }
}