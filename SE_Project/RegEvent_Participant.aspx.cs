using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class RegEvent_Participant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["username"]))
            {
                string username = Request.QueryString["username"];
                usernameLabel.Text = username;

                // Load events for registration, excluding events where the user already has a ticket
                LoadEvents(username);

                // Load tickets for the username
                LoadTickets(username);
            }
            else
            {
                Response.Redirect("Participant.aspx");
            }
        }
    }


    protected void LoadTickets(string username)
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT T.eventID, E.eventName 
                FROM Tickets T
                INNER JOIN Events E ON T.eventID = E.eventID
                WHERE T.username = @username;
            ", con);
            cmd.Parameters.AddWithValue("@username", username);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewTickets.DataSource = dt;
            GridViewTickets.DataBind();
        }
    }

    protected void GridViewEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Register")
        {
            int eventID = Convert.ToInt32(e.CommandArgument);
            string username = usernameLabel.Text; // Assuming username is accessible from the label

            // Insert ticket into database
            InsertTicket(eventID, username);

            // Reload both events and tickets data after registration
            LoadEvents(username);
            LoadTickets(username);
        }
    }


    protected void InsertTicket(int eventID, string username)
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Tickets (eventID, username) VALUES (@eventID, @username)", con);
            cmd.Parameters.AddWithValue("@eventID", eventID);
            cmd.Parameters.AddWithValue("@username", username);

            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    protected void LoadEvents(string username)
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            // Select events where the username does not have a ticket
            SqlCommand cmd = new SqlCommand(@"
            SELECT E.eventID, E.eventName, E.date, E.timing, E.venue 
            FROM Events E
            LEFT JOIN Tickets T ON E.eventID = T.eventID AND T.username = @username
            WHERE T.username IS NULL;
        ", con);
            cmd.Parameters.AddWithValue("@username", username);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewEvents.DataSource = dt;
            GridViewEvents.DataBind();
        }
    }

}
