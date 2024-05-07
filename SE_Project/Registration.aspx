<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="registration-container">
            <asp:Label ID="headingLabel" CssClass="label-heading" runat="server" Text="Registration" />
            <div class="form-group">
                <label for="fullnameTextBox">Full Name</label>
                <asp:TextBox ID="fullnameTextBox" CssClass="form-control" Text="" runat="server" />
            </div>
            <div class="form-group">
                <label for="emailTextBox">Email</label>
                <asp:TextBox ID="emailTextBox" CssClass="form-control" Text="" runat="server" />
            </div>
            <div class="form-group">
                <label for="phoneNumTextBox">Phone Number</label>
                <asp:TextBox ID="phoneNumTextBox" CssClass="form-control" Text="" runat="server" />
            </div>
            <div class="form-group">
                <label for="usernameTextBox">Username</label>
                <asp:TextBox ID="usernameTextBox" CssClass="form-control" Text="" runat="server" />
            </div>
            <div class="form-group">
                <label for="passwordTextBox">Password</label>
                <asp:TextBox ID="passwordTextBox" CssClass="form-control" Text="" runat="server" />
            </div>
            <asp:Button ID="registerButton" Text="Register" CssClass="btn btn-primary" runat="server" OnClick="registerEventMethod" />
        </div>
    </form>
</body>
</html>
