<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty Mentor.aspx.cs" Inherits="Faculty_Mentor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Mentor</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Faculty Mentor Page</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>


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

            <h3>Manage Student Executives</h3>
            <asp:DropDownList ID="presidentsDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="presidentsDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select President --" Value="" />
            </asp:DropDownList>

            <div id="studentExecutivesDetails" runat="server">
                <!-- Details about selected Student Executive Body will be displayed here -->
            </div>



        </div>
    </form>
</body>
</html>
