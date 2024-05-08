<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty Mentor.aspx.cs" Inherits="Faculty_Mentor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Mentor</title>
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
        /* Centering the GridView */
        .gridview-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <a href="Login.aspx">Login Page</a> | <a href="ChooseRegistrationRole.aspx">Registration Page</a>
        </div>
        <div class="section">
            <h1>Faculty Mentor Details</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>
        </div>
        <div class="section">
            <h2>Manage Student Executives</h2>
            <asp:Button ID="addStudentBodyButton" runat="server" Text="Add a Student Body" OnClick="addStudentBodyEventMethod" />
            <p><b>Student Executive Details</b></p>
            <p>Select President of Student Body</p>
            <asp:DropDownList ID="presidentsDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="presidentsDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select President --" Value="" />
            </asp:DropDownList>
            <div class="gridview-container">
                <asp:GridView ID="studentExecutivesGridView" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="studentRole" HeaderText="Role" />
                        <asp:BoundField DataField="username" HeaderText="Username" />
                        <%--<asp:BoundField DataField="fullname" HeaderText="Full Name" />
                        <asp:BoundField DataField="password" HeaderText="Password" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>



            <%-- 
                Faculty mentors should have separate portal from where they can sign in.
                 Each category has one faculty mentor, and under each category, there are separate
                faculty mentors for each event.
                 One event can be mentored by only 1 faculty member.
                 1 faculty mentor can do mentorship of multiple events.
                 Faculty Mentors of event can view event and participants registered in only their
                assigned event.
                 Faculty mentor of category can view all event details and registrations of events under
                that category.
                 Faculty Mentor can also edit times and venue of events.
                 Faculty Mentor can also view the details of student executives in their respective
                category.
                 They can also add, delete or modify student executives.
                 Information of student executives can only be added by Faculty Mentors.
                --%>





            <%--<div id="studentExecutivesDetails" runat="server">
                <p>Role    |   Full Name    |   Username  |  </p>
                <p>President: </p> <asp:Label ID="presFullNameLabel" runat="server" /> <asp:Label ID="presUsernameLabel" runat="server" />
                <p>Vice President: </p> <asp:Label ID="vicepresFullNameLabel" runat="server" /> <asp:Label ID="vicepresUsernameLabel" runat="server" />
                <p>Secretary: </p> <asp:Label ID="secretaryFullNameLabel" runat="server" /> <asp:Label ID="secretaryUsernameLabel" runat="server" />
                <p>Member 1: </p> <asp:Label ID="mem1FullNameLabel" runat="server" /> <asp:Label ID="mem1UsernameLabel" runat="server" />
                <p>Member 2: </p> <asp:Label ID="mem2FullNameLabel" runat="server" /> <asp:Label ID="mem2UsernameLabel" runat="server" />
                <p>Member 3: </p> <asp:Label ID="mem3FullNameLabel" runat="server" /> <asp:Label ID="mem3UsernameLabel" runat="server" />
                <p>Member 4: </p> <asp:Label ID="mem4FullNameLabel" runat="server" /> <asp:Label ID="mem4UsernameLabel" runat="server" />
                <p>Member 5: </p> <asp:Label ID="mem5FullNameLabel" runat="server" /> <asp:Label ID="mem5UsernameLabel" runat="server" />
            </div>--%>