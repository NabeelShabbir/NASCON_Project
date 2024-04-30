using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChooseRegistrationRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void chooseRoleButton(object sender, EventArgs e)
    {
        bool roleSelected = false;
        String role = null;

        //if (studentexecRadioButton.Checked)
        //{
        //    role = studentexecRadioButton.Text;
        //    roleSelected = true;
        //} else
        if (facultyRadioButton.Checked)
        {
            role = facultyRadioButton.Text;
            roleSelected = true;
        }
        else if (participantRadioButton.Checked)
        {
            role = participantRadioButton.Text;
            roleSelected = true;
        }
        else if (sponsorRadioButton.Checked)
        {
            role = sponsorRadioButton.Text;
            roleSelected = true;
        }

        if (roleSelected)
        {
            Response.Write("<script>alert('Role:" + role + "');</script>");
            Session["Role"] = role;
            Response.Redirect("Registration.aspx");
        } else
        {
            Response.Write("<script>alert('Choose a user role!');</script>");
        }
    }
}