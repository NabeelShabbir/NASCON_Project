<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Administrator Page</h1>
            <p>Name: <asp:Label ID="nameLabel" runat="server"/></p>
            <p>Username: <asp:Label ID="usernameLabel" runat="server"/></p>
            <p>Email: <asp:Label ID="emailLabel" runat="server"/></p>
            <p>Phone: <asp:Label ID="phoneLabel" runat="server"/></p>

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


            <p>Create an Event?</p>
            <p style="text-align: left">Manage Faculty:
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Go to Faculty Manager" />
            </p>
        </div>
    </form>
</body>
</html>
