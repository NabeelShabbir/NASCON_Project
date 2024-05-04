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

    protected void btnDeal1_Click(object sender, EventArgs e)
    {
        ApplyDeal(1); // Deal 1: 3 Burgers, Fries, and 3 Drinks for Rs 1200
    }

    protected void btnDeal2_Click(object sender, EventArgs e)
    {
        ApplyDeal(2); // Deal 2: 4 Burgers, Fries, and 4 Drinks for Rs 1500
    }

    protected void btnDeal3_Click(object sender, EventArgs e)
    {
        ApplyDeal(3); // Deal 3: 1 Burger, Fries, and 1 Drink for Rs 500
    }

    protected void ApplyDeal(int dealNumber)
    {
        // Check if the user has any tickets for events
        string username = usernameLabel.Text; // Assuming username is accessible from the label
        if (HasTickets(username))
        {
            // Implement logic to apply the selected deal
            string dealMessage = "";
            switch (dealNumber)
            {
                case 1:
                    dealMessage = "3 Burgers, Fries, and 3 Drinks for Rs 1200 applied!";
                    break;
                case 2:
                    dealMessage = "4 Burgers, Fries, and 4 Drinks for Rs 1500 applied!";
                    break;
                case 3:
                    dealMessage = "1 Burger, Fries, and 1 Drink for Rs 500 applied!";
                    break;
            }
            // Display message or perform further actions as needed
            Response.Write("<script>alert('" + dealMessage + "');</script>");
        }
        else
        {
            // Prompt the user to register for an event first
            Response.Write("<script>alert('You need to register for an event before applying a food deal.');</script>");
        }
    }

    // Method to check if the user has any tickets for events
    protected bool HasTickets(string username)
    {
        // Replace "Your_Connection_String" with your actual connection string
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Tickets WHERE username = @username", con);
            cmd.Parameters.AddWithValue("@username", username);

            con.Open();
            int ticketCount = (int)cmd.ExecuteScalar();
            return ticketCount > 0;
        }
    }
    protected void btnGenerateTicket_Click(object sender, EventArgs e)
    {

        string username = usernameLabel.Text;
        Response.Redirect("EntryTicket_Participant.aspx?username=" + username);
    }

}
