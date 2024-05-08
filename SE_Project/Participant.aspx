<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Participant.aspx.cs" Inherits="Participant" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Participant</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .navbar {
                background-color: #333;
                color: #fff;
                padding: 10px 0;
                text-align: center;
            }
            .navbar a {
                color: #fff;
                text-decoration: none;
                margin: 0 10px;
            }
            .section {
                padding: 20px;
                margin: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .apply-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .apply-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="navbar">
                <a href="Login.aspx">Login Page</a> | <a href="ChooseRegistrationRole.aspx">Registration Page</a>
            </div>
            <div class="section">
                <h1>Participant Details</h1>
                <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
                <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
                <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
                <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>
                <p>CNIC: <asp:Label ID="cnicLabel" runat="server"/></p>
            </div>
            <div class="section">
                <h1>Apply for an Event</h1>
                <asp:Button ID="Button1" runat="server" Text="Apply Now" OnClick="Button1_Click" />
            </div>
        </form>
    </body>
</html>

