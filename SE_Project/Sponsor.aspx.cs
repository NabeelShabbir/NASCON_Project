using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            conn.Open();
            string query = @"SELECT AU.username, AU.fullname, email, phone, company, cnic, category, package FROM AllUsers AU, Sponsors S WHERE AU.username = @username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", usernameLabel.Text);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader.HasRows)
            {
                repNameLabel.Text = reader.GetString(1);
                emailLabel.Text = reader.GetString(2);
                phoneLabel.Text = reader.GetString(3);
                companyNameLabel.Text = reader.GetString(4);
                categoryLabel.Text = reader.GetString(6);
                packageLabel.Text = reader.GetString(7);
                cnicLabel.Text = reader.GetString(5);
            }
        }
    }
}