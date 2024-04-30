using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class SponsorDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCategoriesDropDownList();
            PopulatePackagesDropDownList();

        }
    }

    protected void submitEventMethod(object sender, EventArgs e)
    {
        string username = Session["username"].ToString();
        string repname = Session["fullname"].ToString();
        string password = Session["password"].ToString();
        string email = Session["email"].ToString();
        string phone = Session["phone"].ToString();

        string companyname = companyNameTextBox.Text;
        string category = categoriesDropDownList.SelectedValue;
        string cnic = cnicTextBox.Text;
        string package = packagesDropDownList.SelectedValue;

        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
        SqlConnection conn = new SqlConnection(connString);

        conn.Open();
        string query = @"UPDATE Sponsors SET company = @company, cnic = @cnic, category = @category, package = @package WHERE username = @username" ;
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@company", companyname);
        cmd.Parameters.AddWithValue("@cnic", cnic);
        cmd.Parameters.AddWithValue("@category", category);
        cmd.Parameters.AddWithValue("@package", package);

        cmd.Parameters.AddWithValue("@username", username);

        cmd.ExecuteNonQuery();

        cmd.Dispose();
        conn.Close();

        Session["username"] = username;
        Session["fullname"] = repname;
        Session["password"] = password;
        Session["email"] = email;
        Session["phone"] = phone;
        Session["company"] = companyname;
        Session["cnic"] = cnic;
        Session["category"] = category;
        Session["package"] = package;
        Response.Redirect("Sponsor.aspx");
    }

    protected void categoriesDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedCategory = categoriesDropDownList.SelectedValue;

        if (!string.IsNullOrEmpty(selectedCategory))
        {
            selectedCategoryLabel.Text = "Selected Category: " + selectedCategory;
        }
    }
    protected void packagesDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedPackage = packagesDropDownList.SelectedValue;

        if (!string.IsNullOrEmpty(selectedPackage))
        {
            selectedPackagesLabel.Text = "Selected Category: " + selectedPackage;
        }
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

    protected void PopulatePackagesDropDownList()
    {
        // Add predefined categories to the DropDownList
        categoriesDropDownList.Items.Add(new ListItem("Gold - Rs 100,000", "Gold"));
        categoriesDropDownList.Items.Add(new ListItem("Silver - Rs 60,000", "Silver"));
        categoriesDropDownList.Items.Add(new ListItem("Bronze - Rs 25,000", "Bronze"));
    }
}