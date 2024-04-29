<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student Executive.aspx.cs" Inherits="Student_Executive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Executive</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Student Executive Page</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>

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

        </div>
    </form>
</body>
</html>
