using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Student_Executive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            usernameLabel.Text = Session["username"].ToString();
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            conn.Open();
            string query = @"SELECT username, fullname, email, phone FROM AllUsers WHERE username = @username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", usernameLabel.Text);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader.HasRows)
            {
                nameLabel.Text = reader.GetString(1);
                usernameLabel.Text = reader.GetString(0);
                try
                {
                    emailLabel.Text = reader.GetString(2);
                } catch (SqlNullValueException ex)
                {
                    emailLabel.Text = "Unassigned, Ask your Faculty Mentor to assign it for you.";
                }
                try
                {
                    phoneLabel.Text = reader.GetString(3);
                }
                catch (SqlNullValueException ex)
                {
                    phoneLabel.Text = "Unassigned, Ask your Faculty Mentor to assign it for you.";
                }
            }
        }
    }
}