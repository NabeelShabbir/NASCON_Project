using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_Mentor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            usernameLabel.Text = Session["username"].ToString();
            nameLabel.Text = Session["fullname"].ToString();
            emailLabel.Text = Session["email"].ToString();
            phoneLabel.Text = Session["phone"].ToString();

            // Populate dropdown list with presidents' usernames
            // You can retrieve this data from the database

            //String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            //SqlConnection conn = new SqlConnection(connString);
            //conn.Open();

            //SqlCommand cmd;
            //String query = "SELECT username FROM StudentExecutives WHERE studentRole = 'President'";
            //cmd = new SqlCommand(query, conn);
            //String[] presidentUsernames = new string[6]; //At MAX 6 Student Bodies.
            //SqlDataReader rdr = cmd.ExecuteReader();
            //int i = 0;
            //while (rdr.Read() && rdr.HasRows)
            //{
            //    presidentUsernames[i] = rdr.GetString(i);
            //    i++;
            //}

            //presidentsDropDownList.DataSource = presidentUsernames;
            //presidentsDropDownList.DataTextField = "Username";
            //presidentsDropDownList.DataValueField = "Username";
            //presidentsDropDownList.DataBind();
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string query = "SELECT username FROM StudentExecutives WHERE studentRole = 'President'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        List<string> presidentUsernames = new List<string>(); 
                        while (rdr.Read())
                        {
                            string username = rdr.GetString(0); // Read username from the first column
                            presidentUsernames.Add(username);
                        }

                        // Set the dropdown list's data source and bind data
                        presidentsDropDownList.DataSource = presidentUsernames;
                        presidentsDropDownList.DataBind();
                    }
                }
            }




        }
    }

    protected void presidentsDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedPresident = presidentsDropDownList.SelectedValue;

        // Fetch and display details of the selected Student Executive Body and its members
        // You need to write code to query the database and populate the studentExecutivesDetails div
        PopulateStudentExecutivesDetails(selectedPresident);
    }

    private void PopulateStudentExecutivesDetails(string selectedPresident)
    {
        // Query the database to fetch details of the selected Student Executive Body
        // You can use ADO.NET or an ORM like Entity Framework for database operations
        // Once you have the data, populate the studentExecutivesDetails div with the information

        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        using (SqlConnection conn = new SqlConnection(connString))
        {
            conn.Open();

            string query = @"SELECT TOP 8 sbm.username, sbm.studentRole FROM StudentBodyMembers sbm JOIN StudentBodyMembers president ON sbm.studentBodyID = president.studentBodyID WHERE president.username = @username;";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", selectedPresident);

            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }

            studentExecutivesGridView.DataSource = dt;
            studentExecutivesGridView.DataBind();
        }

    }

    protected void addStudentBodyEventMethod(object sender, EventArgs e)
    {
        Response.Redirect("makeStudentBody.aspx");
    }


}