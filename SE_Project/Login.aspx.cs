using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Activities.Expressions;
using System.Activities.Statements;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginEventMethod(object sender, EventArgs e) 
    {
        bool roleSelected = false;
        string role = null;


        if (adminRadioButton.Checked)
        {
            roleSelected = true;
            role = adminRadioButton.Text;
        } else if (studentexecRadioButton.Checked)
        {
            roleSelected = true;
            role = studentexecRadioButton.Text;
        } else if (participantRadioButton.Checked)
        {
            roleSelected = true;
            role = participantRadioButton.Text;
        } else if (facultyRadioButton.Checked)
        {
            roleSelected = true;
            role = facultyRadioButton.Text;
        } else if (sponsorRadioButton.Checked)
        {
            roleSelected = true;
            role = sponsorRadioButton.Text;
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
                    tablename = "Sponsors";
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
            String query = @"SELECT * FROM AllUsers AU INNER JOIN " + tablename + " R ON AU.username = R.username WHERE AU.username = @username AND AU.password = @password";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);

            try
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read() && reader.HasRows)
                {
                    Response.Write("<script>alert('Login Successful!');</script>");
                    Session["username"] = reader.GetString(1);
                    Session["fullname"] = reader.GetString(2);
                    Session["password"] = reader.GetString(3);
                    Session["email"] = reader.GetString(4);
                    Session["phone"] = reader.GetString(5);
                    Response.Redirect(role + ".aspx");
                }
                else
                {
                    Response.Write("<script>alert('Login Invalid, Try Again.');</script>");
                }

            } catch (SqlException ex)
            {
                Response.Write("<script>alert(\"Login failed. Exception:" + ex.Message.Replace("'", "\\'") + "\");</script>");
            }



        } else
        {
            Response.Write("<script>alert('Please Select a User Role!');</script>");
        }
    }
}