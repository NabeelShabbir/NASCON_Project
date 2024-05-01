using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    String role = "Participant";
    protected void Page_Load(object sender, EventArgs e)
    {
        role = Session["Role"].ToString();
        if (!IsPostBack)
        {
            headingLabel.Text = role + " Registration";
        }
    }

    protected void registerEventMethod(object sender, EventArgs e)
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        string name = fullnameTextBox.Text;
        string email = emailTextBox.Text;
        string phone = phoneNumTextBox.Text;
        string username = usernameTextBox.Text;
        string password = passwordTextBox.Text;
        string tablename = null;
        int userRole = 0;
        switch (role)
        {
            case "Administrator":
                tablename = "Administrators";
                userRole = 1;
                break;
            case "Student Executive":
                tablename = "StudentExecutives";
                userRole = 2;
                break;
            case "Faculty Mentor":
                tablename = "FacultyMentors";
                userRole = 3;
                break;
            case "Participant":
                tablename = "Participants";
                userRole = 5;
                break;
            case "Sponsor":
                tablename = "Sponsors";
                userRole = 4;
                break;
            default:
                userRole = 0;
                break;
        }

        // Protects against SQL Injection attacks
        string query = "INSERT INTO AllUsers (username, fullname, password, email, phone, userRole) " +
                   "VALUES (@username, @fullname, @password, @email, @phone, @userRole)";

        conn.Open();
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@fullname", name);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@phone", phone);
        cmd.Parameters.AddWithValue("@userRole", userRole);

        Session["username"] = username;
        Session["fullname"] = name;
        Session["password"] = password;
        Session["email"] = email;
        Session["phone"] = phone;

        try
        {
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert(\"Registration successful\");</script>");
            query = "INSERT INTO " + tablename + " (username) VALUES ('" + username + "');";
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            if (userRole == 4)
            {
                Response.Redirect("SponsorDetails.aspx");
            } else
            {
                Response.Redirect(role + ".aspx");
            }

        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                // Inform the user to try again with a different username
                Response.Write("<script>alert(\"Username already exists. Please try again with a different username.\");</script>");
            }
            else
            {
                // Handle other SQL exceptions
                Response.Write("<script>alert(\"Registration failed. Exception:" + ex.Message.Replace("'", "\\'") + "\");</script>");
            }
        }

        cmd.Dispose();
        conn.Close();
    }
}