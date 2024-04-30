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
            repNameLabel.Text = Session["fullname"].ToString();
            emailLabel.Text = Session["email"].ToString();
            phoneLabel.Text = Session["phone"].ToString();
            companyNameLabel.Text = Session["company"].ToString();
            categoryLabel.Text = Session["category"].ToString();
            packageLabel.Text = Session["package"].ToString();
            cnicLabel.Text = Session["cnic"].ToString();
        }
    }
}