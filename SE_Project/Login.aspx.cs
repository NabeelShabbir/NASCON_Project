using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginEventMethod(object sender, EventArgs e) 
    {
        bool roleSelected = false;
        string role = null;
        foreach (RadioButton radioButton in this.Controls.OfType<RadioButton>())
        {
            if (radioButton.Checked && radioButton.GroupName == "userRole")
            {
                roleSelected = true;
                role = radioButton.Text;
                break;
            }
        }

        if (roleSelected)
        {
            // Actual Login logic goes here
            string tablename = null;
            switch (role)
            {
                case "Administrator":
                    tablename = "Administrators";
                    break;
                case "Student Executive":
                    tablename = "StudentExecutives";
                    break;
                case "Faculty Mentor":
                    tablename = "FacultyMentors";
                    break;
                case "Participant":
                    tablename = "Participants";
                    break;
                case "Sponsor":
                    tablename = "Spnosors";
                    break;
                default:
                    tablename = null;
                    break;
            }
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();

            SqlCommand cmd;
            String username = usernameTextBox.Text;
            String password = passwordTextBox.Text;
            String query = "SELECT * FROM '" + tablename + "' WHERE username = '" + username + "' AND password = '" + password + "'";
            cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader.HasRows)
            {
                Response.Write("<script>alert(Login Successful!);</script>");
                Response.Redirect(role + ".aspx");
            } else
            {
                Response.Write("<script>alert(Login Invalid, Try Again.);</script>");
            }

            
        } else
        {
            Response.Write("<script>alert('Please Select a User Role!');</script>");
        }
    }
}