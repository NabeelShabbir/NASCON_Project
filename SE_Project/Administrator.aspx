<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Administrator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator</title>
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
            <h1>Administrator Details</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>
        </div>
        <div class="section">
            <h1>Management Actions</h1>
            <p>Manage Events:
                <asp:Button ID="eventsButton" Text="Go to Events Manager" OnClick="eventManagerMethod" runat="server" CssClass="apply-button" />
            </p>
            <p style="text-align: left">Manage Faculty:
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Go to Faculty Manager" CssClass="apply-button" />
            </p>
        </div>
    </form>
</body>
</html>




<%--            
             Application should contain separate portal for administration.
             There should be an option to create new Admin accounts, delete and modify existing
            ones.
             Admin can add, delete or modify faculty Mentors (EMP_ID, NAME, Category
            Assigned).
             Admin can also add, delete or modify student executives.
             New event can be added or deleted by the Admin. Event should contain event name,
            event date, event time, venue, assigned faculty mentor and student head.
             Admin can also add or delete Sponsors.--%>