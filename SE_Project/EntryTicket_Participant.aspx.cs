using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class EntryTicket_Participant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the username parameter exists in the query string
        if (!string.IsNullOrEmpty(Request.QueryString["username"]))
        {
            string username = Request.QueryString["username"].ToString();

            // Connection string to your database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

            // SQL query to retrieve participant information based on username
            string query = "SELECT fullname, email, phone, cnic FROM AllUsers INNER JOIN Participants ON AllUsers.username = Participants.username WHERE AllUsers.username = @Username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter for username to prevent SQL injection
                    command.Parameters.AddWithValue("@Username", username);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve participant information
                        string fullname = reader["fullname"].ToString();
                        string email = reader["email"].ToString();
                        string phone = reader["phone"].ToString();
                        string cnic = reader["cnic"].ToString();

                        // Assign the retrieved values to the label controls
                        lblFullName.Text = fullname;
                        lblEmail.Text = email;
                        lblPhone.Text = phone;
                        lblCNIC.Text = cnic;
                    }
                    else
                    {
                        Response.Write("Participant not found.");
                    }
                }
            }

            // Display participant's tickets
            DisplayTickets(username, connectionString);

            LoadFoodDeal(username);
        }
        else
        {
            Response.Write("No username provided in the query string.");
        }
    }
    protected void LoadFoodDeal(string username)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT dealNumber FROM FoodDeals WHERE username = @username", con);
            cmd.Parameters.AddWithValue("@username", username);

            con.Open();
            object dealNumberObj = cmd.ExecuteScalar();
            if (dealNumberObj != null)
            {
                int dealNumber = Convert.ToInt32(dealNumberObj);
                fooddeal.Text = GetDealMessage(dealNumber);
            }
            else
            {
                fooddeal.Text = "No food deal applied";
            }
        }
    }

    protected string GetDealMessage(int dealNumber)
    {
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
            default:
                dealMessage = "Unknown deal";
                break;
        }
        return dealMessage;
    }
// Method to display tickets in GridView
private void DisplayTickets(string username, string connectionString)
    {
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
}
