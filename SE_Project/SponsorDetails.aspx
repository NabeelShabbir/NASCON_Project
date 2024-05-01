<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SponsorDetails.aspx.cs" Inherits="SponsorDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sponsor Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Enter Sponsor Details</h2>

            <p>Company Name:</p> <asp:TextBox ID="companyNameTextBox" runat="server" />

            <p>CNIC:</p> <asp:TextBox ID="cnicTextBox" runat="server" />


            <p>Select Category to Sponsor:</p>
            <asp:DropDownList ID="categoriesDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="categoriesDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select Category --" Value="" />
            </asp:DropDownList>
            <asp:Label ID="selectedCategoryLabel" Text="Selected Category:" runat="server" />

            <p>Select Sponsorship Package:</p>
            <asp:DropDownList ID="packagesDropDownList" AutoPostBack="true" OnSelectedIndexChanged="packagesDropDownList_SelectedIndexChanged" runat="server" >
                <asp:ListItem Text="-- Select Package --" Value="" />
            </asp:DropDownList>
            <asp:Label ID="selectedPackagesLabel" Text="Selected Package:" runat="server" />

            <asp:Button ID="submitButton" Text="Submit" OnClick="submitEventMethod" runat="server" />
        </div>
    </form>
</body>
</html>
