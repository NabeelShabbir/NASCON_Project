using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class makeStudentBody : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCategoriesDropDownList();
        }
    }

    protected void categoriesDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedCategory = categoriesDropDownList.SelectedValue;

        if (!string.IsNullOrEmpty(selectedCategory))
        {
            selectedCategoryLabel.Text = "Selected Category: " + selectedCategory;
        }
    }

    protected void submitStudentBodyEventMethod(object sender, EventArgs e)
    {
        string studentBodyIDText = studentBodyIDTextBox.Text;
        string selectedCategory = categoriesDropDownList.SelectedValue;
        int studentBodyID = int.Parse(studentBodyIDText);
        string presUsername = presUsernameTextBox.Text;
        string vicepresUsername = vicepresUsernameTextBox.Text;
        string secretaryUsername = secretaryUsernameTextBox.Text;
        string member1Username = member1UsernameTextBox.Text;
        string member2Username = member2UsernameTextBox.Text;
        string member3Username = member3UsernameTextBox.Text;
        string member4Username = member4UsernameTextBox.Text;

        string[] fullnamesList = {presFullnameTextBox.Text, vicepresFullnameTextBox.Text, secretaryFullnameTextBox.Text, member1FullnameTextBox.Text, member2FullnameTextBox.Text, member3FullnameTextBox.Text, member4FullnameTextBox.Text };
        string[] passwordsList = {presPasswordTextBox.Text, vicepresPasswordTextBox.Text, secretaryPasswordTextBox.Text, member1PasswordTextBox.Text, member2PasswordTextBox.Text, member3PasswordTextBox.Text, member4PasswordTextBox.Text }; 



        string[] usernamesList = {presUsername, vicepresUsername, secretaryUsername, member1Username, member2Username, member3Username, member4Username };
        string[] studentRolesList = {"President", "Vice President", "Secretary", "Member", "Member", "Member", "Member" };

        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);
        
        conn.Open();

        


        for (int i = 0; i < 7; i++)
        {
            string query = @"INSERT AllUsers (username, fullname, password, userRole) VALUES (@username, @fullname, @password, 2)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", usernamesList[i]);
            cmd.Parameters.AddWithValue("@fullname", fullnamesList[i]);
            cmd.Parameters.AddWithValue("@password", passwordsList[i]);
            try
            {
                cmd.ExecuteNonQuery();

            } catch (SqlException ex) { Console.WriteLine("AllUsers Exception: " + ex.Message); }

            query = @"INSERT StudentBodies (studentBodyID, categoryName) VALUES (@studentBodyID, @category)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@studentBodyID", studentBodyID);
            cmd.Parameters.AddWithValue("@category", selectedCategory);
            
            try 
            { 
                cmd.ExecuteNonQuery(); 
            } catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    Console.WriteLine("StuBodies Duplicate Exception: " + ex.Message);
                    Response.Write("<script>alert(\"Student Body ID already exists. Please try again with a different Student Body ID.\");</script>");
                }
                else
                {
                    // Handle other SQL exceptions
                    Console.WriteLine("StuBodies Exception: " + ex.Message);
                    Response.Write("<script>alert(\"Failed. Exception:" + ex.Message.Replace("'", "\\'") + "\");</script>");
                }
            }

            query = @"INSERT StudentExecutives (studentBodyID, username, studentRole) VALUES (@studentBodyID, @studentUsername, @studentRole)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@studentBodyID", studentBodyID);
            cmd.Parameters.AddWithValue("@studentUsername", usernamesList[i]);
            cmd.Parameters.AddWithValue("@studentRole", studentRolesList[i]);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    Console.WriteLine("StudentExecutives Duplicate Exception: " + ex.Message);
                    Response.Write("<script>alert(\"Student Username already exists. Please try again with a different Student Username.\");</script>");
                }
                else
                {
                    // Handle other SQL exceptions
                    Console.WriteLine("StudentExecutives Exception: " + ex.Message);
                    Response.Write("<script>alert(\"Failed. Exception:" + ex.Message.Replace("'", "\\'") + "\");</script>");
                }
                Response.Redirect("Faculty Mentor.aspx");
            }

            query = @"INSERT StudentBodyMembers (studentBodyID, username, studentRole) VALUES (@studentBodyID, @studentUsername, @studentRole)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@studentBodyID", studentBodyID);
            cmd.Parameters.AddWithValue("@studentUsername", usernamesList[i]);
            cmd.Parameters.AddWithValue("@studentRole", studentRolesList[i]);
            cmd.ExecuteNonQuery();
            
            cmd.Dispose();
        }

        string updateQuery = "UPDATE Categories SET secretaryUsername = @SecretaryUsername WHERE categoryName = @CategoryName";
        SqlCommand updateCmd = new SqlCommand(updateQuery, conn);
        updateCmd.Parameters.AddWithValue("@SecretaryUsername", secretaryUsername);
        updateCmd.Parameters.AddWithValue("@CategoryName", selectedCategory);

        try
        {
            updateCmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {

            Console.WriteLine("updateQuery Exception: " + ex.Message);
        }

        updateCmd.Dispose();
        conn.Close();

        Response.Redirect("Faculty Mentor.aspx");

    }

    protected void PopulateCategoriesDropDownList()
    {
        // Add predefined categories to the DropDownList
        categoriesDropDownList.Items.Add(new ListItem("EE", "EE"));
        categoriesDropDownList.Items.Add(new ListItem("CS", "CS"));
        categoriesDropDownList.Items.Add(new ListItem("Business", "Business"));
        categoriesDropDownList.Items.Add(new ListItem("Sports", "Sports"));
        categoriesDropDownList.Items.Add(new ListItem("Social", "Social"));
    }

}