using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class FacultyManager_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    protected void BindGridView()
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT A.username, A.fullname, A.email, A.phone FROM AllUsers A INNER JOIN FacultyMentors F ON A.username = F.username", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewFaculty.DataSource = dt;
            GridViewFaculty.DataBind();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btnUpdate = (Button)sender;
        string username = btnUpdate.CommandArgument;
        // Redirect to FacultyDetails.aspx with the username as a query parameter
        Response.Redirect("UpdateFaculty_Admin.aspx?username=" + username);
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
        string tablename = "FacultyMentors";
        int userRole = 3;

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


        try
        {
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert(\"Registration successful\");</script>");
            query = "INSERT INTO " + tablename + " (username) VALUES ('" + username + "');";
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            BindGridView();
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

    protected void GridViewFaculty_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string username = GridViewFaculty.DataKeys[e.RowIndex].Value.ToString();

        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM FacultyMentors WHERE username = @username; DELETE FROM AllUsers WHERE username = @username;", con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        // Rebind the GridView after deletion
        BindGridView();
    }
}
