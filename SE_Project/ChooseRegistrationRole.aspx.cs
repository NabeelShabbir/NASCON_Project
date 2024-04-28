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

    protected void roleButton_Click(object sender, EventArgs e)
    {
        bool roleSelected = false;
        String role = null;
        foreach (RadioButton radioButton in this.Controls.OfType<RadioButton>())
        {
            if (radioButton.Checked && radioButton.GroupName == "userRole")
            {
                roleSelected = true;
                role = radioButton.Text;
                break;
            }
        }

        if (roleSelected && role is not null)
        {
            Session["Role"] = role;
            Response.Redirect("Registration.aspx");
        } else
        {
            Response.Write("<script>alert(Choose a user role!);</script>");
        }
    }
}