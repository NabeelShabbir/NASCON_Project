using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_EventManager_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    protected void GridViewEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string eventName = GridViewEvents.DataKeys[e.RowIndex].Value.ToString();
        DeleteEvent(eventName);
        BindGridView();
    }

    protected void registerEventMethod(object sender, EventArgs e)
    {
        string eventName = eventNameTextBox.Text;
        string date = dateTextBox.Text;
        string timing = timingTextBox.Value;
        string venue = venueTextBox.Text;
        string category = categoryTextBox.Text;
        string studentexec = studentexecTextBox.Text;
        string faculty = facultyTextBox.Text;

        InsertEvent(eventName, date, timing, venue, category, studentexec, faculty);
        BindGridView();
    }

    protected void BindGridView()
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT eventName, date, timing, venue, categoryName AS category, headUsername AS studentexec, mentorUsername AS facultymentor FROM Events", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewEvents.DataSource = dt;
            GridViewEvents.DataBind();
        }
    }





    protected void InsertEvent(string eventName, string date, string timing, string venue, string category, string studentexec, string faculty)
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);

        string query = "INSERT INTO Events (eventName, date, timing, venue, categoryName, headUsername, mentorUsername) VALUES (@eventName, @date, @timing, @venue, @category, @studentexec, @faculty)";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@eventName", eventName);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@timing", timing);
        cmd.Parameters.AddWithValue("@venue", venue);
        cmd.Parameters.AddWithValue("@category", category);
        cmd.Parameters.AddWithValue("@studentexec", studentexec);
        cmd.Parameters.AddWithValue("@faculty", faculty);

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Event Registered!');</script>");
        }
        catch (SqlException ex)
        {
            Console.WriteLine("Exception: " + ex.Message);
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
    }

    protected void DeleteEvent(string eventName)
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);

        string query = "DELETE FROM Events WHERE eventName = @eventName";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@eventName", eventName);

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Event Deleted!');</script>");
        }
        catch (SqlException ex)
        {
            Console.WriteLine("Exception: " + ex.Message);
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
    }

    protected void ShowCalendarButton_Click(object sender, EventArgs e)
    {
        EventCalendar.Visible = true;
    }

    protected void EventCalendar_SelectionChanged(object sender, EventArgs e)
    {
        dateTextBox.Text = EventCalendar.SelectedDate.ToShortDateString();
        EventCalendar.Visible = false;
    }
}
