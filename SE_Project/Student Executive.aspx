<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student Executive.aspx.cs" Inherits="Student_Executive" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Executive</title>
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
            <h1>Student Executive Details</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>
        </div>
    </form>
</body>
</html>



            <%-- 
                NaSCon is managed by student executive body. Apart from the above-mentioned categories,
there are few other management departments such as sponsorship, marketing, operations,
security, logistic etc. A separate student body is working for each management department.
The roles of the students in the executive body are as follows.
o 1 president
o 1 Vice President
o 1 separate secretary for each category.
o 1 separate event head for each event.
o Members in each team.
 Each team must at least contain 4 members and at max 6 members.
 Information of student executives can only be added by Faculty Mentors.
 Student executives’ information (roll_no, first name, last name, batch, event assigned,
role) must be saved in DB.
                --%>