using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ParticipantDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitEventMethod(object sender, EventArgs e)
    {
        string cnic = cnicTextBox.Text;
        string username = Session["username"].ToString();

        string query = @"UPDATE Participants SET cnic = @cnic WHERE username = @username";
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);

        conn.Open();

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("username", username);
        cmd.Parameters.AddWithValue("cnic", cnic);
        
        cmd.ExecuteNonQuery();
        cmd.Dispose();

        conn.Close();
        Session["cnic"] = cnic;

        Response.Redirect("Participant.aspx");
    }

}