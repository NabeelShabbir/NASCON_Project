<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateFaculty_Admin.aspx.cs" Inherits="UpdateFaculty_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Faculty</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Update Faculty: <asp:Label ID="usernameLabel" runat="server" Text=""></asp:Label></h1>
            
            <p>Full Name:</p>
            <asp:TextBox ID="fullNameTextBox" runat="server"></asp:TextBox>
            
            <p>Email:</p>
            <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
            
            <p>Phone:</p>
            <asp:TextBox ID="phoneTextBox" runat="server"></asp:TextBox>
            
            <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" />
        </div>
    </form>
</body>
</html>
