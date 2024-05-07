using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Participant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string username = Session["username"].ToString();
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            conn.Open();
            string query = @"SELECT AU.username, fullname, email, phone, cnic FROM AllUsers AU JOIN Participants P ON P.username = AU.username WHERE P.username = @username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("username", username);
            
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader.HasRows)
            {
                usernameLabel.Text = reader["username"].ToString();
                nameLabel.Text = reader["fullname"].ToString();
                emailLabel.Text = reader["email"].ToString();
                phoneLabel.Text = reader["phone"].ToString();
                cnicLabel.Text = reader["cnic"].ToString();
            }
            else
            {
                Response.Write("<script>No Participants in DB Table</script>");
            }

            cmd.Dispose();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = usernameLabel.Text;
        // Redirect to FacultyDetails.aspx with the username as a query parameter
        Response.Redirect("RegEvent_Participant.aspx?username=" + username);
    }
}