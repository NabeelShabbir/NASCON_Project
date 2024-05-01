using System;
using System.Data;
using System.Data.SqlClient;

public partial class UpdateFaculty_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["username"]))
            {
                string username = Request.QueryString["username"];
                usernameLabel.Text = username;

                // Retrieve and display existing faculty details
                PopulateFacultyDetails(username);
            }
            else
            {
                Response.Redirect("FacultyManager_Admin.aspx");
            }
        }
    }

    protected void PopulateFacultyDetails(string username)
    {
        // Retrieve faculty details from the database using the username
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT fullname, email, phone FROM AllUsers WHERE username = @username", con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                fullNameTextBox.Text = reader["fullname"].ToString();
                emailTextBox.Text = reader["email"].ToString();
                phoneTextBox.Text = reader["phone"].ToString();
            }
        }
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        string username = Request.QueryString["username"];
        string fullName = fullNameTextBox.Text;
        string email = emailTextBox.Text;
        string phone = phoneTextBox.Text;

        // Update faculty details in the database
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("UPDATE AllUsers SET fullname = @fullname, email = @email, phone = @phone WHERE username = @username", con);
            cmd.Parameters.AddWithValue("@fullname", fullName);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        // Redirect back to FacultyManager_Admin.aspx after updating
        Response.Redirect("FacultyManager_Admin.aspx");
    }
}
