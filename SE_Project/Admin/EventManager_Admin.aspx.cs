using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EventManager_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridViewEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void registerEventMethod(object sender, EventArgs e)
    {
        string eventname = eventNameTextBox.Text;
        string date = dateTextBox.Text;
        string timing = timingTextBox.Text;
        string venue = venueTextBox.Text;
        string category = categoryTextBox.Text;
        string studentexec = studentexecTextBox.Text;
        string faculty = facultyTextBox.Text;

        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;

        string query = "INSERT INTO Events (eventName, date, timing, venue, categoryName, headUsername, mentorUsername) VALUES " +
            "(@eventname, @date, @timing, @venue, @category, @studentexec, @faculty)";
        conn.Open();
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue(eventname, "@eventname");
        cmd.Parameters.AddWithValue(date, "@date");
        cmd.Parameters.AddWithValue(timing, "@timing");
        cmd.Parameters.AddWithValue(venue, "@venue");
        cmd.Parameters.AddWithValue(category, "@category");
        cmd.Parameters.AddWithValue(studentexec, "@studentexec");
        cmd.Parameters.AddWithValue(faculty, "@faculty");

        try
        {
            cmd.ExecuteNonQuery();
            Response.Write("<script>Event Registered!</script>");
            BindGridView();
        } catch (SqlException ex)
        {
            Console.WriteLine("Exception" + ex.Message);
        }
        cmd.Dispose();
        conn.Close();
    }

    protected void BindGridView()
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            //SqlCommand cmd = new SqlCommand("SELECT A.username, A.fullname, A.email, A.phone FROM AllUsers A INNER JOIN FacultyMentors F ON A.username = F.username", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //GridViewFaculty.DataSource = dt;
            //GridViewFaculty.DataBind();
        }
    }
}