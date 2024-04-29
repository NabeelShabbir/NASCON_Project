<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="headingLabel" Text="Registration" runat="server" />

            <p>Enter Full Name</p>
            <asp:TextBox ID="fullnameTextBox" Text="" runat="server" />
            <p>Enter Email</p>
            <asp:TextBox ID="emailTextBox" Text="" runat="server" />
            <p>Enter Phone Number</p>
            <asp:TextBox ID="phoneNumTextBox" Text="" runat="server" />            
            <p>Enter Username</p>
            <asp:TextBox ID="usernameTextBox" Text="" runat="server" />            
            <p>Enter Password</p>
            <asp:TextBox ID="passwordTextBox" Text="" runat="server" />

            <asp:Button ID="registerButton" Text="Register" runat="server" OnClick="registerEventMethod" />
        </div>
    </form>
</body>
</html>
